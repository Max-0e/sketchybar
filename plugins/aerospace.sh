#!/usr/bin/env bash

source $HOME/.config/sketchybar/icons.sh
ICON_MAP=$HOME/.config/sketchybar/icon_map.sh

if [ ! -z $FOCUSED_WORKSPACE ]; then
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
      sketchybar --set $NAME background.color=0x44ffffff \
                             background.border_width=2
  else
      sketchybar --set $NAME background.color=0x22ffffff \
                             background.border_width=0
  fi
fi

icons=$($ICON_MAP $(aerospace list-windows --workspace $1 | awk -F '|' '{print $2}' | xargs))

if [ -z "$icons" ]; then
  sketchybar --set $NAME icon.drawing=off label.drawing=on label="$1"
else
  icons=$(echo ${icons// /})
  sketchybar --set $NAME icon.drawing=on label.drawing=off icon="$icons"
fi
