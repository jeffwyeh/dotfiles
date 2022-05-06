# Show the order of a window in the stack (if applicable)
# The order will be shown as empty/filled dots, unless there are more
# than three windows in the stack. If there are more than three windows,
# then the stack order will be shown as "[X/Y]"

# Exit if Not in Stack

# Source the fonts
source ~/.config/sketchybar/sketchybar_vars.sh

CURRENT=$(yabai -m query --windows --window | jq '.["stack-index"]')
LAST=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
if [[ $LAST -eq 0 ]]; then
   sketchybar -m --set stack label=""
else
   # Use Numbers in place of Dots if the Stack is greater than 3
   # Use a larger font for the unicode dots
   if [[ $LAST -gt 3 ]]; then
     sketchybar -m --set stack label=$(printf "[%s/%s]" "$CURRENT" "$LAST") \
                   --set stack label.font="$HELVETICA" \
                   --set stack drawing=on
   else
      # Create Stack Indicator
      declare -a dots=()
      for i in $(seq 0 $(expr $LAST - 1))
      do  
        [[ $( expr $CURRENT - 1) -eq $i ]] && dots+=" " || dots+=" "
      done

      # Display Indicator
      sketchybar -m --set stack label="$(echo $dots)" \
                    --set stack label.font="$FONT_AWESOME_REG" \
                    --set stack drawing=on
   fi
fi

