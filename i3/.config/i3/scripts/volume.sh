#!/usr/bin/bash

timeoutValue=500

# get the volume value
volume=$(amixer -D default -M get Master | grep -m 1 -Pio '(\d)+%')

## check if the volume is mute
mute=$(amixer -D default -M get Master | grep -m 1 -Pio '\bon|\boff')

if [ $mute = "on" ]
then
    notify-send -t $timeoutValue -h int:value:$volume "Volume"
else
    notify-send -t $timeoutValue "Volume Mute"
fi
