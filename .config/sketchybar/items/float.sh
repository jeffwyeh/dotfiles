#!/bin/bash

float=(
   script="$HOME/.config/sketchybar/plugins/float.sh"
   click_script="yabai window --toggle float"
   icon.color=$GRAY_DARK
   icon.font="$NERD_FONT_MONO"
   background.color=$YELLOW
)

sketchybar --add item yabai_float left \
           --set yabai_float "${float[@]}" \
           --subscribe yabai_float front_app_switched space_change display_change float_change window_focus
