#!/bin/bash

# Get current volume level and mute status
volume_info=$(amixer -D pulse sget Master | grep -oP '\d+%' | sed '1!d')
mute_status=$(amixer -D pulse sget Master | grep -oP '\[(on|off)\]' | sed '1!d')

# Determine mute/unmute status and set volume accordingly
if [[ $mute_status == "[on]" ]]; then
    current_volume=$(echo "$volume_info" | sed 's/%//')
else
    current_volume=0
fi

# Generate a filled bar representing volume level
filled_bar=""
for (( i=0; i<current_volume; i+=5 )); do
    filled_bar="${filled_bar}█"
done

# Generate an empty bar for remaining space
empty_bar=""
for (( i=current_volume; i<100; i+=5 )); do
    empty_bar="${empty_bar}░"
done

# Combine filled and empty bars
combined_bar="${filled_bar}${empty_bar}"

# Determine whether to display volume percentage or mute status icon
if [[ $current_volume -eq 0 ]]; then
    status_icon="" # Mute icon
    status_text=""
else
    status_icon=""
    status_text="${current_volume}%"
fi

# Send notification with volume level, mute status, and progress bar
notify-send --replace-id=1 "Volume Level:   ${status_text} ${status_icon}" "\n[${combined_bar}]" -t 2000

