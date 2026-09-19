#!/bin/sh

# Muestra solo la hora en formato HH:MM
sketchybar --set "$NAME" label="$(date '+%H:%M')"
