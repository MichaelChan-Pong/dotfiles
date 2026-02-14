# Based on https://github.com/dreamsofautonomy/zensh/blob/main/.zshrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Aliases
alias ls='ls --color'
alias vim="nvim"
alias vmi="nvim"
alias c='clear'

# Intel (putting here to set PATH for fzf)
source ~/.intel.zshrc

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# User configuration

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

# Golang
export PATH="$PATH:/usr/local/go/bin"

# Python

## alias python3 to p
alias p="python3"
alias py="python3"

# Lazygit
alias lg="lazygit"

## requirements.txt
alias export_requirements="pip3 freeze > requirements.txt"
alias import_requirements="pip3 install -r requirements.txt"

## Direnv
eval "$(direnv hook zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# # Autolaunch tmux
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
# Otherwise start tmux
[[ -z "$TMUX" ]] && exec tmux

# Azure functions & .NET
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
eval "$(dotnet completions script zsh)"

# GitHub Copilot
alias copilot-update="wget -qO- https://gh.io/copilot-install | bash"

# Bob (Neovim version manager)
# export PATH="$PATH:/home/mcp/.local/share/bob/nvim-bin"
