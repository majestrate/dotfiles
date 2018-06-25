#!/bin/bash
systemctl --user import-environment DISPLAY
xrandr --output DisplayPort-1 --mode 1920x1080 --right-of DisplayPort-0
pidof compton || compton -cfbC --vsync drm
nitrogen --restore
pidof redshift || redshift & disown


