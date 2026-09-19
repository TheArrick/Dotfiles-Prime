#!/usr/bin/env bash

# aerospace.sh - Plugin de espacios AeroSpace
# Muestra el estado activo/inactivo del workspace y los iconos
# de las apps abiertas en ese espacio (usando sketchybar-app-font).

CURRENT_WORKSPACE="$1"

source "$HOME/.config/sketchybar/colors.sh"

# Fallback si el evento no incluye FOCUSED_WORKSPACE (p.ej. space_windows_change o front_app_switched)
if [ -z "$FOCUSED_WORKSPACE" ]; then
  FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused 2>/dev/null)
fi

# ── Estado activo / inactivo ────────────────────────────────────────────────
if [ "$CURRENT_WORKSPACE" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" \
             background.drawing=on \
             icon.color="$BLACK"
else
  sketchybar --set "$NAME" \
             background.drawing=off \
             icon.color="$GREY"
fi

# Si el evento es solo cambio de foco del workspace, no necesitamos recargar las apps
if [ "$SENDER" = "aerospace_workspace_change" ]; then
  exit 0
fi

# ── Cargar mapeo de iconos solo cuando las apps o ventanas cambian ───────────
source "$HOME/.config/sketchybar/icon_map.sh"

# ── Apps en este workspace ──────────────────────────────────────────────────
APPS=$(aerospace list-windows --workspace "$CURRENT_WORKSPACE" \
       --format '%{app-name}' 2>/dev/null | sort -u)

# ── Construir tira de iconos ────────────────────────────────────────────────
ICON_STRIP=""
if [ -n "$APPS" ]; then
  while IFS= read -r app; do
    [ -z "$app" ] && continue
    __icon_map "$app"
    ICON_STRIP+="$icon_result "
  done <<< "$APPS"
fi

# Quitar espacio final
ICON_STRIP="${ICON_STRIP% }"

if [ -n "$ICON_STRIP" ]; then
  sketchybar --set "$NAME" \
             label="$ICON_STRIP" \
             label.drawing=on
else
  sketchybar --set "$NAME" label.drawing=off
fi
