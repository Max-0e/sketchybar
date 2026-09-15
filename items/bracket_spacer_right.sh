randomId=$(uuidgen)
sketchybar --add item bracket.spacer.$randomId right        \
sketchybar --set bracket.spacer.$randomId \
             background.drawing=off    \
             width=$SPACER_WIDTH
