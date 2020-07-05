# Path to your oh-my-zsh installation.
export ZSH=/home/mcp/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

plugins+=(zsh-nvm)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# alias vim to nvim
alias vim="nvim"

# alias python3 to p
alias p="python3"
alias py="python3"

# ls each time a cd is done
function chpwd() {
    emulate -L zsh
    ls -A
}

# Dvorak + caps lock and escape swap
# setxkbmap -layout us -variant dvp -option caps:swapescape

# Set default text editor
export EDITOR=/usr/bin/nvim

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden'
