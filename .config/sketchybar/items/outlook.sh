#!/bin/bash

outlook=(
   script="$HOME/.config/sketchybar/plugins/outlook.sh"
   background.color=$WHITE
   update_freq=5
   icon.font.size=18
   icon.padding_left=6
)

sketchybar  --add item outlook left \
            --set outlook "${outlook[@]}" \
            --subscribe outlook system_woke
