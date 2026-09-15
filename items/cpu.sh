#!/usr/bin/env sh

# sketchybar --add item        cpu.top right                 \
           # --set cpu.top     label.font="$NERD_FONT:Medium:8" \
                             # label=CPU                     \
                             # icon.drawing=off              \
                             # width=0                       \
                             # y_offset=6                    \
                             # background.padding_right=10   \
                                                           # \
sketchybar --add item        cpu.percent right                 \
           --set cpu.percent label=CPU                     \
                             icon="􀫥" \
                             icon.drawing=on \
                             update_freq=2                 \
                             background.padding_right=5   \
                             background.padding_left=5   \
                             script="$PLUGIN_DIR/cpu.sh"
                                                           # \
           # --add graph       cpu.sys right 25             \
           # --set cpu.sys     width=0                       \
                             # graph.color=$RED              \
                             # graph.fill_color=$RED         \
                             # y_offset=12                   \
                             # label.drawing=off             \
                             # icon.drawing=off              \
                             # background.padding_right=10   \
                                                           # \
           # --add graph       cpu.user right 25            \
           # --set cpu.user    graph.color=$BLUE             \
                             # update_freq=2                 \
                             # y_offset=12                   \
                             # label.drawing=off             \
                             # icon.drawing=off              \
                             # background.padding_right=10   \
