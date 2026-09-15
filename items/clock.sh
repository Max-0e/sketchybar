sketchybar --add item clock right \
           --set clock   \
             update_freq=1 \
             background.color=$BRACKET_BACKGROUND_COLOR \
             background.height=$BRACKET_HEIGHT \
             background.corner_radius=16 \
             background.shadow=on \
             script="$PLUGIN_DIR/clock.sh" \
