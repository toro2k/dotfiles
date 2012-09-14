##########
# Shell options
##########

shopt -s -o noclobber
shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s no_empty_cmd_completion


##########
# Environment
##########

export PAGER=less

export VISUAL=vi
export EDITOR=vi
export PSQL_EDITOR='emacs -nw'

export PS1='\n\w \[\e[1;31m\]\$\$\[\e[0m\] '
export PS2='> '
export PROMPT_DIRTRIM=2

GREP_OPTIONS+=" --exclude-dir=.svn"
GREP_OPTIONS+=" --exclude-dir=.git"
export GREP_OPTIONS

export LESS='-i -r'


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

alias x="ssh-agent startx"


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


