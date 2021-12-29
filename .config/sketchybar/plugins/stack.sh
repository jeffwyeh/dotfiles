#!/bin/bash

# Exit if Not in Stack
CURRENT=$(yabai -m query --windows --window | jq '.["stack-index"]')
LAST=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
if [[ $LAST -eq 0 ]]; then
   sketchybar -m --set stack label="" \
                 --set stack label.font="Hack Nerd Font:Regular:12.0"
else
   # Use Numbers in place of Dots if the Stack is greater than 3
   # Use a larger font for the unicode dots
   if [[ $LAST -gt 3 ]]; then
     sketchybar -m --set stack label=$(printf "[%s/%s]" "$CURRENT" "$LAST") \
                   --set stack label.font="Hack Nerd Font:Regular:12.0" \
                   --set stack drawing=on
   else
      # Create Stack Indicator
      declare -a dots=()
      for i in $(seq 0 $(expr $LAST - 1))
      do  
        [[ $( expr $CURRENT - 1) -eq $i ]] && dots+="● " || dots+="○ "
      done

      # Display Indicator
      sketchybar -m --set stack label="$(echo $dots)" \
                    --set stack label.font="Hack Nerd Font:Regular:12.0" \
                    --set stack drawing=on
   fi
fi

