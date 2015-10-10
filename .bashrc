[ -z "$PS1" ] && return

source "$HOME/.bash_prompt"

shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s no_empty_cmd_completion
shopt -s checkwinsize


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

alias pac-mine="comm -23 <(pacman -Qqe | sort ) \
        <(pacman -Qqg base base-devel | sort)"
alias pac-orphans="pacman -Qqdt"
alias pac-unreq="pacman -Qqdtt"
pac-why() {
    pacman -Qi "$1" | grep --color=no -E 'Required By|Optional For'
}

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

if [ -x "$(which rbenv 2> /dev/null)" ]; then
    eval "$(rbenv init -)"
fi
