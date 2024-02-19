#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

# Disable auto scaling and set global 1.5 scale for qt apps
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_ENABLE_HIGHDPI_SCALING=0
export QT_SCALE_FACTOR=1

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

xrdb /home/emil/.Xresources
xset s off -dpms
xset r rate 200 25
setxkbmap -model pc105 -layout us,fi -option grp:caps_toggle
picom &
calcurse --daemon &
udiskie --tray &
blueman-applet &
redshift-gtk &
protonmail-bridge -n &
dunst &
exec i3
