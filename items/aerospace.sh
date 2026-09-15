sketchybar --add event aerospace_workspace_change
sketchybar --add event aerospace_workspace_node_move

items=()
for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --subscribe space.$sid aerospace_workspace_node_move \
        --set space.$sid \
        label.font="$NERD_FONT:BOLD:$LARGE_FONT_SIZE" \
        label.padding_left=10 \
        label.padding_right=11 \
        icon.font="$SKETCHYBAR_ICONS_FONT:Regular:$LARGE_ICON_FONT_SIZE" \
        icon.x_offset=3 \
        icon.padding_left=5 \
        icon.padding_right=4 \
        padding_left=5 \
        padding_right=5 \
        background.color=0x22ffffff \
        background.corner_radius=16 \
        background.border_color=0x33000000 \
        background.height=$INSET_BACKGROUND_HEIGHT \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
    items+=(space.$sid)
done

sketchybar --add bracket aerospace.group ${items[@]} \
           --set aerospace.group background.color=0x22000000 \
                               background.height=$BRACKET_HEIGHT \
                               background.corner_radius=16 \
                               padding_left=10 \
                               background.shadow=on
