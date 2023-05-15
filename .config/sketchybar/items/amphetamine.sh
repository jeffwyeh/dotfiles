#!/bin/bash

amphetamine=(
   update_freq=5
   background.color=$GRAY_LIGHT
   icon.color=$GRAY_DARK
   icon=""
   script="$HOME/.config/sketchybar/plugins/amphetamine.sh"
)

sketchybar --add item amphetamine right \
           --set amphetamine "${amphetamine[@]}"
