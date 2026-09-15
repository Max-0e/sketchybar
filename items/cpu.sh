#!/usr/bin/env sh

POPUP_OFF="sketchybar --set cpu.percent popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set cpu.percent popup.drawing=toggle"
MENU_WIDTH=150

sketchybar --add item        cpu.temp right                 \
           --set cpu.temp    label.font="$NERD_FONT:BOLD:$BASE_SUBTITLE_FONT_SIZE" \
                             label=CPU                     \
                             icon.drawing=off              \
                             width=0                       \
                             y_offset=-$SUBTITLE_OFFSET \
                             background.padding_right=10
sketchybar --add item        cpu.percent right                 \
           --set cpu.percent label=CPU                     \
                             icon="$CPU" \
                             icon.drawing=on \
                             label.width=40                       \
                             label.y_offset=$SUBTITLE_OFFSET     \
                             update_freq=10                 \
                             background.padding_right=5   \
                             background.padding_left=5   \
                             click_script="$POPUP_CLICK_SCRIPT" \
                             popup.background.color=0x30CCCCCC \
                             popup.blur_radius=5 \
                             popup.background.corner_radius=16 \
                             popup.background.padding_left=2 \
                             popup.shadow=on \
                             popup.height=0 \
                             script="$PLUGIN_DIR/cpu.sh"

sketchybar --add item testprocess popup.cpu.percent \
           --set item testprocess \
                 icon.drawing=off \
                 label="TEST" \
                 width=$MENU_WIDTH \
                 background.height=30 \
                 background.drawing=on

for ((i = 1; i <= 5; i++)); do
  sketchybar --add item cpu.top_process_$i popup.cpu.percent \
             --set cpu.top_process_$i \
                   icon.drawing=off \
                   label="$i" \
                   width=$MENU_WIDTH \
                   background.height=30 \
                   background.drawing=on
done

