#!/bin/bash

# Query Hyprland for all currently open windows in JSON format
# Filter for windows that are on workspaces > 10
hyprctl clients -j | jq -c '.[] | select(.workspace.id > 10)' | while read -r client; do
    
    # Extract the unique window address and its current high-number workspace
    windowAddress=$(echo "$client" | jq -r '.address')
    currentWs=$(echo "$client" | jq -r '.workspace.id')
    
    # Calculate where it belongs (e.g., 12 % 10 = 2. 21 % 10 = 1).
    targetWs=$((currentWs % 10))
    
    # If the math results in 0 (like workspace 20 or 30), it belongs on workspace 10
    if [ "$targetWs" -eq 0 ]; then 
        targetWs=10
    fi
    
    # Silently move the window back down to the laptop's primary workspace group
    hyprctl dispatch movetoworkspacesilent "$targetWs,address:$windowAddress" > /dev/null
done
