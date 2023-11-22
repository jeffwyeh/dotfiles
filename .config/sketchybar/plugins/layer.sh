#!/bin/bash

# Show an icon for the layer of the selected window

LAYER=$(yabai -m query --windows --window | jq -r '."layer"')
echo $LAYER

ICON="󰃈"

if [[ $LAYER == "above" ]]; then
   ICON="󰃑"
elif [[ $LAYER == "normal" ]]; then
   ICON="󰃊"
elif [[ $LAYER == "below" ]]; then
   ICON="󰃈"
fi

echo $ICON

sketchybar --set yabai_layer icon=$ICON
