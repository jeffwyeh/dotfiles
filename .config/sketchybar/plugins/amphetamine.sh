#!/bin/bash

if [[ $(pmset -g assertions | grep "Amphetamine") ]]; then
   COLOR="0xffff8c8c"
else
   COLOR="0xff6ed6e6"
fi

sketchybar -m --set amphetamine \
   icon.color=$COLOR \
   icon=""

