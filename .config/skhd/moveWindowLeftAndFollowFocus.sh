#!/bin/dash
curWindowId="$(yabai -m query --windows --window | jq -re ".id")"

$(yabai -m window --display prev || yabai -m window --display first)
$(yabai -m window --focus "$curWindowId")
