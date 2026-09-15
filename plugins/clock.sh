#!/usr/bin/env sh

source $HOME/.config/sketchybar/icons.sh

sketchybar --set $NAME label="$DATE $(date "+%d.%m.%y $CLOCK %H:%M:%S")"
