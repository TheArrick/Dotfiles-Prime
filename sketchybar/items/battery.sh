#!/bin/bash

# Battery item - muestra icono y porcentaje de batería

battery=(
  script="$PLUGIN_DIR/battery.sh"
  icon.font="$FONT:Regular:16.0"
  icon.padding_right=2
  label.font="$FONT:Bold:13.0"
  label.color=$WHITE
  label.drawing=on
  label.padding_left=2
  label.padding_right=4
  padding_left=4
  padding_right=8
  update_freq=60
  updates=on
  click_script="open /System/Library/PreferencePanes/Battery.prefPane"
)

sketchybar --add item battery right \
           --set battery "${battery[@]}"
