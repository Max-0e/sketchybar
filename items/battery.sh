sketchybar --add item battery right                      \
           --set battery script="$PLUGIN_DIR/battery.sh" \
                         update_freq=10                  \
                         background.color=$BRACKET_BACKGROUND_COLOR \
                         background.height=$BRACKET_HEIGHT \
                         background.corner_radius=16 \
                         label.padding_right=20   \
                         icon.padding_left=20   \
                         background.shadow=on \
           --subscribe battery system_woke
