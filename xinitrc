unclutter -idle 5 -jitter 30 &

xsetroot -solid black &
xsetroot -cursor_name left_prt &

#xrandr --output VGA-0 --mode 1920x1080 --pos 0x768 --rotate normal \
#    --output LVDS --mode 1366x768 --pos 0x0 --rotate normal --output HDMI-0 --off

test -f .Xresources && xrdb .Xresources

exec xmonad
