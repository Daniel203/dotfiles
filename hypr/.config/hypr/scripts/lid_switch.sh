#!/usr/bin/env bash
set -u

LID_STATE="${1:-}"
LAPTOP_MONITOR="eDP-1"

# An external monitor must already be enabled before disabling the laptop panel.
external_connected=$(hyprctl monitors -j | jq --arg laptop "$LAPTOP_MONITOR" 'any(.[]; .name != $laptop)') || exit 1

case "$LID_STATE" in
    off)
        if [[ "$external_connected" == "true" ]]; then
            current_ws=$(hyprctl monitors -j | jq -r --arg laptop "$LAPTOP_MONITOR" '.[] | select(.name == $laptop) | .activeWorkspace.id') || exit 1
            hyprctl eval "hl.monitor({ output = \"$LAPTOP_MONITOR\", disabled = true })" || exit 1

            if [[ "$current_ws" =~ ^[1-9][0-9]*$ ]]; then
                base_ws=$(( (current_ws - 1) % 10 + 1 ))
                hyprctl dispatch "hl.dsp.focus({ workspace = \"$base_ws\" })"
            fi
        fi
        ;;
    on)
        # Preserve the previously used display mode until we migrate to a
        # DMS-aware monitor restore operation in a separate change.
        hyprctl eval "hl.monitor({ output = \"$LAPTOP_MONITOR\", disabled = false, mode = \"1920x1080\", position = \"0x0\", scale = 1 })" || exit 1
        hyprctl dispatch 'hl.dsp.dpms({ action = "on" })'
        ;;
    *)
        printf 'Usage: %s on|off\n' "$0" >&2
        exit 2
        ;;
esac
