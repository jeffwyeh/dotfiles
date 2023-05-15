#!/bin/bash

clock=(
   update_freq=2
   script="$HOME/.config/sketchybar/plugins/time.sh"
   label.padding_right=20
   icon.padding_left=0
   background.color=$GRAY_DARK
)

sketchybar --add item time right \
           --set time "${clock[@]}"
