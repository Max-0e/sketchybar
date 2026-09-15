#!/usr/bin/env sh

sketchybar --add item space_separator left                            \
--add item window_title left                               \
--set window_title    script="$PLUGIN_DIR/window_title.sh" \
icon.drawing=off                     \
padding_right=10                     \
label.font="$NERD_FONT:BOLD:20.0"         \
--subscribe window_title front_app_switched
