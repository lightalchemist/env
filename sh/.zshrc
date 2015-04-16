# Path to your oh-my-zsh installation.
# export ZSH=/home/lightalchemist/.oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="af-magic"
# ZSH_THEME="bira"
# ZSH_THEME="blinks"
ZSH_THEME="agnoster"
# ZSH_THEME="alanpeabody"
# ZSH_THEME="wedisagree"
# ZSH_THEME="afowler"
# ZSH_THEME="dieter"

DEFAULT_USER="hw"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git virtualenvwrapper extract zsh-syntax-highlighting)

# User configuration

# export PATH="/usr/local/cuda-6.5/bin:/home/lightalchemist/virtualenvs/ml/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/lightalchemist/bin"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"
# export MANPATH="/usr/local/man:$MANpATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ll='ls -AlhF'
alias la='ls -aF'
# ls --option not available on OS X. Need to use Homebrew to install coreutils
alias ls='ls --color=tty -F --group-directories-first'
alias l=ls
alias lc='ls --color=tty -F --format=single-column --group-directories-first'
alias rm='trash'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto -nH'

# NOTE: PATH variable must be set before sourcing virtualenvwrapper.sh
# See http://virtualenvwrapper.readthedocs.org/en/latest/install.html

# For virtualenv support
# Deactivate current virtual env so that flags below will be set properly
# virtualenv_path="$VIRTUAL_ENV"
# echo "Current VIRTUAL_ENV is: $VIRTUAL_ENV"
# if [ $virtualenv_path ]; then
#     echo "Deactivating virtualenv `basename $virtualenv_path`"
#     echo $PATH
#     deactivate
# else
#     echo "No virtualenv to deactivate"
# fi

export VIRTUALENVWRAPPER_PYTHON=`which python`
export VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`
export WORKON_HOME=~/virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=~/virtualenvs

# Activate virtualenv
# NOTE: Careful with this as virtualenv may not be available on all machines.
workon ml
# if [ $virtualenv_path ]; then
#     echo "Reapplying virtualenv: $virtualenv_path"
#     # echo "Activating virtualenv `basename` $virtualenv_path"
#     echo $virtualenv_path
#     echo "Activating virtualenv: "
#     echo "`basename $virtualenv_path`"
#     workon "`basename $virtualenv_path`"
# else
#     echo "No active virtualenv"
#     workon ml
# fi

# Configure 256 colors if possible
case $TERM in
    xterm|screen|rxvt-unicode)
        TERM="${TERM}-256color" ;;
esac

# This adds [dd-mm-yy time] that updates to right prompt
RPROMPT='[%D %D{%L:%M:%S %p}]'
# TMOUT=1
# TRAPALRM() {
#     zle reset-prompt
# }

export EDITOR=`which vim`
