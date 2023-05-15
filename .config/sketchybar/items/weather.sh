#!/bin/bash

weather=(
   update_freq=600
   icon.padding_right=4
   icon.font="$NERD_FONT"
   icon.y_offset=2
   icon.color=$GRAY_DARK
   label.color=$GRAY_DARK
   label.padding_right=4
   background.color=$GRAY_LIGHT
   script="$HOME/.config/sketchybar/plugins/weather.sh"
)

sketchybar --add item weather right \
           --set weather "${weather[@]}"
