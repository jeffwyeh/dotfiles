#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

STATUS_LABEL=$(lsappinfo info -only StatusLabel "Slack")
ICON="󰒱"
if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
    LABEL="${BASH_REMATCH[1]}"

    if [[ $LABEL == "" ]]; then
        ICON_COLOR=$GRAY
    elif [[ $LABEL == "•" ]]; then
        ICON_COLOR=$BLUE
    elif [[ $LABEL =~ ^[0-9]+$ ]]; then
        ICON_COLOR=$RED
    else
        exit 0
    fi
else
  exit 0
fi

sketchybar --set $NAME icon=$ICON label="${LABEL}" icon.color=${ICON_COLOR} label.color=${ICON_COLOR}
