if [ -n "$BASH_VERSION" -a -r "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

if echo $PATH | grep -v -q 'sbin'; then
    PATH="/usr/local/sbin:/usr/sbin:/sbin:$PATH"
fi

[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
