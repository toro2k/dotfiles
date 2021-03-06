if [ -r "${HOME}/.profile_site" ]; then
    . "${HOME}/.profile_site"
fi

if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
export PATH


for editor in vim vi emacs; do
    if command -v "$editor" > /dev/null 2>&1; then
        EDITOR="$editor"
        break
    fi
done
unset editor
export EDITOR


export PAGER=less
export ACK_PAGER=less

# i    ignore case in searches
# R    display raw ANSI colors control chars
# F    quit if one screen
# X    prevent clearing the screen when exit
export LESS='iRFX'

export LESS_TERMCAP_mb='[01;34m'
export LESS_TERMCAP_md='[01;34m'
export LESS_TERMCAP_me='[0m'
export LESS_TERMCAP_se='[0m'
export LESS_TERMCAP_so='[01;44;33m'
export LESS_TERMCAP_ue='[0m'
export LESS_TERMCAP_us='[01;33m'


if command -v 'keychain' > /dev/null 2>&1; then
    eval "$(keychain --eval --agents ssh --quick --quiet)"
fi


export PROFILE_SOURCED=1
