# Show an icon for the float status of the selected window

case "$(yabai -m query --windows --window | jq '."has-fullscreen-zoom"')" in
    false)
      sketchybar -m --set yabai_fullscreen icon="T"
      #sketchybar -m --set yabai_fullscreen icon=""
      ;;
    true)
      sketchybar -m --set yabai_fullscreen icon="M"
      #sketchybar -m --set yabai_fullscreen icon=""
      ;;
esac
