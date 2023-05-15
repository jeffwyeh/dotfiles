#!/bin/bash

battery=(
   icon.padding_right=4
   label.color=$GRAY_DARK
   icon.color=$GRAY_DARK
   icon.padding_left=6
   label.padding_right=6
   update_freq=120
   updates=on
   script="$HOME/.config/sketchybar/plugins/battery.sh"
)

sketchybar --add item battery right      \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke
