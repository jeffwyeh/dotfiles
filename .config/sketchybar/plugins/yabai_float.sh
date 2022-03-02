# Show an icon for the float status of the selected window

case "$(yabai -m query --windows --window | jq '."is-floating"')" in
    false)
      sketchybar -m --set yabai_float icon=""
      ;;
    true)
      sketchybar -m --set yabai_float icon=""
      ;;
esac

