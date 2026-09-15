#!/usr/bin/env sh
if [ "$(nowplaying-cli get playbackRate)" = 1 ]; then
  ARTIST=$(nowplaying-cli get artist)
  TRACK=$(nowplaying-cli get title)

  INFO="$ARTIST - $TRACK"
  if [ ${#INFO} -gt 40 ]; then
    INFO="$(echo "$INFO" | cut -c 1-22)..."
  fi

  ### Update SketchyBar to show the item and text
  sketchybar --set "$NAME" drawing=on label="$INFO"
else

  ### Hide the item entirely when paused or closed
  sketchybar --set "$NAME" drawing=on label="Spotify is paused"
fi
