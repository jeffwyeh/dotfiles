# Show a list of spaces on the monitor
# The current space will be highlighted, and a marker will indicate
# the presence of windows in that space.

# Source sketchybar vars
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/fonts.sh"

STATIC_NAMES=("I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" "XI" "XII" "XIII" "XIV" "XV") #0 to 15

for index in {0..14}; do
  space=(
    associated_space=$(($index+1))
    icon=${STATIC_NAMES[index]}
    icon.font="$HELVETICA"
    icon.highlight_color=$BLUE
    icon.padding_left=8
    icon.padding_right=8
    background.padding_left=0
    background.padding_right=0
    label.drawing=off
    background.color=$GRAY_DARK
    background.height=24
    script="$HOME/.config/sketchybar/plugins/space.sh"
    click_script="yabai space --focus $(($index+1))"
  )
  sketchybar --add space space.$index left \
             --set space.$index "${space[@]}"
done
