#!/usr/bin/env sh

sketchybar --add item window_title left                               \
           --set window_title    script="$PLUGIN_DIR/window_title.sh" \
             icon.drawing=off                     \
             background.color=$BRACKET_BACKGROUND_COLOR \
             background.height=$BRACKET_HEIGHT \
             background.corner_radius=16 \
             background.shadow=on \
             padding_right=10                     \
             label.font="$NERD_FONT:BOLD:$LARGE_FONT_SIZE"         \
           --subscribe window_title front_app_switched
