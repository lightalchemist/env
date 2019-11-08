export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

plugins=(
         colored-man-pages
         command-not-found
         # common-aliases 
         extract 
         fasd 
         git 
         git-extras 
         git-flow
         history-substring-search
         colorize
         python
         brew
         osx 
         zsh-autosuggestions
         zsh-completions 
         zsh-syntax-highlighting 
         web-search 
         svn)

# For autocompletion
autoload -U compinit && compinit

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

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=red,bg=white'

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=117'

# ZSH_AUTOSUGGEST_HIGHLIGHT_COLOR='fg=blue'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue,bg=white'
# AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=blue'


# Prefix to use when saving original versions of bound widgets
# ZSH_AUTOSUGGEST_ORIGINAL_WIDGET_PREFIX=autosuggest-orig-

# ZSH_AUTOSUGGEST_STRATEGY=default


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
# export PATH="/home/hongwei/anaconda3/bin:$PATH"

# Path to Homebrew packages
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# Need to set this so that Vim's YouCompleteMe plugin find libs and provide suggestions
# NOTE: Need to be careful how this is set, especially when working with virtualenv.
# export PYTHONPATH="${PYTHONPATH}:/usr/local/lib/python2.7/dist-packages"

# This allows TMUX window titles to remain fix after they are renamed
export DISABLE_AUTO_TITLE=true

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
# alias ll='ls -AlhF'
# alias la='ls -aF'
# ls --option not available on OS X. Need to use Homebrew to install coreutils
# alias ls='ls --color=tty -F --group-directories-first'
# alias l=ls
# alias lc='ls --color=tty -F --format=single-column --group-directories-first'
# alias rm='trash'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto -nH'

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

# antigen apply

# Remove username and local machine on left side of prompt
export DEFAULT_USER=$USER

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}


# Don't save duplicate commands in history
export HISTCONTROL=ignoredups

alias ctags="`brew --prefix`/bin/ctags"

source $ZSH/oh-my-zsh.sh
source /Users/hongwei/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# BMD environment variables
export COMPONENT_ROOT=/usr/local/Components
export BMDCPT_FORCE_HOST=mac-elcap
export FUSION_NO_OBFUSCATION=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if (($+commands[fzf])) && (($+commands[bat]))&& (($+commands[ag])); then
    # export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
    # export FZF_DEFAULT_COMMAND='ag -g ""'
    export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs'
    # export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
    # export FZF_DEFAULT_OPTS=' '
    export FZF_CTRL_T_OPTS="--preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
fi

unalias -m 'fd'

source ~/.iterm2_shell_integration.zsh
export HOMEBREW_GITHUB_API_TOKEN=16033de5896dcbc3a40755fd4e91181adb26a907


alias ls="exa --group-directories-first"
alias cat="bat"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/hongwei/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/hongwei/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/hongwei/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/hongwei/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
