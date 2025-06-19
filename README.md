# ⚙️ Setting up Debian for Development

This guide will help you prepare a Debian system for **comfortable** and **productive** development, including installing necessary packages, configuring the graphical environment, and useful services.

---

## 📦 Configuring Debian Repositories

### 🐧 **Nala** – a convenient replacement for apt

A handy package manager with a pretty output:

```bash
sudo apt install nala
```

### 🔄 Switching to the SID (testing) branch

To use the latest package versions, switch to SID:

```bash
sudo nano /etc/apt/sources.list
```

Replace all occurrences of `bookworm` (or another release) with `sid`.

Update the package list and the system:

```bash
sudo nala update && sudo nala upgrade
```

### 🛠️ Adding 32-bit architecture

For 32-bit app support, such as Wine:

```bash
sudo dpkg --add-architecture i386
sudo nala update
```

### 🔄 System Reboot

It is recommended to reboot after updates:

```bash
sudo shutdown -r now
```

---

## 🛠️ Installing Essential Utilities

### ⚙️ Installing Zsh and Changing Default Shell

Install `zsh`:

```bash
sudo nala install zsh
chsh -s $(which zsh)
```

Install a plugin manager for Zsh:

```bash
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) \
  --branch release-v1 --keep
```

### 🔧 System Libraries and Build Tools

Required for compiling and installing various packages, especially via `cargo`:

```bash
sudo nala install -y \
    build-essential \
    pkg-config \
    uidmap \
    libssl-dev \
    libudev-dev \
    libxcb-shape0-dev \
    libxcb-xfixes0-dev \
    libxkbcommon-dev \
    libc6 \
    libgcc-s1 \
    libgssapi-krb5-2 \
    libicu72 \
    libssl3 \
    libstdc++6 \
    zlib1g \
    unzip \
    zip \
    gnupg2 \
    git \
    curl
```

### 💻 Command-line and Interface Utilities

Helpful tools for everyday work and diagnostics:

```bash
sudo nala install -y \
    tmux \
    direnv \
    git-delta \
    stow \
    zoxide \
    starship \
    trash-cli \
    eza \
    bat \
    fzf \
    ripgrep \
    sd \
    fastfetch \
    cpufetch \
    procs \
    du-dust \
    htop \
    glances \
    xh \
    jq
```

| Utility       | Description                                                        |
| ------------- | ------------------------------------------------------------------ |
| **tmux**      | Terminal multiplexer: manage multiple sessions in one window       |
| **direnv**    | Automatically loads environment variables from `.envrc`            |
| **git-delta** | Beautiful and readable `git diff` and `git blame` output           |
| **stow**      | Manage dotfiles using symbolic links                               |
| **zoxide**    | Better `cd` command, remembers most used directories               |
| **starship**  | Cross-shell fast prompt for Zsh/Bash/Fish                          |
| **trash-cli** | Safer `rm` alternative: moves files to trash instead               |
| **eza**       | Modern replacement for `ls` with icons and tree view               |
| **bat**       | Syntax-highlighted file viewer (`cat`, but prettier)               |
| **fzf**       | Instant fuzzy search for files, history, commands                  |
| **ripgrep**   | Fast text searching tool, a `grep` alternative                     |
| **sd**        | Fast and user-friendly `sed` replacement with Rust-like syntax     |
| **fastfetch** | Fast system info fetcher (like `neofetch`, but faster)             |
| **cpufetch**  | ASCII-art processor info display                                   |
| **procs**     | Modern `ps` replacement with nicer output                          |
| **du-dust**   | `du` alternative showing folder sizes clearly                      |
| **htop**      | Interactive process monitor                                        |
| **glances**   | Real-time system monitoring                                        |
| **xh**        | Handy CLI tool for HTTP requests (alternative to `curl`, `httpie`) |
| **jq**        | JSON parser and processor for the terminal                         |

Install the latest NeoVim version(because 0.10.x doesn't support some plugins):

```bash
wget https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.tar.gz
tar xzvf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/
sudo ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
```

Install the tmux plugin manager:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 🦀 Installing Rust (Cargo)

> [!NOTE]
> We need Cargo in case some tools aren’t in the main Debian repos.
> For example, `eza` was not available until recently.

Many modern CLI tools are written in Rust and installed via `cargo`. Install Rust:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

After installation, restart the terminal or run:

```bash
source "$HOME/.cargo/env"
```

---

## ⚙️ Driver Setup

Ensure proper system operation with drivers:

- **XanMod kernel** update for performance and compatibility;
- **NVIDIA** driver installation;
- **Audio**, **Bluetooth**, and **Printer** setup.

### 🧠 Installing and Configuring XanMod Kernel

**XanMod** is an optimized Linux kernel with better performance and low latency.

More info [xanmod.org](https://xanmod.org/).

```bash
wget -qO - https://dl.xanmod.org/archive.key | sudo gpg --dearmor -vo /etc/apt/keyrings/xanmod-archive-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-release.list
wget https://dl.xanmod.org/check_x86-64_psabi.sh
sudo chmod +x ./check_x86-64_psabi
sudo nala update && sudo nala install -y linux-xanmod-x64v3
rm -f check_x86-64_psabi
sudo shutdown -r now
```

### 🎮 Installing Nvidia Drivers

> [!WARNING]
> I use **Nvidia**, but you may have **Intel** or **AMD**.
> Please refer to relevant documentation for your hardware.

```bash
sudo nala install -y nvidia-driver firmware-misc-nonfree
```

### 🔊 Audio Setup (PipeWire + WirePlumber)

**PipeWire** is a modern alternative to PulseAudio and JACK.

```bash
sudo nala install -y pipewire
sudo nala install -y pipewire-audio-client-libraries
```

Enable the WirePlumber service:

```bash
systemctl --user enable --now wireplumber
```

### 📶 Bluetooth Setup

```bash
sudo nala install bluetooth bluez bluez-tools bluez-firmware bluez-cups
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
```

### 🖨️ Printer Support and Setup

Install **CUPS** and management interface:

```bash
sudo nala install cups printer-driver-all system-config-printer
sudo systemctl enable cups
sudo systemctl start cups
```

Go to [http://localhost:631](http://localhost:631) to:

- Add USB or network printers;
- Configure drivers and print settings;
- Manage the print queue.

> [!NOTE]
> If you use HP printers, install:
> `sudo nala install -y hplip-gui`

### 🔄 Reboot System

```bash
sudo shutdown -r now
```

---

## 🖥️ Desktop Environment Setup

### 🖥️ Installing Xorg (Display Server)

```bash
sudo nala install -y xserver-xorg-core xserver-xorg xinit xclip dbus-x11 lxpolkit
```

### 🪟 Installing i3 and Related Tools

```bash
sudo nala install -y alacritty i3 sxhkd dunst picom polybar rofi nitrogen flameshot
```

| Name          | Description                                             |
| ------------- | ------------------------------------------------------- |
| **alacritty** | Fast and modern terminal emulator with GPU acceleration |
| **i3**        | Tiling window manager                                   |
| **sxhkd**     | Hotkey daemon                                           |
| **dunst**     | Lightweight and customizable notification daemon        |
| **picom**     | Compositor for transparency and shadows                 |
| **polybar**   | Customizable status bar                                 |
| **rofi**      | Application launcher and window switcher                |
| **nitrogen**  | Wallpaper manager                                       |
| **flameshot** | Screenshot utility                                      |

### 🔐 Auto-login and i3 Startup

Enable auto-login with `getty`:

```bash
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo tee /etc/systemd/system/getty@tty1.service.d/override.conf <<EOF
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin your_username --noclear %I \$TERM
EOF
```

Then add this to `.zprofile` or `.bash_profile`:

```bash
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx
fi
```

### 🔒 Allow Shutdown/Reboot Without Sudo

Чтобы отключить запрос пароля при shutdown/reboot, создайте файл:

```bash
sudo visudo -f /etc/sudoers.d/shutdown-nopasswd
```

Add:

```sudoers
your_username ALL=(ALL) NOPASSWD: /sbin/shutdown, /sbin/reboot, /sbin/poweroff
```

---

## 🧰 Installing GUI Applications

```bash
sudo nala install -y \
    firefox-esr \
    thunar \
    xfce4-taskmanager \
    pavucontrol \
    blueman \
    ark \
    galculator \
    mpv \
    zathura \
    gpicview \
    audacity \
    simplescreenrecorder \
    kdenlive
```

| Application            | Purpose                                 |
| ---------------------- | --------------------------------------- |
| `firefox-esr`          | Long-term support web browser           |
| `thunar`               | Lightweight file manager (XFCE)         |
| `xfce4-taskmanager`    | Lightweight task manager                |
| `pavucontrol`          | GUI audio control (PulseAudio)          |
| `blueman`              | Bluetooth management panel              |
| `ark`                  | Archiving tool (Qt)                     |
| `galculator`           | Simple calculator (GTK)                 |
| `mpv`                  | Versatile media player                  |
| `zathura`              | Keyboard-driven PDF viewer              |
| `gpicview`             | Lightweight image viewer                |
| `audacity`             | Audio editor and recorder               |
| `simplescreenrecorder` | Minimalist screen recording tool        |
| `kdenlive`             | Powerful and user-friendly video editor |

### 🧩 Manually Installed Apps

**OnlyOffice** – alternative to LibreOffice:

```bash
wget https://github.com/ONLYOFFICE/DesktopEditors/releases/latest/download/onlyoffice-desktopeditors_amd64.deb
sudo nala install onlyoffice-desktopeditors_amd64.deb
rm -rf onlyoffice-desktopeditors_amd64.deb
```

**Vial** – QMK-based keyboard configurator:

```bash
wget https://github.com/vial-kb/vial-gui/releases/download/v0.7.3/Vial-v0.7.3-x86_64.AppImage
sudo chmod +x ./Vial-v0.7.3-x86_64.AppImage
export USER_GID=`id -g`; sudo --preserve-env=USER_GID sh -c 'echo "KERNEL==\"hidraw*\", SUBSYSTEM==\"hidraw\", ATTRS{serial}==\"*vial:f64c2b3c*\", MODE=\"0660\", GROUP=\"$USER_GID\", TAG+=\"uaccess\", TAG+=\"udev-acl\"" > /etc/udev/rules.d/99-vial.rules && udevadm control --reload && udevadm trigger'
./Vial-v0.7.3-x86_64.AppImage
```

**Nekoray** – Xray client:

```bash
wget https://github.com/MatsuriDayo/nekoray/releases/download/4.0.1/nekoray-4.0.1-2024-12-12-debian-x64.deb
sudo nala install ./nekoray-4.0.1-2024-12-12-debian-x64.deb
rm -rf nekoray-4.0.1-2024-12-12-debian-x64.deb
```

### 🎨 GUI Appearance Customization

Install theming and icon tools:

```bash
sudo nala install -y \
    lxappearance \
    qt5ct qt6ct \
    qt-style-kvantum \
    arc-theme \
    papirus-icon-theme
```

Add the following to `~/.bash_profile` or `~/.zprofile`:

```bash
export QT_QPA_PLATFORMTHEME=qt5ct
export QT6CT_PLATFORMTHEME=qt6ct
export QT_STYLE_OVERRIDE=kvantum
```

Then configure your theme and icons in `lxappearance` and `kvantum-manager` and reboot.

### 🎨 Nerd Fonts Support

For proper icons in the prompt and CLI tools:

```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/UbuntuMono.zip
unzip UbuntuMono.zip -d um
sudo mkdir /usr/share/fonts/UbuntuMonoNF
sudo cp um/*.ttf /usr/share/fonts/UbuntuMonoNF/
sudo fc-cache -fv
rm -rf um
```

---

## 🗂️ Dotfiles Installation and Usage

**Dotfiles** are config files that store your personal settings for the shell, editors, tools, and window manager.

### 🔗 Installing Dotfiles via Stow

Make sure your dotfiles are in `~/.dotfiles`. Then run:

```bash
cd ~/.dotfiles
stow .
```

### ✅ Installing My Dotfiles

If you don't have your own dotfiles, use mine:

```bash
git clone https://github.com/arthur-lokhov/debian-dev.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

