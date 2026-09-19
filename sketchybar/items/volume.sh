#!/bin/bash

# Volume item - solo ícono con toggle de mute (sin barra/slider deslizante)
volume_icon=(
  click_script="$PLUGIN_DIR/volume_click.sh"
  padding_left=10
  padding_right=5
  icon=$VOLUME_100
  icon.color=$WHITE
  icon.font="$FONT:Regular:14.0"
  label.drawing=off
)

sketchybar --add item volume_icon right         \
           --set volume_icon "${volume_icon[@]}" \
           --subscribe volume_icon volume_change
