#!/bin/bash

date=(
   update_freq=60
   background.color=$YELLOW
   label.color=$GRAY_DARK
   label.padding_right=6
   icon.padding_left=0
   script="$HOME/.config/sketchybar/plugins/date.sh"
)

sketchybar --add item date right \
           --set date "${date[@]}"
