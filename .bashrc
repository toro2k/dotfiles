# Functions

vibash() {
  vi -n + $HOME/.bashrc
  source $HOME/.bashrc
}

command_exists() {
    command -v "$1" 2>&1 > /dev/null
}


# Shell options

shopt -s -o noclobber
shopt -s cdspell
shopt -s extglob
shopt -s no_empty_cmd_completion
shopt -s globstar


# Environment

[ -d "$HOME/.rbenv/bin" ] && PATH="$HOME/.rbenv/bin:$PATH"
[ -d "$HOME/.cabal/bin" ] && PATH="$HOME/.cabal/bin:$PATH"

export PAGER=less

export VISUAL=vi
export EDITOR=vi
export PSQL_EDITOR='emacs -nw'

if [ -z $SSH_TTY ]; then
  export PS1='\n\w \[\e[1;32m\]\$\$\[\e[0m\] '
else
  export PS1='\n[\h] \w \[\e[1;33m\]\$\$\[\e[0m\] '
fi

if [[ $TERM == 'xterm' || $TERM =~ 'rxvt' ]]; then
  if [ -z $SSH_TTY ]; then
    export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
  else
    export PROMPT_COMMAND='echo -ne "\033]0;[${HOSTNAME}] ${PWD}\007"'
  fi
fi

export PS2='> '
export PROMPT_DIRTRIM=2

GREP_OPTIONS+=" --exclude-dir=.svn"
GREP_OPTIONS+=" --exclude-dir=.git"
export GREP_OPTIONS

export LESS='-i -R -g'
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


# Aliaes

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias ls="ls --color"
alias l1="ls -1"
alias ll="ls -lh"
alias la="ls -A"
alias lla="ll -A"

command_exists ack-grep && alias ack="ack-grep"
alias grep="grep --color"
alias sed="sed -r"

alias apt-mine="aptitude search '~i !~M !(~prequired|~pimportant)'"
alias apt-unneeded="aptitude search '~i ~M !~RDepends:~i'"
alias apt-unstable="aptitude versions \
    '~VCURRENT ~Aunstable !~Atesting' --group-by=none"


# Load scripts

if [ -r /etc/bash_completion -a -z "$BASH_COMPLETION_COMPAT_DIR" ]; then
    source /etc/bash_completion
fi

command_exists rbenv && eval "$(rbenv init -)"



# Temp

