#!/usr/bin/bash

timeoutValue=500

# max value displayed in the file
maxBrightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)

# current brightness displayed in the file
currentBrightness=$(cat /sys/class/backlight/intel_backlight/actual_brightness)

# need to convert the brighness to a value from 0 to 100 
# sometimes the maxBrightness is more then 100
realBrightness=$(($currentBrightness * 100 / $maxBrightness))


notify-send -t $timeoutValue -h int:value:$realBrightness "Brightness"


