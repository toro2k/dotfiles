#!/bin/sh

SCRIPT_NAME=$(basename "$0")

FORCE=0
if [ "$1" = "-f" ]; then
    FORCE=1
    shift
fi

if [ "$#" -lt 1 ]; then
    printf "usage: %s [-f] DOTFILE...\n" "$SCRIPT_NAME"
    exit 1
fi

for dotfile in "$@"; do
    TARGET="$(pwd)/$dotfile"
    LINK_NAME="$HOME/$(basename "$dotfile")"

    if [ -e "$LINK_NAME" -a "$FORCE" -eq 0 ]; then
        printf "%s: failed to install '%s': File exists\n" "$SCRIPT_NAME" "$LINK_NAME"
        exit 1
    fi

    ln -sf "$TARGET" "$LINK_NAME"
done
unset dotfile
