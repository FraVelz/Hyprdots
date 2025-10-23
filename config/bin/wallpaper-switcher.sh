#!/bin/bash

# Mostrar Menu Rofi **************************************************

FONDOS_DIR="$HOME/.config/wallpapers/" # Directorio de Fondos de pantalla

# Mostrar lista de fondos de pantalla disponibles con wofi
# THEME=$(ls $THEMES_DIR | rofi -dmenu -p "> " -theme ~/.config/bin/styles/themeswitcher.rasi)
FONDO=$(ls $FONDOS_DIR | rofi -dmenu -p "> ")

# Si el usuario cancela
[ -z "$FONDO" ] && exit 0

# Configuraciones de Actualizacion de fondos *************************

WALL="$FONDOS_DIR/$FONDO" # Directorio del tema elegido

cat > $HOME/.config/hypr/hyprpaper.conf <<EOF
preload = $WALL
wallpaper = ,$WALL
EOF

# Pasos Finales ******************************************************

# Recargar Hyprland y Hyprpaper, y waybar
killall hyprpaper
hyprpaper & disown

notify-send "Wallpaper cambiado a $FONDO"

# Autor: Fravelz
