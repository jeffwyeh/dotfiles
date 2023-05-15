#!/bin/bash

float=(
   script="$HOME/.config/sketchybar/plugins/float.sh"
   click_script="yabai window --toggle float"
   icon.color=$GRAY_DARK
   background.color=$YELLOW
)

sketchybar --add item yabai_float left \
           --set yabai_float "${float[@]}" \
           --subscribe yabai_float front_app_switched space_change display_change mouse.clicked float_change
