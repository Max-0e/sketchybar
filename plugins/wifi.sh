#!/usr/bin/env sh

SSID="$(echo $(shortcuts run "WifiSSID"))"

if [ $IS_INTERNAL_DISPLAY ]; then
  sketchybar --set wifi label.drawing=off
else
  sketchybar --set wifi label.drawing=on
fi

sketchybar --set wifi label="${SSID}"
