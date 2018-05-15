
# Path to your oh-my-zsh installation.
export ZSH=/home/mcp/.oh-my-zsh


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

plugins+=(zsh-nvm)

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# List of accounts to read the last tweet from, comma separated
# The first in the list is read by the party parrot.
export TTC_BOTS='tinycarebot,selfcare_bot,bible_quotes'

# Use this to have a different animal say a message in the big box.
# export TTC_SAY_BOX="cat"

# List of folders to look into for `git` commits, comma separated.
export TTC_REPOS='~/GitHubRepos'

# The max directory-depth to look for git repositories in
# the directories defined with `TTC_REPOS`. Note that the deeper
# the directory depth, the slower the results will be fetched.
export TTC_REPOS_DEPTH=2

# Which method is to be used to read the git commits ('gitstandup' | 'gitlog').
# If you're having problems seeing your commits in the dahsboard, set
# this value to gitlog.
export TTC_GITBOT='gitlog'

# Location/zip code to check the weather for. Both 90210 and "San Francisco, CA"
# _should_ be ok (the zip code doesn't always work -- use a location
# first, if you can). It's using weather.service.msn.com behind the curtains.
export TTC_WEATHER='Boca Raton, FL'

# Set to false if you're an imperial savage. <3
export TTC_CELSIUS=false

# Unset this if you _don't_ want to use Twitter keys and want to
# use web scraping instead.
export TTC_APIKEYS=true

# Refresh the dashboard every 10 minutes.
export TTC_UPDATE_INTERVAL=10

# Twitter api keys
export TTC_CONSUMER_KEY='b1qWp8SeQEhTFueWRna514aZS'
export TTC_CONSUMER_SECRET='RCRXT6fRRApzijXvhZfni5iBLNnbyP9CVxIPV1gHZi0Z5Jj8KB'
export TTC_ACCESS_TOKEN='867487757811187714-t2Axe16t6Bk6sUqdhe9hMDX3lnyfW6n'
export TTC_ACCESS_TOKEN_SECRET='hFdHmDAsIpEdf5fbJAjOav8byKc7lyM8OwS1kETt6S0F7'

# Note: in tiny-terminal-care < 1.0.7, the recommended variables for the Twitter
# API keys were the ones before. As of 1.0.8, they are deprecated
# (because the names are too generic), but will still be supported
# until the next major version.
export CONSUMER_KEY='b1qWp8SeQEhTFueWRna514aZS'
export CONSUMER_SECRET='RCRXT6fRRApzijXvhZfni5iBLNnbyP9CVxIPV1gHZi0Z5Jj8KB'
export ACCESS_TOKEN='867487757811187714-t2Axe16t6Bk6sUqdhe9hMDX3lnyfW6n'
export ACCESS_TOKEN_SECRET='hFdHmDAsIpEdf5fbJAjOav8byKc7lyM8OwS1kETt6S0F7'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#direnv stuff
eval "$(direnv hook zsh)"

#alias vim to nvim
alias vim="nvim"

#alias python3 to p
alias p="python3"

#ls each time a cd is done
function chpwd() {
    emulate -L zsh
    ls -A
}

# Match node path with npm
# export NODE_PATH=$NODE_PATH:/home/mcp/.nvm/versions/node/v7.0.0/lib/node_modules
# export NODE_PATH=$NODE_PATH:/home/mcp/.nvm/versions/node/v6.11.2/lib/node_modules
# export NODE_PATH=$NODE_PATH:/home/mcp/.nvm/versions/node/v6.11.3/lib/node_modules
export NODE_PATH=$NODE_PATH:/home/mcp/.nvm/versions/node/v8.1.2/lib/node_modules

# Dvorak + caps lock and escape swap
setxkbmap -layout us -variant dvp -option caps:swapescape

# Set default text editor
export EDITOR=/usr/bin/nvim

# added by travis gem
# [ -f /home/mcp/.travis/travis.sh ] && source /home/mcp/.travis/travis.sh

# Go
export GOROOT=/usr/local/go
export PATH=$HOME/bin:/usr/local/bin:$HOME/intelFPGA_lite/17.1/quartus/bin:$GOROOT/bin:$PATH
