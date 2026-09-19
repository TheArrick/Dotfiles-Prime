#!/bin/bash

# RAM item - muestra memoria RAM usada y abre Monitor de Actividad con click
ram=(
  icon="󰘚"
  icon.font="$FONT:Bold:14.0"
  icon.color=$WHITE
  label.font="$FONT:Bold:13.0"
  label.color=$WHITE
  label.padding_left=2
  label.padding_right=6
  padding_left=5
  padding_right=5
  update_freq=10
  script="$PLUGIN_DIR/ram.sh"
  click_script="open -a 'Activity Monitor'"
)

sketchybar --add item ram right \
           --set ram "${ram[@]}"
