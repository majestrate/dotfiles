#!/bin/sh
echo $TMUX | cut -d'/' -f 4 | cut -d',' -f 1
