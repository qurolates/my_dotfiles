#!/bin/bash
WALLPAPERS_DIR="$HOME/Pictures/Wallpapers"
RANDOM_PIC=$(find "$WALLPAPERS_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)
hyprctl hyprpaper preload "$RANDOM_PIC"
hyprctl hyprpaper wallpaper "eDP-1,$RANDOM_PIC"