#!/bin/bash
STATE="$(echo "$INFO" | jq -r '.state')"

if [ "$STATE" = "playing" ]; then
  TITLE=$(echo "$INFO" | jq -r '.title')
  if [[ ${#TITLE} -gt 20 ]]; then
     TITLE=$(echo $TITLE | cut -c 1-20)...
  fi
  ARTIST=$(echo "$INFO" | jq -r '.artist')
  if [[ ${#ARTIST} -gt 20 ]]; then
     ARTIST=$(echo $ARTIST | cut -c 1-20)...
  fi
  MEDIA=$TITLE" - "$ARTIST
  #MEDIA="$(echo "$INFO" | jq -r '.app + ": " + .title + " - " + .artist')"
  sketchybar --set $NAME label="$MEDIA" drawing=on
else
  sketchybar --set $NAME drawing=off
fi

