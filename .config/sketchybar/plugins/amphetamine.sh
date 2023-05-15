#!/bin/bash

BLUE="0xff6ed6e6"
RED="0xffff8c8c"

if [[ $(pmset -g assertions | grep "Amphetamine") ]]; then
   COLOR=$RED
else
   COLOR=$BLUE
fi

sketchybar --set amphetamine background.color=$COLOR \
           --set amphetamine_transition background.color=$COLOR \
           --set amphetamine_battery_transition icon.color=$COLOR
