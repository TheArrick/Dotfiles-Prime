#!/bin/bash

# Calendar item - muestra la fecha expandida con click para abrir Calendario

calendar=(
  icon=cal
  icon.font="$FONT:Black:12.0"
  icon.color=$GREY
  icon.padding_right=4
  label.font="$FONT:Bold:13.0"
  label.color=$WHITE
  padding_left=4
  padding_right=4
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
  click_script="open -a Calendar"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
