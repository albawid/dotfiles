#!/usr/bin/env bash

pkill -f "dunst"; dunst -config ~/.config/dunst/dunstrc &
feh  --bg-fill '/home/albawid/Picture/Wallpaper/hologram.jpg'
/usr/bin/flameshot &
pkill -f "lxpolkit"; lxpolkit &
xfce4-power-manager &
$HOME/.config/suckless/dwm/dwm-bar/dwm_bar.sh &
xautolock -time 15 -locker "betterlockscreen -l dimblur"
light -S 30 &
picom -b &
