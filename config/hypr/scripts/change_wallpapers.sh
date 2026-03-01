#!/bin/bash

CONFIG="$HOME/.config/hypr/hyprpaper.conf"
WALLPAPER_DIR="$HOME/Documents/Wallpapers"

# Listar solo nombres ordenados
mapfile -t wallpapers < <(ls -1 "$WALLPAPER_DIR" | sort)

choose_wallpaper() {
    local monitor="$1"
    select choice in "${wallpapers[@]}"; do
        if [[ -n "$choice" ]]; then
            echo "$choice"
            return 0
        else
            echo "Opción inválida, intenta de nuevo."
        fi
    done
}

# Elegir nombres
wp1=$(choose_wallpaper "eDP-1")
wp2=$(choose_wallpaper "HDMI-A-1")

echo "DEBUG -> wp1=$wp1"
echo "DEBUG -> wp2=$wp2"

sed -i "/monitor = eDP-1/,/}/ s|\(path = .*/\)[^/]*|\1$wp1|" "$CONFIG"
sed -i "/monitor = HDMI-A-1/,/}/ s|\(path = .*/\)[^/]*|\1$wp2|" "$CONFIG"

