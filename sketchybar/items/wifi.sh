#!/bin/bash

# Wi-Fi item - muestra red conectada o IP (toggle con clic)
wifi=(
  icon="󰤨"
  icon.font="$FONT:Bold:14.0"
  icon.color=$WHITE
  label.font="$FONT:Bold:13.0"
  label.color=$WHITE
  label.padding_left=2
  label.padding_right=4
  padding_left=8
  padding_right=4
  update_freq=20
  script="$PLUGIN_DIR/wifi.sh"
  click_script="$PLUGIN_DIR/wifi.sh"
)

sketchybar --add item wifi right          \
           --set wifi "${wifi[@]}"         \
           --subscribe wifi wifi_change mouse.clicked
