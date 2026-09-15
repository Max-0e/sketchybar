#!/usr/bin/env sh
source $HOME/.config/sketchybar/icons.sh
source $HOME/.config/sketchybar/colors.sh

STATE=$(/opt/cisco/secureclient/bin/vpn state)

if [ -z $STATE]; then
  sketchybar --set $NAME drawing=off
elif [ $(echo "$STATE" | grep -c 'state: Connected') -gt 0 ]; then 
  LABEL=$(echo "$STATE" | grep 'notice:' | cut -d ':' -f 2 | xargs)

  if [ ${#LABEL} -gt 40 ]; then
    LABEL="$(echo "$LABEL" | cut -c 1-20)..."
  fi

  sketchybar --set $NAME icon=$VPN_CONNECTED icon.color=$GREEN label=$LABEL label.drawing="on"
else 
  sketchybar --set $NAME icon=$VPN_DISCONNECTED icon.color=$YELLOW label.drawing="off"
fi
