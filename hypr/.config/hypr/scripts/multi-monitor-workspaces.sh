#!/bin/bash

baseWorkspace=$1
focusedMonitor=$(hyprctl activeworkspace -j | jq -r '.monitor')

# Fetch all monitor names
all_monitors=$(hyprctl monitors -j | jq -r '.[].name')

# Force eDP-1 (internal) to be first, followed by sorted external monitors
internal_mon="eDP-1"
external_mons=$(echo "$all_monitors" | grep -v "$internal_mon" | sort)

monitors=()
if echo "$all_monitors" | grep -q "$internal_mon"; then
    monitors+=("$internal_mon")
fi
for mon in $external_mons; do
    monitors+=("$mon")
done

index=0
for mon in "${monitors[@]}"; do
    offset=$((index * 10))
    targetWorkspace=$((baseWorkspace + offset))
    
    # Force the workspace to the correct monitor 
    hyprctl dispatch moveworkspacetomonitor "$targetWorkspace" "$mon" > /dev/null
    
    # Switch focus to the monitor and change its workspace
    hyprctl dispatch focusmonitor "$mon" > /dev/null
    hyprctl dispatch workspace "$targetWorkspace" > /dev/null
    
    index=$((index + 1))
done

# Restore focus to the monitor you were originally working on
hyprctl dispatch focusmonitor "$focusedMonitor" > /dev/null
