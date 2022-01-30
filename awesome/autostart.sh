#!/bin/bash
#systemctl --user import-environment DISPLAY
#xrandr --output DisplayPort-0 --mode 3840x2160 # --right-of DisplayPort-3
#xrandr --output DisplayPort-1 --off
xrandr --auto --output DisplayPort-3 --mode 3840x2160
#xrandr --auto --output DisplayPort-2 --mode 3840x2160 --right-of DisplayPort-3
#pkill compton
#/home/jeff/bin/aw-qt & disown
#LD_PRELOAD=/usr/lib/mumble/libmumble.so compton & disown
compton & disown
nitrogen --restore
pidof redshift || redshift & disown
xbindkeys -f ~/.xbindkeysrc
#run_keybase
#kdeconnect-indicator & disown
#pkill xscreensaver
#xscreensaver & disown
setxkbmap -option ctrl:nocaps
eval $(gnome-keyring-daemon --start)
#/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & disown
#/usr/lib/policykit-1/polkit-agent-helper-1 & disown
lxpolkit &
pidof slock || /home/jeff/bin/slock &
#pulseaudio --kill
start-pulseaudio-x11
