##########
# Shell options
##########

shopt -s -o noclobber
shopt -s cdspell
shopt -s extglob
shopt -s no_empty_cmd_completion

##########
# Environment
##########

export PATH="$PATH"

export PAGER=less

export VISUAL=emacs
export EDITOR=vi

# prompting
export PS1='\n\w \[\e[1;31m\]\$\$\[\e[0m\] '
export PS2='> '

export PROMPT_DIRTRIM=2

# grep settings
GREP_OPTIONS="--color -E"
GREP_OPTIONS+=" --exclude-dir=.svn"
GREP_OPTIONS+=" --exclude-dir=.git"
export GREP_OPTIONS

# less options
LESS='-i -r'
export LESS


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

