#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

CORES=$(sysctl -n hw.logicalcpu)
CPU_USAGE=$(ps -A -o %cpu | awk -v cores="$CORES" '{s+=$1} END {printf "%.0f", s/cores}')

COLOR=$WHITE
if [ "$CPU_USAGE" -ge 85 ]; then
  COLOR=$RED
elif [ "$CPU_USAGE" -ge 65 ]; then
  COLOR=$YELLOW
fi

sketchybar --set "$NAME" label="${CPU_USAGE}%" icon.color="$COLOR"
