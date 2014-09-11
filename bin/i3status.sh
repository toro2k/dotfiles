#!/bin/sh

# man 1 i3status
i3status | while :
do
    read line
    echo "kb: $(xkb2 -q) | $line"  || exit 1
done
