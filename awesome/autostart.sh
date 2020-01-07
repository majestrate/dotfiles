#!/bin/bash
#systemctl --user import-environment DISPLAY
xrandr --output DisplayPort-2 --mode 3840x2160 --right-of DisplayPort-3 --dpi 190
xrandr --auto --output DisplayPort-1 --mode 1366x768 --right-of DisplayPort-2 --dpi 190
xrandr --auto --output DisplayPort-3 --mode 3840x2160 --dpi 190
pkill compton ; compton -cfbC
nitrogen --restore
pidof redshift || redshift & disown
xbindkeys -f ~/.xbindkeysrc
run_keybase
kdeconnect-indicator & disown
pkill xscreensaver
xscreensaver & disown
setxkbmap -option ctrl:nocaps
