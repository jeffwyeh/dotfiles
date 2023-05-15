#!/bin/bash

# Grep for VPN Status

ICON_DRAWING="off"

if [[ $(/opt/cisco/anyconnect/bin/vpn state | grep "state: Connected") ]]; then
   ICON_DRAWING="on"
fi

sketchybar --set vpn icon.drawing=$ICON_DRAWING
