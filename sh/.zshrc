source "$HOME/.antigen/antigen.zsh"

# Install antigen
# git clone https://github.com/zsh-users/antigen ~/.antigen

antigen use oh-my-zsh

antigen bundle chrissicool/zsh-256color

# bundles from oh-my-zsh
antigen bundle extract
antigen bundle git
# antigen bundle virtualenvwrapper
antigen bundle virtualenv
antigen bundle dirhistory
antigen bundle common-aliases
antigen bundle command-not-found
antigen bundle fasd

antigen bundle zsh-users/zsh-completions src
antigen bundle tarruda/zsh-autosuggestions
# antigen bundle kennethreitz/autoenv
antigen bundle Tarrasch/zsh-autoenv

# zsh-syntax-highlighting must be loaded before history-substring-search
# See: https://github.com/zsh-users/zsh-history-substring-search
antigen bundle history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting


antigen theme agnoster

setopt correct_all # Enable autocorrect suggestions
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Autosuggestion color
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg159'
bindkey '^f' vi-forward-blank-word
bindkey '^b' vi-backward-blank-word

# Ctrl <space> to accept auto suggestion
bindkey '^ ' autosuggest-accept
bindkey '^x' autosuggest-clear

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=red,bg=white'
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=117'

# ZSH_AUTOSUGGEST_HIGHLIGHT_COLOR='fg=blue'
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'
# AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=blue'


# Prefix to use when saving original versions of bound widgets
ZSH_AUTOSUGGEST_ORIGINAL_WIDGET_PREFIX=autosuggest-orig-

ZSH_AUTOSUGGEST_STRATEGY=default


# Widgets that clear the suggestion
ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(
	history-search-forward
	history-search-backward
	history-beginning-search-forward
	history-beginning-search-backward
	history-substring-search-up
	history-substring-search-down
	up-line-or-beginning-search
	down-line-or-beginning-search
	up-line-or-history
	down-line-or-history
	accept-line
)

# Widgets that accept the entire suggestion
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
	forward-char
	end-of-line
	vi-forward-char
	vi-end-of-line
	vi-add-eol
)

# Widgets that accept the entire suggestion and execute it
ZSH_AUTOSUGGEST_EXECUTE_WIDGETS=(
)

# Widgets that accept the suggestion as far as the cursor moves
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
	forward-word
	emacs-forward-word
	vi-forward-word
	vi-forward-word-end
	vi-forward-blank-word
	vi-forward-blank-word-end
	vi-find-next-char
	vi-find-next-char-skip
)

# Widgets that should be ignored (globbing supported but must be escaped)
ZSH_AUTOSUGGEST_IGNORE_WIDGETS=(
	orig-\*
	beep
	run-help
	set-local-history
	which-command
	yank
	yank-pop
)

# Max size of buffer to trigger autosuggestion. Leave undefined for no upper bound.
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=

# Pty name for calculating autosuggestions asynchronously
ZSH_AUTOSUGGEST_ASYNC_PTY_NAME=zsh_autosuggest_pty

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white,bold'

# For Ubuntu
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# added by Anaconda3 installer
export PATH="/home/hongwei/anaconda3/bin:$PATH"

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
# export VIRTUALENVWRAPPER_PYTHON=`which python`
# export VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`
# export WORKON_HOME="$HOME/virtualenvs"
# source /usr/local/bin/virtualenvwrapper.sh
# export PIP_VIRTUALENV_BASE="$WORKON_HOME"
# # makes pip detect an active virtualenv and install to it
# export PIP_RESPECT_VIRTUALENV=true

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
# export TERM="screen-256color"
# export TERM="xterm-256color"

# This adds [dd-mm-yy time] that updates to right prompt
# Use %p instead of %K for 12 hour time format
# RPROMPT='[%D %D{%L:%M:%S %K}]'
RPROMPT='[%D %D{%L:%M:%S %K}]'

alias vim='nvim'
alias vi='nvim'
export EDITOR=`which vim`

# bind UP and DOWN arrow keys
zmodload zsh/terminfo

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

antigen apply

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}
