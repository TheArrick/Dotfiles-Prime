#!/bin/bash

# Toggle mute al hacer clic en el ícono de volumen

source "$HOME/.config/sketchybar/colors.sh"

MUTED=$(osascript -e "output muted of (get volume settings)")

if [ "$MUTED" = "true" ]; then
  osascript -e "set volume without output muted"
  sketchybar --set volume_icon icon.color="$GREY"
else
  osascript -e "set volume with output muted"
  sketchybar --set volume_icon icon.color="$RED"
fi
