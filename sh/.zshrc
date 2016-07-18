source "$HOME/.antigen/antigen.zsh"

# Install antigen
# git clone https://github.com/zsh-users/antigen ~/.antigen

antigen use oh-my-zsh

# bundles from oh-my-zsh
antigen bundle extract
antigen bundle git
antigen bundle virtualenvwrapper
antigen bundle virtualenv
antigen bundle dirhistory
antigen bundle common-aliases
antigen bundle command-not-found
antigen bundle fasd
# zsh-syntax-highlighting must be loaded before history-substring-search
# See: https://github.com/zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle history-substring-search

antigen bundle zsh-users/zsh-completions src
antigen bundle tarruda/zsh-autosuggestions
# antigen bundle kennethreitz/autoenv
antigen bundle Tarrasch/zsh-autoenv

antigen-theme agnoster

setopt correct_all # Enable autocorrect suggestions
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Autosuggestion color
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg159'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=159,bg=020"
bindkey '^f' vi-forward-blank-word
bindkey '^b' vi-backward-blank-word

# Ctrl <space> to accept auto suggestion
bindkey '^ ' autosuggest-accept
bindkey '^x' autosuggest-clear

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/lib:$PATH"

# Need to set this so that Vim's YouCompleteMe plugin find libs and provide suggestions
# NOTE: Need to be careful how this is set, especially when working with virtualenv.
# export PYTHONPATH="${PYTHONPATH}:/usr/local/lib/python2.7/dist-packages"

# This allows TMUX window titles to remain fix after they are renamed
export DISABLE_AUTO_TITLE=true

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
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
# For fasd cd
alias c='fasd_cd -d'

# NOTE: PATH variable must be set before sourcing virtualenvwrapper.sh
# See http://virtualenvwrapper.readthedocs.org/en/latest/install.html
# For virtualenv support
export VIRTUALENVWRAPPER_PYTHON=`which python`
export VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`
export WORKON_HOME="$HOME/virtualenvs"
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE="$WORKON_HOME"
# makes pip detect an active virtualenv and install to it
export PIP_RESPECT_VIRTUALENV=true

# Configure 256 colors if possible
# Also, use xterm-256color-italic to allow VIM recognize italics
# Full instructions here: http://www.nerdyweekly.com/posts/enable-italic-text-vim-tmux-gnome-terminal/
# # Download a custom terminfo that defines sitm and ritm
# $ wget https://gist.githubusercontent.com/sos4nt/3187620/raw/8e13c1fec5b72d415ed2917590348451de5f8e58/xterm-256color-italic.terminfo
# # Compile it
# $ tic xterm-256color-italic.terminfo
# # Activate xterm-256color-italic.terminfo automatically
# # (edit filename accordingly if you're using another shell)
# $ echo 'export TERM=xterm-256color-italic' >> ~/.bashrc
# case $TERM in
#     screen|rxvt-unicode)
#         # TERM="${TERM}-256color-italic" ;;
#         TERM="${TERM}-256color" ;;
# esac
# case $TERM in
#     xterm|screen|rxvt-unicode)
#         # TERM="${TERM}-256color-italic" ;;
#         TERM="${TERM}-256color" ;;
# esac

# Need this so that TMUX will display color properly.
# However, it seems to introduce weird characters at the start of every command output in ZSH
# Have to figure out how to set this gracefully.
export TERM=screen-256color


# This adds [dd-mm-yy time] that updates to right prompt
# Use %p instead of %K for 12 hour time format
RPROMPT='[%D %D{%L:%M:%S %K}]'
# TMOUT=1
# TRAPALRM() {
#     zle reset-prompt
# }

export EDITOR=`which vim`

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
# For Ubuntu
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Make prompt more user friendly when user entered wrong command.
# This replaces [ynae] with the expanded version of the words
# and color code the wrong and suggested command.
autoload -U colors && colors
export SPROMPT="Correct $fg_bold[red]%R$reset_color to $fg_bold[green]%r?$reset_color (Yes, No, Abort, Edit) "

# Extended file move
# See: http://www.mfasold.net/blog/2008/11/moving-or-renaming-multiple-files/
autoload -U zmv
alias mmv='noglob zmv -W'

# Don't add failed commands to history
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# To activate fasd
eval "$(fasd --init auto)"

antigen-apply
