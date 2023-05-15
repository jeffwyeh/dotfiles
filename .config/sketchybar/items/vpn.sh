#!/bin/bash

vpn=(
   icon=""
   icon.drawing=off
   update_freq=5
   script="$HOME/.config/sketchybar/plugins/vpn.sh"
)

sketchybar --add item vpn left \
           --set vpn "${vpn[@]}"
