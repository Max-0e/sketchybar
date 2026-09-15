sketchybar --add item music right \
           --set music \
             script="$PLUGIN_DIR/spotify.sh" \
             padding_left=8 \
             padding_right=8 \
             icon.drawing=off \
             icon.padding_left=0 \
             label.padding_left=0 \
             label.padding_right=0 \
             click_script="open -a Spotify" \
             update_freq=2 \
             background.drawing=off \
           --subscribe music media_change

sketchybar --add item music_art right \
           --set music_art \
             drawing=off \
             icon.drawing=off \
             label.drawing=off \
             padding_left=8 \
             padding_right=4 \
             background.color=$TRANSPARENT \
             background.border_width=0 \
             background.height=40 \
             background.corner_radius=4 \
             background.drawing=on \
             click_script="open -a Spotify"
