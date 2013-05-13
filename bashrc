##########
# Shell options
##########

shopt -s -o noclobber
shopt -s cdspell
shopt -s extglob
shopt -s no_empty_cmd_completion

shopt -s globstar

command_exists() {
		command -v "$1" 2>&1 > /dev/null
}

##########
# Environment
##########

if command_exists most; then
  export PAGER=most
else
  export PAGER=less
fi

export VISUAL=vi
export EDITOR=vi
export PSQL_EDITOR='emacs -nw'

if [ -z $SSH_TTY ]; then
  export PS1='\n\w \[\e[1;32m\]\$\$\[\e[0m\] '
else
  export PS1='\n[\h] \w \[\e[1;33m\]\$\$\[\e[0m\] '
fi

if [ 'xterm' = $TERM ]; then
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

export MOST_SWITCHES='-w'
export LESS='-i -R'


##########
# Aliaes
##########

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias ls="ls --color"
alias l1="ls -1"
alias ll="ls -lh"
alias la="ls -A"
alias lla="ll -A"

alias grep="grep --color -E -i"
alias sed="sed -r"

if command_exists logger; then
    alias x="ssh-agent startx |& logger --tag xsession --priority user.info"
else
    alias x="ssh-agent startx"
fi

alias poweroff="sudo /sbin/poweroff"
alias reboot="sudo /sbin/reboot"


##########
# Functions
##########

function vibash
{
  vi -n + $HOME/.bashrc
  source $HOME/.bashrc
}


##########
# Load scripts
##########

test -r /etc/bash_completion && source /etc/bash_completion
test -r ~/.rvm/scripts/rvm && source ~/.rvm/scripts/rvm


##########
# Quickies
##########

