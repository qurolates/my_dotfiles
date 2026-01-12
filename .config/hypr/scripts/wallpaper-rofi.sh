#!/bin/bash
WALLPAPERS_DIR="$HOME/Изображения/Wallpapers/"
SELECTED=$(find "$WALLPAPERS_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | rofi -dmenu -p "Select wallpaper")
if [[ -n "$SELECTED" ]]; then
  hyprctl hyprpaper preload "$SELECTED"
  hyprctl hyprpaper wallpaper "eDP-1,$SELECTED"
fi

