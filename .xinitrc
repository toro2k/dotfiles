xsetroot -solid black
xsetroot -cursor_name left_prt

# <> key to compose
setxkbmap -option compose:102

# Turn off screensaver and screen blanking
xset -dpms
xset s off

# Disable touchpad when typing
syndaemon -R -i1 &

# Remove mouse cursor from the screen
unclutter -idle 5 -jitter 30 &

exec i3
