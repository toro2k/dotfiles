# Functions

function vibash() {
  vi -n + "$HOME/.bashrc"
  source "$HOME/.bashrc"
}

function command_exists() {
    command -v "$1" 2>&1 > /dev/null
}

function bak() {
    path="${1%/}"
    if [ -z "$path" ]; then
        return 1
    else
        mv "$path" "$path~"
    fi
}

# Shell options

shopt -s -o noclobber
shopt -s cdspell
shopt -s extglob
shopt -s no_empty_cmd_completion
shopt -s globstar


# Environment

source "$HOME/.bash_prompt"

[ -d "$HOME/.rbenv/bin" ] && PATH="$HOME/.rbenv/bin:$PATH"
[ -d "$HOME/.pyenv/bin" ] && PATH="$HOME/.pyenv/bin:$PATH"
[ -d "$HOME/.cabal/bin" ] && PATH="$HOME/.cabal/bin:$PATH"

export PAGER=less

export VISUAL=vi
export EDITOR=vi

GREP_OPTIONS+=" --exclude-dir=.svn"
GREP_OPTIONS+=" --exclude-dir=.git"
export GREP_OPTIONS

export LESS='-i -R -g'
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

command_exists ack-grep && alias ack="ack-grep"
alias grep="grep --color"

alias apt-mine="aptitude search '~i !~M !(~prequired|~pimportant)!~sdoc'"
alias apt-doc="aptitude search '~i~sdoc'"
alias apt-unneeded="aptitude search '~i ~M !~RDepends:~i'"
alias apt-unstable="aptitude versions \
    '~VCURRENT ~Aunstable !~Atesting' --group-by=none"


# Load things

if [ -r /etc/bash_completion -a -z "$BASH_COMPLETION_COMPAT_DIR" ]; then
    source /etc/bash_completion
fi

command_exists rbenv && eval "$(rbenv init -)"
command_exists pyenv && eval "$(pyenv init -)"



# Temp

