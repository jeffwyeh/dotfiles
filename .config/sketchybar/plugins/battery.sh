# Battery status
# This shows a rounded rectangle with the following information:
# * AC adapter status
# * Battery percent
# * Charging status - background colors:
#   * red = draining
#   * green = charging
#   * yellow = connected, but not charging due to battery saver)

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
BATT_INFO=$(system_profiler SPPowerDataType -json)
CHARGED=$(echo $BATT_INFO | jq '.SPPowerDataType[].sppower_battery_charge_info.sppower_battery_fully_charged // empty')
CHARGING=$(echo $BATT_INFO | jq '.SPPowerDataType[].sppower_battery_is_charging // empty')
CONNECTED=$(echo $BATT_INFO | jq '.SPPowerDataType[].sppower_battery_charger_connected // empty')
PERCENT=$(echo $BATT_INFO | jq '.SPPowerDataType[].sppower_battery_charge_info.sppower_battery_state_of_charge // empty')
GREEN="0xffffc663"
YELLOW="0xff72e0c5"
RED="0xffff6e70"

if [[ $CONNECTED == "\"TRUE\"" ]]; then
    ICON=""
elif [[ $PERCENT -ge 90 ]]; then
    ICON=""
elif [[ $PERCENT -ge 65 ]]; then
    ICON=""
elif [[ $PERCENT -ge 35 ]]; then
    ICON=""
elif [[ $PERCENT -ge 10 ]]; then
    ICON=""
else
    ICON=""
fi

if [[ $CHARGING == "\"TRUE\"" ]]; then
    COLOR=$GREEN
elif [[ $CONNECTED == "\"TRUE\"" ]]; then
    COLOR=$YELLOW
else
    COLOR=$RED
fi

sketchybar -m --set battery \
  background.color=$COLOR \
  icon=$ICON \
  label=$(printf "${BATT_PERCENT}%%")
