#!/bin/zsh
#
#
# ~/.xinitrc
#
# executed by uck off

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xset +fp /usr/share/fonts/local &
xset fp rehash &
xrdb ~/.Xresources
xsetroot -cursor_name left_ptr
systemctl --user import-enviroment DISPLAY
numlcokx &
unclutter &
/usr/lib/polkit-kde-authentication-agent-1 &
urxvtd -q -o -f

sxhkd &
exec bspwm
export QT_QPA_PLATFORMTHEME="qt5ct"
