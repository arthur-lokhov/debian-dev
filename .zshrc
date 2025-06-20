#-----------------
#---- Plugins ----
#-----------------

# Configure Zap
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Install plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"

#-----------------
#---- Aliases ----
#-----------------

# Base
alias c="clear"
alias cls="clear"
alias v="nvim"
alias ref='source ~/.zshrc'

# Debian
alias aptu="sudo nala update && sudo nala upgrade"
alias clsf="clear && fastfetch && cpufetch"

# Tmux
alias tmas="tmux attach-session -t"
alias tmks="tmux kill-session -t"
alias tmls="tmux ls"

# Dotnet - Core
alias dn="dotnet"
alias dnb="dotnet build"
alias dnr="dotnet run"
alias dnt="dotnet test"
alias dnc="dotnet clean"
alias dnrest="dotnet restore"
alias dninfo="dotnet --info"
alias dnclear="rm -rf bin obj"

# Dotnet - Publish
alias dnp="dotnet publish"
alias dnpw="dotnet publish -c Release -r win-x64 --self-containerd true"
alias dnpn="dotnet publish -c Release -r linux-x64 --self-containerd true"

# Dotnet - Tools
alias dntools="dotnet tool list --global"
alias dninstall="dotnet tool install --global"
alias dnupdate="dotnet tool update --global"

# Dotnet - Entity Framework
alias dnef="dotnet ef"
alias dnefmig="dotnet ef migrations add"
alias dnefupd="dotnet ef database update"
alias dnefdrop="dotnet ef database drop -f"

# Dotnet - Templates
alias dnnew="dotnet new"
alias dnfd="dotnet new search"
alias dnls="dotnet new list"
alias dngbl="dotnet new --install"
alias dnuninst="dotnet new --uninstall"

# Dotnet - Tests
alias dntw="dotnet test --logger \"trx;LogFileName=test_results.trx\""
alias dntc="dotnet test --collect:\"Code Coverage\""

# Dothet - Other
alias csproj="fd . -e csproj"
alias sln="fd . -e sln"
alias slnx="fd . -e slnx"
alias watch="dotnet watch run"
alias watcht="dotnet watch test" 

# Git - Core
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gca="git commit --amend"
alias gcm="git commit -m"
alias gp="git push"
alias gpu="git push -u origin HEAD"
alias gpf="git push --force"
alias gpl="git pull"
alias gl="git log --oneline --graph --decorate --all"

# Git - Branches
alias gb="git branch"
alias gba="git branch -a"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gsw="git switch"
alias gswc="git switch -c"
alias gbd="git branch -d"
alias gbD="git branch -D"

# Git - Remote
alias gr="git remote -v"
alias gru="git remote update"
alias grs="git remote show origin"
alias gcl="git clone"

# Git - Clear
alias grhh="git reset --hard HEAD"
alias gstash="git stash"
alias gstashp="git stash pop"
alias gclean="git clean -fd"

# Git - Show changes
alias gd="git diff"
alias gds="git diff --staged"
alias gdc="git diff --cached"
alias glg="git log --oneline --graph --all --decorate"
alias gblame="git blame"
alias gshow="git show"

# Git - Submodules
alias gtags="git tag"
alias gtag="git tag -a"
alias gsub="git submodule update --init --recursive"

# Change default tools to alternative
alias cat="batcat -p -P --theme base16"
alias cd="z"
alias l="eza -l --git -a --icons"
alias lt="eza --tree --level=2 --long --git --icons"
alias ltree="eza --tree --level=2 --git --icons"
alias du="dust"
alias ps="procs"
alias sed="sd"
alias rm="trash"

# Other
alias http="xh"

#-----------------
#---- Exports ----
#-----------------

# Node Version Manager
export PATH="$HOME/.cargo/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

#---------------
#---- Evals ----
#---------------

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

#-----------------
#---- Sources ----
#-----------------

. "$HOME/.cargo/env"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#--------------------
#---- Completion ----
#--------------------

# Load and initialise completion system
autoload -Uz compinit
compinit

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
