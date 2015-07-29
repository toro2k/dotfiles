[ -z "$PS1" ] && return

source "$HOME/.bash_prompt"

shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s no_empty_cmd_completion


alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias ls="ls --color=auto"
alias l1="ls -1"
alias ll="ls -lh"
alias la="ls -A"
alias lla="ll -A"

alias grep="grep --color=auto"
if [ -x "$(which ack-grep 2> /dev/null)" ]; then
    alias ack="ack-grep"
fi

alias pacman-mine="comm -13 <(pacman -Qq -g base -g base-devel | sort) \
    <(pacman -Qqe | sort) | xargs pacman -Q"

alias apt-mine="aptitude search '~i !~M !(~prequired|~pimportant)' | less"
alias apt-unreq="aptitude search '~i ~M !~RDepends:~i'"


if [ -x "$(which dircolors 2> /dev/null)" ]; then
    eval "$(dircolors -b)"
fi

if [ -r "/etc/bash_completion" ]; then
    source "/etc/bash_completion"
fi

if [ -r "$HOME/.bashmarks.sh" ]; then
    source "$HOME/.bashmarsk.sh"
fi
