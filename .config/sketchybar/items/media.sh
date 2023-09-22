#!/bin/bash

media=(
  script="$HOME/.config/sketchybar/plugins/media.sh"
  label.padding_right=6
  updates=on
)

sketchybar --add item media right \
           --set media "${media[@]}" \
           --subscribe media media_change

