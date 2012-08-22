export PATH=~/bin:$PATH

unclutter -idle 5 -jitter 30 &
syndaemon -i1 &

xsetroot -solid black &
xsetroot -cursor_name left_prt &

xrandr --output LVDS1 --auto

exec xmonad
