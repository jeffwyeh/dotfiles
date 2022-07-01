# Show a list of spaces on the monitor
# The current space will be highlighted, and a marker will indicate
# the presence of windows in that space.

# Source sketchybar vars
source ~/.config/sketchybar/sketchybar_vars.sh

STATIC_NAMES=("I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" "XI" "XII" "XIII" "XIV" "XV") #0 to 15

for index in {0..14}
do
  sketchybar --add space space.$index left                                 \
             --set space.$index associated_space=$(($index+1))             \
                            icon=${STATIC_NAMES[index]}                    \
                            icon.font="$HELVETICA"                         \
                            icon.highlight_color=$BLUE                     \
                            icon.padding_left=8                            \
                            icon.padding_right=8                           \
                            background.padding_left=0                      \
                            background.padding_right=0                     \
                            label.drawing=off                              \
                            background.color=$GRAY_DARK                    \
                            background.height=24                           \
                            script="~/.config/sketchybar/plugins/space.sh" \
                            click_script="yabai -m space --focus $(($index+1))"
done
