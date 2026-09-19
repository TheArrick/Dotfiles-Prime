#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

IP=$(ipconfig getifaddr en0 2>/dev/null)
SSID=$(ipconfig getsummary en0 2>/dev/null | awk -F ' : ' '/^[[:space:]]*SSID/ {print $2}')

if [ -z "$IP" ]; then
  sketchybar --set "$NAME" icon="󰤭" icon.color="$GREY" label="Offline" label.color="$GREY"
  exit 0
fi

# Al hacer clic alterna entre mostrar SSID y la IP local
if [ "$SENDER" = "mouse.clicked" ]; then
  CURRENT_LABEL=$(sketchybar --query "$NAME" | grep '"value":' | tail -n 1 | cut -d '"' -f 4)
  if [ "$CURRENT_LABEL" = "$SSID" ]; then
    sketchybar --set "$NAME" label="$IP"
  else
    sketchybar --set "$NAME" label="${SSID:-Connected}"
  fi
  exit 0
fi

sketchybar --set "$NAME" icon="󰤨" icon.color="$WHITE" label="${SSID:-Connected}" label.color="$WHITE"
