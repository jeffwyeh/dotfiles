#!/bin/bash

stack=(
   script="$HOME/.config/sketchybar/plugins/stack.sh"
   drawing=on
   update_freq=0
   background.padding_left=0
)

sketchybar --add item stack center \
           --set stack "${stack[@]}" \
           --subscribe stack front_app_switched space_change display_change window_focus float_change

