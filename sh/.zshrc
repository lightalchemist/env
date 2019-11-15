export ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="agnoster"
ZSH_THEME="spaceship"

plugins=(
         colored-man-pages
         command-not-found
         vi-mode
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
bindkey '^f' vi-forward-blank-word
bindkey '^b' vi-backward-blank-word
bindkey '^ ' autosuggest-accept
bindkey '^x' autosuggest-clear

# Allow Esc . to insert last word in vim insert mode, just like in bash
bindkey -M viins '\e.' insert-last-word

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=117'
# ZSH_AUTOSUGGEST_HIGHLIGHT_COLOR='fg=blue'
# AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=blue'
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=red,bg=white'
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue,bg=white'
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
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

# Path to Homebrew packages
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# This allows TMUX window titles to remain fix after they are renamed
export DISABLE_AUTO_TITLE=true

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto -nH'
alias ls="exa --group-directories-first -s extension"
alias cat="bat"
alias tmux='tmux -u'
alias vim='nvim'
alias vi='nvim'
alias ctags="`brew --prefix`/bin/ctags"

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

# Remove username and local machine on left side of prompt
export DEFAULT_USER=$USER
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

SPACESHIP_PROMPT_ORDER=(
  # time          # Time stamps section
  # user          # Username section
  dir           # Current directory section
  # host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # node          # Node.js section
  # ruby          # Ruby section
  # docker        # Docker section
  # aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  # kubecontext   # Kubectl context section
  # terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_PROMPT_SEPARATE_LINE=false
# export SPACESHIP_PROMPT_PREFIXES_SHOW=false
# export SPACESHIP_PROMPT_SUFFIXES_SHOW=false

# export SPACESHIP_VI_MODE_COLOR=
export SPACESHIP_VI_MODE_INSERT="⌨"
export SPACESHIP_VI_MODE_NORMAL="⌘"
export SPACESHIP_JOBS_SYMBOL="◉"
export SPACESHIP_PYENV_SYMBOL="🅿 "
export SPACESHIP_PROMPT_DEFAULT_PREFIX=""
export SPACESHIP_GIT_PREFIX=""

# This reduces the lag when switching to Vim normal mode
export KEYTIMEOUT=1

# This is for spaceship vi-mode prompt. Must be set before sourcing oh-my-zsh.
export RPS1="%{$reset_color%}"

# Don't save duplicate commands in history
export HISTCONTROL=ignoredups

source $ZSH/oh-my-zsh.sh
source /Users/hongwei/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# BMD environment variables
# export COMPONENT_ROOT=/usr/local/Components
# export BMDCPT_FORCE_HOST=mac-elcap
# export FUSION_NO_OBFUSCATION=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if (($+commands[fzf])) && (($+commands[bat]))&& (($+commands[ag])); then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs'
    # export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_CTRL_T_OPTS="--preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
fi

unalias -m 'fd'
unalias -m 'v'

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
