#!/bin/sh

grim -c -o "$(hyprctl activeworkspace -j | jq -r '.monitor')" | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot of whole screen taken" -t 1000 

