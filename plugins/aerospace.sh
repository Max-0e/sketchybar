#!/usr/bin/env bash

source $HOME/.config/sketchybar/icons.sh

if [ ! -z $FOCUSED_WORKSPACE ]; then
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
      sketchybar --set $NAME background.color=0x44ffffff
  else
      sketchybar --set $NAME background.color=0x22ffffff
  fi
fi

windows=$(aerospace list-windows --workspace $1)
icons=""
if echo "$windows" | grep -q "Ghostty"; then
  icons="$icons $TERMINAL"
fi
if echo "$windows" | grep -q "Arc"; then
  icons="$icons $BROWSER"
fi
if echo "$windows" | grep -q "Teams"; then
  icons="$icons $TEAMS"
fi
if echo "$windows" | grep -q "Outlook"; then
  icons="$icons $MAIL"
fi

if echo "$windows" | grep -q "ZenNotes"; then
  icons="$icons $NOTES"
fi

if echo "$windows" | grep -q "Discord"; then
  icons="$icons $DISCORD"
fi

if echo "$windows" | grep -q "Spotify"; then
  icons="$icons $SPOTIFY"
fi

if echo "$windows" | grep -q "Zulip"; then
  icons="$icons $ZULIP"
fi

if [ -z "$icons" ]; then
  sketchybar --set $NAME icon.drawing=off label.drawing=on label="$1" \
        label.padding_left=10 \
        label.padding_right=10
else
  sketchybar --set $NAME icon.drawing=on label.drawing=off icon="$icons" \
        icon.padding_right=25 \
        icon.padding_left=0
fi
