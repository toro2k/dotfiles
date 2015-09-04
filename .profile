[ -r "${HOME}/.profile_site" ] && . "${HOME}/.profile_site"


if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.rbenv/bin" ]; then
    PATH="$HOME/.rbenv/bin:$PATH"
fi
export PATH


for editor in vim vi emacs; do
    if [ -x "$(which $editor 2>&1)" ]; then
        EDITOR="$editor"
        break
    fi
done
unset editor
export EDITOR

export PAGER=less
export ACK_PAGER=less

LESS=-
LESS+=i # ignore case in searches
LESS+=R # display raw ANSI colors control chars
LESS+=F # quit if one screen
LESS+=X # prevent clearing the screen when exit
export LESS

export LESS_TERMCAP_mb=$'\e[01;34m'
export LESS_TERMCAP_md=$'\e[01;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;33m'

if [ -x "$(which keychain 2> /dev/null)" ]; then
    eval "$(keychain --eval --agents ssh --quick --quiet)"
fi
