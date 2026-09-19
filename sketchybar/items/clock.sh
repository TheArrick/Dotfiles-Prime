#!/bin/bash

# Clock item - muestra la hora (HH:MM) con click para abrir Calendario

sketchybar --add item clock right \
           --set clock \
                 update_freq=10 \
                 icon.drawing=off \
                 label.font="$FONT:Bold:14.0" \
                 label.color=$WHITE \
                 padding_left=8 \
                 padding_right=4 \
                 script="$PLUGIN_DIR/clock.sh" \
                 click_script="open -a Calendar"
