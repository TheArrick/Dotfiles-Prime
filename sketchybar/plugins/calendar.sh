#!/bin/sh

# Muestra la fecha expandida (ej: Thu 17 Sep)
sketchybar --set "$NAME" label="$(date '+%a %d %b')"
