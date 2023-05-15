#!/bin/bash

WINDOW_TITLE=$(yabai -m query --windows --window | jq -r '.title')
 
if [[ $WINDOW_TITLE = "" ]]; then
  WINDOW_TITLE=$(yabai -m query --windows --window | jq -r '.app')
fi

if [[ ${#WINDOW_TITLE} -gt 50 ]]; then
  WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-50)A
  WINDOW_TITLE=$WINDOW_TITLE...
fi

sketchybar --set system.label label="$WINDOW_TITLE"

# To only display on active screen:
#case "$SENDER" in
#  "front_app_switched") sketchybar --set system.label label="$WINDOW_TITLE"
#  ;;
#  "display_change") sketchybar --set system.label associated_display=$INFO
#  ;;
#esac
