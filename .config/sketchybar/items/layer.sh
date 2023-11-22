#!/bin/bash

layer=(
   script="$HOME/.config/sketchybar/plugins/layer.sh"
   icon.color=$GRAY_DARK
   icon.font="$NERD_FONT_MONO"
   background.color=$YELLOW
)

sketchybar --add item yabai_layer left \
           --set yabai_layer "${layer[@]}" \
           --subscribe yabai_layer front_app_switched space_change display_change float_change layer_change window_focus
