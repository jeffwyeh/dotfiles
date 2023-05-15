#!/bin/bash

# Show the time in 12-hour format as "10:10 AM"

sketchybar --set $NAME label="$(date '+%I:%M %p')"
