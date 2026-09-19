#!/bin/bash

# aerospace_spaces.sh - Workspaces de AeroSpace con iconos de apps
# Cada espacio muestra su número (icon) + iconos de las apps abiertas (label)

WORKSPACES=$(aerospace list-workspaces --all | grep -v '^0$')
WORKSPACES="$WORKSPACES 0"

for sid in $WORKSPACES; do
    sketchybar --add item space.$sid left \
               --subscribe space.$sid aerospace_workspace_change space_windows_change front_app_switched \
               --set space.$sid \
               background.color=$GREEN \
               background.corner_radius=6 \
               background.height=24 \
               background.drawing=off \
               icon="$sid" \
               icon.font="$FONT:Bold:14.0" \
               icon.color=$GREY \
               icon.padding_left=8 \
               icon.padding_right=4 \
               label="" \
               label.drawing=on \
               label.font="sketchybar-app-font:Regular:16.0" \
               label.color=$WHITE \
               label.padding_left=4 \
               label.padding_right=8 \
               padding_left=2 \
               padding_right=2 \
               click_script="aerospace workspace $sid" \
               script="$PLUGIN_DIR/aerospace.sh $sid"
done

# Separador chevron
sketchybar --add item chevron left \
           --set chevron \
                 icon=$ICON_CHEVRON \
                 icon.color=$GREY \
                 icon.font="$FONT:Bold:10.0" \
                 label.drawing=off \
                 padding_left=4 \
                 padding_right=0

# Bracket que agrupa los espacios
sketchybar --add bracket spaces '/space\\..*/' chevron \
           --set spaces \
                 background.color=$POPUP_BACKGROUND_COLOR \
                 background.corner_radius=12 \
                 background.border_width=1 \
                 background.border_color=$GREEN \
                 background.height=32 \
                 blur_radius=2
