#!/bin/bash

if [ "$1" = "enable" ]; then
    hyprctl keyword monitor "eDP-1, 1920x1080, 0x0, 1"
    hyprctl reload
else
    # If any monitor connected
    if [ `hyprctl monitors all | grep --count "Monitor"` > 1 ]; then  
        hyprctl keyword monitor "eDP-1, disable"
    else
        pidof hyprlock || (hyprlock & sleep 1s && systemctl suspend)
    fi

    hyprctl reload
fi    

# if grep open /proc/acpi/button/lid/LID0/state; then  # Lid open
#     hyprctl keyword monitor "eDP-1, 1920x1080, 0x0, 1"
#     hyprctl reload
# else  # Lid close
#     # If any monitor connected
#     if [[ `hyprctl monitors all | grep --count "Monitor"` > 1 ]]; then  
#         hyprctl keyword monitor "eDP-1, disable"
#     else
#         pidof hyprlock || (hyprlock & sleep 1s && systemctl suspend)
#     fi
#
#     hyprctl reload
# fi


# TODO: need to fix the resolution 
