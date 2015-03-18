# Don't do anything if not an interactive shell.
[ -z "$PS1" ] && return


# Functions

vibash() {
  vi -n + "$HOME/.bashrc"
  source "$HOME/.bashrc"
}

bak() {
    path="${1%/}"
    if [ -z "$path" ]; then
        return 1
    else
        mv "$path" "$path~"
    fi
}

command_exists() {
    command -v "$1" 2>&1 > /dev/null
}


# Shell options

shopt -s cdspell
shopt -s extglob
shopt -s no_empty_cmd_completion
shopt -s globstar


# Environment

source "$HOME/.bash_prompt"

if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
fi

export LESS='-i -R -g -FX'
export LESS_TERMCAP_mb=$'\e[01;34m'
export LESS_TERMCAP_md=$'\e[01;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;33m'


# Aliaes

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias ls="ls --color"
alias l1="ls -1"
alias ll="ls -lh"
alias la="ls -A"
alias lla="ll -A"

alias grep="grep --color"
command_exists ack-grep && alias ack="ack-grep"

alias apt-mine="aptitude search '~i !~M !(~prequired|~pimportant)' | less"
alias apt-unreq="aptitude search '~i ~M !~RDepends:~i'"

# Load things

test -r /etc/bash_completion && source /etc/bash_completion
test -r $HOME/.bashmarks.sh && source $HOME/.bashmarks.sh
command_exists rbenv && eval "$(rbenv init -)"
command_exists pyenv && eval "$(pyenv init -)"


# Temp

alias cal="ncal -bM"
