
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

[ -f "$HOME/.profile_site" ] && source "$HOME/.profile_site"
