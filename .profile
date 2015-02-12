
if [ -n "$BASH_VERSION" -a -r "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

if echo $PATH | grep -v -q 'sbin'; then
    PATH="/usr/local/sbin:/usr/sbin:/sbin:$PATH"
fi

[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.rbenv/bin" ] && PATH="$HOME/.rbenv/bin:$PATH"
[ -d "$HOME/.pyenv/bin" ] && PATH="$HOME/.pyenv/bin:$PATH"
[ -d "$HOME/.cabal/bin" ] && PATH="$HOME/.cabal/bin:$PATH"

export PAGER=less
export ACK_PAGER=less

export VISUAL=vi
export EDITOR=vi

GREP_OPTIONS+=" --exclude-dir=.svn"
GREP_OPTIONS+=" --exclude-dir=.git"
export GREP_OPTIONS

export LESS='-i -R -g -FX'
export LESS_TERMCAP_mb=$'\e[01;34m'
export LESS_TERMCAP_md=$'\e[01;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;33m'

[ -f "$HOME/.profile_site" ] && source "$HOME/.profile_site"
