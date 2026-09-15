#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

MEM_PERCENT="$(ps -A -o %mem | awk '{ mem += $1} END { printf "%.0f\n", mem }' )"

COLOR=$WHITE
case "$MEM_PERCENT" in
  [1-5][0-9]) COLOR=$WHITE
  ;;
  [6-7][0-9]) COLOR=$YELLOW
  ;;
  [8][0-9]) COLOR=$ORANGE
  ;;
  [9][0-9]|100) COLOR=$RED
  ;;
esac

sketchybar --set  ram.percent label=$MEM_PERCENT% \
                              label.color=$COLOR  \
