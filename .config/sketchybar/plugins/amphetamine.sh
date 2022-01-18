# Icon for amphetamine status

BLUE="0xff6ed6e6"
RED="0xffff8c8c"

if [[ $(pmset -g assertions | grep "Amphetamine") ]]; then
   COLOR=$RED
else
   COLOR=$BLUE
fi

sketchybar -m --set amphetamine \
   icon.color=$COLOR \
   icon=""
