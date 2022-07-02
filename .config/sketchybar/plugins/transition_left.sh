if [ -z "$3" ];
then
   NAME=$(echo item$RANDOM)
else
   NAME=$3
fi

sketchybar -m --add item $NAME right                              \
              --set $NAME icon.font="$FONT_AWESOME_L"             \
                                      icon.padding_left=2         \
                                      icon.padding_right=-6       \
                                      icon=""                    \
                                      icon.color=$1               \
                                      background.padding_left=0   \
                                      background.color=$2
