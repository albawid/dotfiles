#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

#
## merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

#
## start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#
## autostart
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BROWSER=/usr/bin/qutebrowser

#
## Custom Script for modularize i3 config
# ~/.local/bin/i3modular &

#
## mpd
[ ! -s ~/.config/mpd/pid ] && mpd

#
## Session
exec $1
# DEFAULTSESSION=i3
#  case "$1" in
#    i3) exec i3 ;;
#    i3-with-shmlog) exec i3-with-shmlog ;;
#    openbox) exec openbox ;;
#    *) exec $DEFAULTSESSION ;;
#  esac

