scm_prompt() {
    if [ -x "$(which git 2> /dev/null)" ] && is_git_repo; then
        git_prompt
    elif [ -x "$(which svn 2> /dev/null)" ] && is_svn_repo; then
        svn_prompt
    fi
}

is_git_repo() {
    git branch &> /dev/null
}

git_prompt() {
    echo -n "git: $(git_cur_branch_name)"

    git_status=$(git status --porcelain)
    if [ -z "$git_status" ]; then
        echo -n ''
    elif echo "$git_status" | grep -q '^[MARCD]'; then
        echo -n ' (staged changes)'
    else
        echo -n ' (unstaged changes)'
    fi
}

# tail strips leading "* "
# tr removes parenthesis when HEAD is detached
git_cur_branch_name() {
    git branch | grep '^*' | tail -c+3 | tr -d '()'
}

is_svn_repo() {
    svn info &> /dev/null
}

svn_prompt() {
    echo -n 'svn: '
    if [ -z "$(svn status)" ]; then
        echo -n 'nothing to commit'
    else
        echo -n 'changes to commit'
    fi
}

has_gnu_coreutils() {
    ls --version 2> /dev/null | grep -q 'coreutils'
}


if has_gnu_coreutils; then
    alias ls="ls --color=auto"
else
    alias ls="ls -G"
fi
alias l1="ls -1"
alias ll="ls -lh"
alias la="ls -A"
alias lla="ll -A"

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias grep="grep --color=auto"

if command -v "ack-grep" > /dev/null 2>&1; then
    alias ack="ack-grep"
fi


if command -v "dircolors" > /dev/null 2>&1; then
    eval "$(dircolors -b)"
fi

if command -v "rbenv" > /dev/null 2>&1; then
    eval "$(rbenv init -)"
fi
if command -v "pyenv" > /dev/null 2>&1; then
    eval "$(pyenv init -)"
fi


# Debian
alias apt-mine="aptitude search '~i !~M !(~prequired|~pimportant)' | less"
alias apt-unreq="aptitude search '~i ~M !~RDepends:~i'"

# Arch
alias pac-mine="comm -23 <(pacman -Qqe | sort ) \
        <(pacman -Qqg base base-devel | sort)"
alias pac-orphans="pacman -Qqdt"
alias pac-unreq="pacman -Qqdtt"
pac-why() {
    pacman -Qi "$1" | grep --color=no -E 'Required By|Optional For'
}

# FreeBSD
alias pkg-mine="pkg query -e '%a=0' '%o-%v' | sort"
alias pkg-why="pkg info -r"
