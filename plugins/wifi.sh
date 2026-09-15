#!/usr/bin/env sh

SSID="$(echo $(shortcuts run "WifiSSID"))"

sketchybar --set wifi label="${SSID}"
