#!/bin/dash
curOpacity="$(yabai -m config window_opacity)"

if [ $curOpacity = "on" ]; then
   $(yabai -m config window_opacity off)
else
   $(yabai -m config window_opacity on)
fi

#$(yabai -m window --display next || yabai -m window --display first)
#$(yabai -m window --focus "$curWindowId")
