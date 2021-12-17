#!/usr/bin/env bash
# TODO: Remove spaces that do not exist anymore

names=("" "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" "XI" "XII" "XIII" "XIV" "XV") #0 to 14

args=()
QUERY="$(yabai -m query --spaces | jq -r '.[] | [.index, .windows[0], .label, .display, .visible] | @sh')"

NAMES=""
while read -r index window yabai_name display visible
do
  NAME="$(echo "${yabai_name}" | tr -d "'")"
  if [ "${window}" = "null" ]; then
    label="${names[${index}]}"
  else
    label="${names[${index}]}°"
  fi
  if [ "$NAME" = "" ] || [ "$NAME" = " " ]; then 
    NAME="${index}"
  fi
  
  NAMES="$NAMES $NAME"
  args+=(--clone "$NAME" space_template after \
         --set "$NAME" label="${label}" \
                       label.highlight_color="0xff6ed6e6" \
                       associated_display=${display} \
                       label.highlight=${visible} \
                       drawing=on)
done <<< "$QUERY"

args+=(--reorder $NAMES)
sketchybar -m ${args[@]} &> /dev/null 

