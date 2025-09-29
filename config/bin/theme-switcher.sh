#!/bin/bash

# Mostrar Menu Rofi **************************************************

THEMES_DIR="$HOME/.config/themes" # Directorio de temas

# Mostrar lista de temas disponibles con wofi
THEME=$(ls $THEMES_DIR | rofi -dmenu -p "> " -theme ~/.config/bin/themeswitcher.rasi)

# Si el usuario cancela
[ -z "$THEME" ] && exit 0

# Configuraciones de Actualizacion de Temas **************************

T_PATH="$THEMES_DIR/$THEME" # Directorio del tema elegido

# Aplicar configuración de Hyprland
#cp "$T_PATH/hyprland.conf" "$HYPR_THEME"

# Aplicar colores a hyprland
cp $T_PATH/style-hypr.conf $HOME/.config/hypr/colors.conf
##HYPR_THEME="$HOME/.config/hypr/hyprland.conf"

# Aplicar colores a wofi
#WOFI_STYLE="$HOME/.config/wofi/style.css"
#cp "$T_PATH/style-wofi.css" "$WOFI_STYLE"

# Aplicar colores y estilo a waybar
cp $T_PATH/style-waybar.css $HOME/.config/waybar/style.css
cp $T_PATH/colors.css $HOME/.config/waybar/colors.css

# Cambiar wallpaper (editar hyprpaper.conf y recargar)
WALL="$T_PATH/wallpaper.jpg"

cat > $HOME/.config/hypr/hyprpaper.conf <<EOF
preload = $WALL
wallpaper = ,$WALL
EOF

# Pasos Finales ******************************************************

# Recargar Hyprland y Hyprpaper, y waybar
killall waybar && waybar &
hyprctl reload
killall hyprpaper
hyprpaper & disown

notify-send "Tema cambiado a $THEME"

# Autor: Fravelz
