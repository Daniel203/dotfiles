#!/bin/bash
LID_STATE="$1"

# Count connected (non-eDP-1) monitors
EXTERNAL_CONNECTED=$(hyprctl monitors | grep -v "eDP-1" | grep -c "Monitor")

if [ "$LID_STATE" == "off" ]; then
    if [ "$EXTERNAL_CONNECTED" -gt 0 ]; then
        hyprctl keyword monitor "eDP-1, disable"
    fi
elif [ "$LID_STATE" == "on" ]; then
    hyprctl keyword monitor "eDP-1, 1920x1080, 0x0, 1"
fi

