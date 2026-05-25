#!/usr/bin/env bash

while true; do
  socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
    case $line in
      monitorremoved\>\>*)
        ( ~/.config/hypr/scripts/rescue-windows.sh ) &
        ;;
      monitoradded\>\>*)
        ( sleep 2 && ~/.config/hypr/scripts/rescue-windows.sh ) &
        ;;
    esac
  done
  sleep 2
done
