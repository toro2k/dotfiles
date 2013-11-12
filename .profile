if [ -n "$BASH_VERSION" -a -r "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
