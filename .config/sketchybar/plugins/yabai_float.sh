# Show an icon for the float status of the selected window

case "$(yabai -m query --windows --window | jq '."is-floating"')" in
   false)
      case "$(yabai -m query --windows --window | jq '."has-fullscreen-zoom"')" in
         false)
            sketchybar -m --set yabai_float icon=""
            ;;
         true)
            sketchybar -m --set yabai_float icon=""
            ;;
      esac
      ;;
   true)
      sketchybar -m --set yabai_float icon=""
      ;;
esac

