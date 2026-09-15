#!/usr/bin/env sh
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"
MAX_CHARS=30
ART_COUNTER_FILE="/tmp/sketchybar_art_counter"
ART_LAST_TITLE_FILE="/tmp/sketchybar_art_last_title"
ART_ITEM="${NAME}_art"

truncate_str() {
  local s="$1"
  if [ "${#s}" -gt "$MAX_CHARS" ]; then
    echo "${s:0:$MAX_CHARS}…"
  else
    echo "$s"
  fi
}

fetch_artwork() {
  local title="$1"
  local art_url="$2"
  local last_title counter art_file tmp_file
  last_title=$(cat "$ART_LAST_TITLE_FILE" 2>/dev/null) || true

  if [ "$title" = "$last_title" ]; then
    counter=$(cat "$ART_COUNTER_FILE" 2>/dev/null || echo 1)
    art_file="/tmp/sketchybar_art_${counter}.jpg"
    if [ -f "$art_file" ]; then echo "$art_file"; return; fi
  fi

  counter=$(( $(cat "$ART_COUNTER_FILE" 2>/dev/null || echo 0) + 1 ))
  echo "$counter" > "$ART_COUNTER_FILE"
  echo "$title" > "$ART_LAST_TITLE_FILE"

  art_file="/tmp/sketchybar_art_${counter}.jpg"
  tmp_file="${art_file}.tmp"

  curl -sL "$art_url" -o "$tmp_file" 2>/dev/null || true
  if [ -s "$tmp_file" ]; then
    sips -Z 96 "$tmp_file" >/dev/null 2>&1 || true
    find /tmp -maxdepth 1 -name "sketchybar_art_*.jpg" -delete 2>/dev/null || true
    mv "$tmp_file" "$art_file"
    echo "$art_file"
  else
    rm -f "$tmp_file"
  fi
}

set_artwork() {
  local art_file="$1"
  if [ -n "${art_file:-}" ] && [ -f "$art_file" ]; then
    sketchybar --set "$ART_ITEM" \
      drawing=on \
      background.image="$art_file" \
      background.image.drawing=on \
      background.image.scale=0.3 \
      background.image.corner_radius=4
  else
    sketchybar --set "$ART_ITEM" drawing=off
  fi
}

# Single osascript call avoids 5x AppleScript VM forks per update cycle
SPOTIFY_INFO=$(osascript 2>/dev/null <<'EOF'
if application "Spotify" is running then
  tell application "Spotify"
    if player state is playing then
      return (player state as string) & "|" & (name of current track) & "|" & (artist of current track) & "|" & (artwork url of current track)
    end if
  end tell
end if
return ""
EOF
) || true

if [ -n "$SPOTIFY_INFO" ]; then
  TRACK=$(echo "$SPOTIFY_INFO" | cut -d'|' -f2)
  ARTIST=$(echo "$SPOTIFY_INFO" | cut -d'|' -f3)
  ART_URL=$(echo "$SPOTIFY_INFO" | cut -d'|' -f4)

  if [ -n "$TRACK" ] && [ -n "$ARTIST" ]; then
    TRACK="$(truncate_str "$TRACK")"
    ARTIST="$(truncate_str "$ARTIST")"
    ART_FILE=$(fetch_artwork "$TRACK" "$ART_URL") || true
    set_artwork "$ART_FILE"
    sketchybar --set "$NAME" drawing=on label="$TRACK" label.drawing=on
    sketchybar --set "$NAME.artist" drawing=on label="$ARTIST" label.drawing=on
    exit 0
  fi
fi

# Nothing playing keep fixed-width invisible placeholder so center items don't drift.
# Total width 242 = art(34) + music(208) when playing; spacer absorbs that gap when stopped.
sketchybar --set "$ART_ITEM" drawing=off
sketchybar --set "$NAME" drawing=on label="" label.drawing=off

exit 0
