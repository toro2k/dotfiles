#!/bin/sh

xrandr=$(which xrandr)

[ -x "$xranrd" ] || exit 1

$xrandr --output LVDS1 --auto --primary

if $xrandr --query | grep -q 'VGA1 conn'; then
    $xrandr --output VGA1 --auto --rigth-of LVDS1
else
    $xrandr --output VGA1 --off
fi