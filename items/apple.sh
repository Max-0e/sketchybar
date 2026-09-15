#### Apple Logo ####
# sketchybar -m                                             \
           # --add item apple.logo left                     \
           # --set apple.logo icon=$APPLE_ICN               \
                            # icon.font="$FONT:Heavy:16.0"  \
                            # padding_left=10                     \
                            # label.drawing=off             \
                            # icon.padding_right=10         \
#
#
#!/bin/bash

POPUP_OFF="sketchybar --set apple.logo popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"
MENU_WIDTH=150

apple_logo=(
  icon=$APPLE_ICN
  padding_right=15
  padding_left=15
  label.drawing=off
  click_script="$POPUP_CLICK_SCRIPT"
  popup.background.color=0x30000000
  popup.blur_radius=5
  popup.background.corner_radius=10
  popup.height=0
)

apple_prefs=(
  icon=$PREFERENCES
  label="Preferences"
  background.height=30
  background.drawing=on
  width=$MENU_WIDTH
  click_script="open -a 'System Preferences'; $POPUP_OFF"
)

apple_activity=(
  icon=$ACTIVITY
  label="Activity"
  width=$MENU_WIDTH
  background.height=30
  background.drawing=on
  click_script="open -a 'Activity Monitor'; $POPUP_OFF"
)

apple_divider=(
  icon.drawing=off
  label.drawing=off
  background.color=$WHITE
  background.height=1
  padding_left=7
  padding_right=7
  width=$MENU_WIDTH
  background.drawing=on
)

apple_lock=(
  icon=$LOCK
  label="Lock Screen"
  width=$MENU_WIDTH
  background.height=30
  background.drawing=on
  click_script="pmset displaysleepnow; $POPUP_OFF"
)

apple_reboot=(
  icon=$REBOOT
  label="Reboot"
  width=$MENU_WIDTH
  background.height=30
  background.drawing=on
  click_script="shutdown -r now; $POPUP_OFF"
)

apple_shutdown=(
  icon=$SHUTDOWN
  label="Shutdown"
  width=$MENU_WIDTH
  background.height=30
  background.drawing=on
  click_script="shutdown -h now; $POPUP_OFF"
)

sketchybar --add item apple.logo left                  \
           --set apple.logo "${apple_logo[@]}"         \
                                                       \
           --add item apple.prefs popup.apple.logo     \
           --set apple.prefs "${apple_prefs[@]}"       \
                                                       \
           --add item apple.activity popup.apple.logo  \
           --set apple.activity "${apple_activity[@]}" \
                                                       \
           --add item apple.divider popup.apple.logo   \
           --set apple.divider "${apple_divider[@]}"   \
                                                       \
           --add item apple.lock popup.apple.logo      \
           --set apple.lock "${apple_lock[@]}"         \
                                                       \
           --add item apple.reboot popup.apple.logo  \
           --set apple.reboot "${apple_reboot[@]}" \
                                                       \
           --add item apple.shutdown popup.apple.logo    \
           --set apple.shutdown "${apple_shutdown[@]}"
