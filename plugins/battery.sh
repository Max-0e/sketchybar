#!/usr/bin/env sh

source $HOME/.config/sketchybar/icons.sh

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
  100) ICON=$BATTERY_100
  ;;
  9[0-9]) ICON=$BATTERY_90
  ;;
  8[0-9]) ICON=$BATTERY_80
  ;;
  7[0-9]) ICON=$BATTERY_70
  ;;
  6[0-9]) ICON=$BATTERY_60
  ;;
  5[0-9]) ICON=$BATTERY_50
  ;;
  4[0-9]) ICON=$BATTERY_40
  ;;
  3[0-9]) ICON=$BATTERY_30
  ;;
  2[0-9]) ICON=$BATTERY_20
  ;;
  1[0-9]) ICON=$BATTERY_10
  ;;
  *) ICON="$BATTERY_0"
esac

if [[ $CHARGING != "" ]]; then
  ICON=$BATTERY_CHARGING
fi

sketchybar --set $NAME icon="$ICON" label="${PERCENTAGE}%"
