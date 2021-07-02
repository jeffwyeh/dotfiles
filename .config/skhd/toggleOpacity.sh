#!/bin/dash
curOpacity="$(yabai -m query --windows --window | jq -re ".opacity")"

if [ $curOpacity = 0.99 ]; then
   $(yabai -m window --opacity 0.0)
else
   $(yabai -m window --opacity 0.99)
fi

newOpacity="$(yabai -m query --windows --window | jq -re ".opacity")"
echo "Opacity is:"
echo $newOpacity


#$(yabai -m window --display next || yabai -m window --display first)
#$(yabai -m window --focus "$curWindowId")
