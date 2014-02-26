#!/bin/sh

xrandr=$(which xrandr)

[ -x "$xrandr" ] || exit 1

$xrandr --output LVDS1 --mode 1360x768 --primary

if $xrandr --query | grep -q 'VGA1 conn'; then
    $xrandr --output VGA1 --auto --right-of LVDS1
else
    $xrandr --output VGA1 --off
fi
