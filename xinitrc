export PATH=~/bin:$PATH

unclutter -idle 5 -jitter 30 &
#syndaemon -i1 &

xsetroot -solid black &
xsetroot -cursor_name left_prt &

xrandr --output LVDS --auto
xrandr --output VGA-0 --auto --right-of LVDS 

test -f .Xresources && xrdb -merge .Xresources

exec xmonad
