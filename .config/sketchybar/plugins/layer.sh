#!/bin/bash

# Show an icon for the layer of the selected window

LAYER=$(yabai -m query --windows --window | jq -r '."layer"')
echo $LAYER

if [[ $LAYER == "above" ]]; then
   sketchybar --set yabai_layer icon="1"
elif [[ $LAYER == "normal" ]]; then
   sketchybar --set yabai_layer icon="2"
elif [[ $LAYER == "below" ]]; then
   sketchybar --set yabai_layer icon="3"
fi
