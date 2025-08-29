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

full_wp1="$WALLPAPER_DIR/$wp1"
full_wp2="$WALLPAPER_DIR/$wp2"

echo "DEBUG -> wp1=$wp1"
echo "DEBUG -> wp2=$wp2"

# Crear un nuevo archivo temporal con las líneas modificadas
awk -v wp1="$full_wp1" -v wp2="$full_wp2" '
BEGIN {
    preload1="preload = " wp1
    preload2="preload = " wp2
    wall1="wallpaper = eDP-1, " wp1
    wall2="wallpaper = HDMI-A-1, " wp2
    done_pre1=done_pre2=done_wall1=done_wall2=0
}
{
    if (!done_pre1 && NR==1) {print preload1; done_pre1=1; next}
    if (!done_pre2 && NR==2) {print preload2; done_pre2=1; next}
    if ($0 ~ /^wallpaper = eDP-1,/) {print wall1; done_wall1=1; next}
    if ($0 ~ /^wallpaper = HDMI-A-1,/) {print wall2; done_wall2=1; next}
    print
}
END {
    if (!done_pre1) print preload1
    if (!done_pre2) print preload2
    if (!done_wall1) print wall1
    if (!done_wall2) print wall2
}
' "$CONFIG" > "$CONFIG.tmp" && mv "$CONFIG.tmp" "$CONFIG"

echo "Configuración actualizada en $CONFIG"





