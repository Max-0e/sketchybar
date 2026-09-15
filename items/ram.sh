#!/usr/bin/env sh

sketchybar --add item        ram.percent right                 \
           --set ram.percent label=RAM                    \
                             icon="" \
                             icon.drawing=on \
                             update_freq=2                 \
                             background.padding_right=5   \
                             background.padding_left=5   \
                             script="$PLUGIN_DIR/ram.sh"
