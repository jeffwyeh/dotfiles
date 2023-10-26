#!/bin/bash

slack=(
   script="$HOME/.config/sketchybar/plugins/slack.sh"
   background.color=$WHITE
   update_freq=5
   icon.font.size=18
)

sketchybar  --add item slack left \
            --set slack "${slack[@]}" \
            --subscribe slack system_woke
