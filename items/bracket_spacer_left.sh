randomId=$(uuidgen)
sketchybar --add item bracket.spacer.$randomId left         \
sketchybar --set bracket.spacer.$randomId \
             background.drawing=off    \
             width=$SPACER_WIDTH
