#!/bin/bash
LID_STATE="$1"

EXTERNAL_CONNECTED=$(hyprctl monitors | grep -v "eDP-1" | grep -c "Monitor")

if [ "$LID_STATE" == "off" ]; then
    if [ "$EXTERNAL_CONNECTED" -gt 0 ]; then
        current_ws=$(hyprctl monitors -j | jq -r '.[] | select(.name=="eDP-1") | .activeWorkspace.id')
        hyprctl keyword monitor "eDP-1, disable"
        if [ -n "$current_ws" ] && [ "$current_ws" != "null" ]; then
            base_ws=$((current_ws % 10))
            if [ "$base_ws" -eq 0 ]; then base_ws=10; fi
            hyprctl dispatch workspace "$base_ws"
        fi
    fi
elif [ "$LID_STATE" == "on" ]; then
    # Re-enable the monitor AND force the physical backlight on
    hyprctl keyword monitor "eDP-1, 1920x1080, 0x0, 1"
    hyprctl dispatch dpms on
    
    if [ "$EXTERNAL_CONNECTED" -gt 0 ]; then
        (
            sleep 1
            current_ws=$(hyprctl monitors -j | jq -r '.[] | select(.name=="eDP-1") | .activeWorkspace.id')
            
            if [ -n "$current_ws" ] && [ "$current_ws" != "null" ]; then
                base_ws=$((current_ws % 10))
                if [ "$base_ws" -eq 0 ]; then base_ws=10; fi
                ~/.config/hypr/scripts/multi-monitor-workspaces.sh "$base_ws"
            fi
        ) &
    fi
fi
