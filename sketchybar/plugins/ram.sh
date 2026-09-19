#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

RAM_USED=$(vm_stat | awk '
  /page size of/ { gsub(/[^0-9]/,"",$8); ps=$8 }
  /Pages active:/ { a=$3 }
  /Pages wired down:/ { w=$4 }
  /Pages occupied by compressor:/ { c=$5 }
  END {
    gsub(/\./,"",a); gsub(/\./,"",w); gsub(/\./,"",c);
    used = (a + w + c) * ps / (1024*1024*1024);
    printf "%.1f", used;
  }')

TOTAL_RAM_GB=$(sysctl -n hw.memsize | awk '{printf "%.0f", $1/(1024*1024*1024)}')
PERCENT=$(awk -v u="$RAM_USED" -v t="$TOTAL_RAM_GB" 'BEGIN {printf "%.0f", (u/t)*100}')

COLOR=$WHITE
if [ "$PERCENT" -ge 90 ]; then
  COLOR=$RED
elif [ "$PERCENT" -ge 80 ]; then
  COLOR=$YELLOW
fi

sketchybar --set "$NAME" label="${RAM_USED}G" icon.color="$COLOR"
