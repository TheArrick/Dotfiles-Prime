#!/bin/bash

# CPU item - porcentaje de CPU y acceso rápido a Monitor de Actividad
cpu=(
  icon=""
  icon.font="$FONT:Bold:14.0"
  icon.color=$WHITE
  label.font="$FONT:Bold:13.0"
  label.color=$WHITE
  label.padding_left=2
  label.padding_right=6
  padding_left=5
  padding_right=5
  update_freq=4
  script="$PLUGIN_DIR/cpu.sh"
  click_script="open -a 'Activity Monitor'"
)

sketchybar --add item cpu right \
           --set cpu "${cpu[@]}"
