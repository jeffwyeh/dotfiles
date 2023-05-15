#!/bin/bhas

systemlabel=(
   label=Window
   script="$HOME/.config/sketchybar/plugins/window_title.sh"
)

sketchybar --add item system.label center \
           --set system.label "${systemlabel[@]}" \
           --subscribe system.label front_app_switched space_change display_change
