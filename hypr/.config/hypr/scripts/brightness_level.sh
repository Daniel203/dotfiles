#!/bin/bash

# Get current brightness level
current_brightness=$(cat /sys/class/backlight/*/brightness)
max_brightness=$(cat /sys/class/backlight/*/max_brightness)

# Calculate percentage brightness
brightness_percentage=$(( ($current_brightness * 100) / $max_brightness ))

# Generate a filled bar representing brightness level
filled_bar=""
for (( i=0; i<brightness_percentage; i+=5 )); do
    filled_bar="${filled_bar}█"
done

# Generate an empty bar for remaining space
empty_bar=""
for (( i=brightness_percentage; i<100; i+=5 )); do
    empty_bar="${empty_bar}░"
done

# Combine filled and empty bars
combined_bar="${filled_bar}${empty_bar}"

# Send notification with brightness level and progress bar
notify-send --replace-id=1 "Brightness Level:   ${brightness_percentage}%" "\n[${combined_bar}]" -t 2000

