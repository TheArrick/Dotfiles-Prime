#!/bin/bash

# Plugin de batería - muestra icono dinámico y porcentaje de carga

source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

COLOR=$WHITE
case ${PERCENTAGE} in
  9[0-9]|100) ICON=$BATTERY_100; COLOR=$GREEN  ;;
  [6-8][0-9]) ICON=$BATTERY_75;  COLOR=$WHITE  ;;
  [3-5][0-9]) ICON=$BATTERY_50;  COLOR=$WHITE  ;;
  [1-2][0-9]) ICON=$BATTERY_25;  COLOR=$YELLOW ;;
  *)           ICON=$BATTERY_0;   COLOR=$RED    ;;
esac

if [[ "$CHARGING" != "" ]]; then
  ICON=$BATTERY_CHARGING
  COLOR=$GREEN
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" label="${PERCENTAGE}%" label.drawing=on
