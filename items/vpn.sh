source "$PLUGIN_DIR/vpn.sh"

MENU_WIDTH=150

vpn_control=(
  icon=$VPN_DISCONNECTED
  update_freq=10
  click_script="$POPUP_CLICK_SCRIPT"
  script="$PLUGIN_DIR/vpn_state.sh"
  popup.background.color=0x10000000
  popup.blur_radius=5
  popup.background.corner_radius=10
  popup.height=0
)

vpn_disconnect=(
  icon=$VPN_DISCONNECTED
  label="disconnect"
  width=$MENU_WIDTH
  background.height=30
  background.drawing=on
  click_script="$DISCONNECT_SCRIPT; $POPUP_OFF"
)
vpn_connect=(
  icon=$VPN_CONNECTED
  label="connect"
  width=$MENU_WIDTH
  background.height=30
  background.drawing=on
  click_script="$CONNECT_SCRIPT; $POPUP_OFF"
)

sketchybar --add item           vpn.control right                       \
           --set vpn.control    "${vpn_control[@]}"                     \
                                                                        \
           --add item           vpn.disconnect popup.vpn.control        \
           --set vpn.disconnect "${vpn_disconnect[@]}"                  \
                                                                        \
           --add item           vpn.connect popup.vpn.control           \
           --set vpn.connect    "${vpn_connect[@]}"
