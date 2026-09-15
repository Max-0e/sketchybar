#!/usr/bin/env bash

source $HOME/.config/sketchybar/icons.sh
ICON_MAP=$HOME/.config/sketchybar/icon_map.sh
source $ICON_MAP

if [ ! -z $FOCUSED_WORKSPACE ]; then
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
      sketchybar --set $NAME background.color=0x44ffffff \
                             background.border_width=0
  else
      sketchybar --set $NAME background.color=0x22ffffff \
                             background.border_width=0
  fi
fi

icons=""
while IFS= read -r app; do
  __icon_map "$app"
  icons="$icons$icon_result"
done < <(aerospace list-windows --workspace "$1" | awk -F '|' '{print $2}' | awk '{$1=$1;print}')

if [ -z "$icons" ]; then
  sketchybar --set $NAME icon.drawing=off label.drawing=on label="$1"
else
  icons="$(echo ${icons// /})"
  sketchybar --set $NAME icon.drawing=on label.drawing=off icon="$icons"
fi
