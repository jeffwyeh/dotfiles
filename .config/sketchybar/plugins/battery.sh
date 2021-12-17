#!/bin/bash

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
BATT_INFO=$(system_profiler SPPowerDataType -json)
CHARGED=$(echo $BATT_INFO | jq '.SPPowerDataType[].sppower_battery_charge_info.sppower_battery_fully_charged // empty')
CHARGING=$(echo $BATT_INFO | jq '.SPPowerDataType[].sppower_battery_is_charging // empty')
CONNECTED=$(echo $BATT_INFO | jq '.SPPowerDataType[].sppower_battery_charger_connected // empty')

if [[ $CONNECTED == "\"TRUE\"" ]]; then
    ICON=""
else
    ICON=""
fi

if [[ $CHARGING == "\"TRUE\"" ]]; then
    COLOR=0xff72e0c5
elif [[ $CONNECTED == "\"TRUE\"" ]]; then
    COLOR=0xffffc663
else
    COLOR=0xffff6e70
fi

sketchybar -m --set battery \
  background.color=$COLOR \
  icon=$ICON \
  label=$(printf "${BATT_PERCENT}%%")

