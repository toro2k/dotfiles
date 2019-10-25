scm_prompt() {
    if [ -x "$(which git 2> /dev/null)" ] && is_git_repo; then
        echo -n ' '
        git_prompt
    elif [ -x "$(which svn 2> /dev/null)" ] && is_svn_repo; then
        echo -n ' '
        svn_prompt
    fi
}

is_git_repo() {
    git branch &> /dev/null
}

is_git_bare_repo() {
    [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'false' ]
}

git_prompt() {
    if is_git_bare_repo; then
        echo -n "git: bare repo"
    else
        echo -n "git: $(git_cur_branch_name)"

        git_status=$(git status --porcelain)
        if [ -z "$git_status" ]; then
            echo -n ''
        elif echo "$git_status" | grep -q '^[MARCD]'; then
            echo -n ' (staged changes)'
        else
            echo -n ' (unstaged changes)'
        fi
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

if command -v "dircolors" > /dev/null 2>&1; then
    eval "$(dircolors -b)"
fi

if has_gnu_coreutils; then
    alias ls="ls --color=auto"
else
    # FreeBSD is assumed
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


# Debian
alias apt-mine="aptitude search '~i !~M !(~prequired|~pimportant|~pstandard)' | less"
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


# rbenv
if [ -d "$HOME/.rbenv/bin" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
fi

if command -v "rbenv" > /dev/null 2>&1; then
    eval "$(rbenv init -)"
fi


# pyenv
if [ -d "$HOME/.pyenv/bin" ]; then
    PATH="$HOME/.pyenv/bin:$PATH"
fi

if command -v "pyenv" > /dev/null 2>&1; then
    eval "$(pyenv init -)"
fi


# go
if [ -d "/opt/go/bin" ]; then
    export PATH="/opt/go/bin:$PATH"
fi
export GOPATH="$HOME/stuff/dev/projects/go"


# asdf
if [ -d "$HOME/.asdf" ]; then
    . "$HOME/.asdf/asdf.sh"
    . "$HOME/.asdf/completions/asdf.bash"
fi
