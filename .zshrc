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

# Change default tools to alternative
alias cat="batcat -p -P --theme base16"
alias cd="z"
alias l="eza -l --git -a --icons"
alias lt="eza --tree --level=2 --long --git --icons"
alias ltree="eza --tree --level=2 --git --icons"
alias du="dust"
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
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export UV_PYTHON="~/.local/share/uv/python/cpython-3.14.0b3-linux-x86_64-gnu/bin"
export PATH="$UV_PYTHON:$PATH"

#---------------
#---- Evals ----
#---------------

eval "$(goenv init -)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

#-----------------
#---- Sources ----
#-----------------

. "$HOME/.cargo/env"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Only after eval
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

#--------------------
#---- Completion ----
#--------------------

# Load and initialise completion system
autoload -Uz compinit
compinit

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
