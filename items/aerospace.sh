sketchybar --add event aerospace_workspace_change
sketchybar --add event aerospace_workspace_node_move

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --subscribe space.$sid aerospace_workspace_node_move \
        --set space.$sid \
        label.font="$NERD_FONT:BOLD:$LARGE_FONT_SIZE" \
        icon.font="$NERD_FONT:BOLD:$LARGE_ICON_FONT_SIZE" \
        padding_left=5 \
        padding_right=5 \
        background.color=0x22ffffff \
        background.corner_radius=5 \
        background.height=$INSET_BACKGROUND_HEIGHT \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done
