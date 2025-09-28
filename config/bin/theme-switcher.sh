#!/bin/bash

THEMES_DIR="$HOME/.config/themes"
#HYPR_THEME="$HOME/.config/hypr/hyprland.conf"
HYPR_STYLE="$HOME/.config/hypr/colors.conf"
#WOFI_STYLE="$HOME/.config/wofi/style.css"
WAYBAR_STYLE="$HOME/.config/waybar/style.css"
HYPARPAPER_CONF="$HOME/.config/hypr/hyprpaper.conf"

# Mostrar lista de temas disponibles con wofi
THEME=$(ls "$THEMES_DIR" | rofi -dmenu -theme ~/.config/bin/themeswitcher.rasi)

# Si el usuario cancela
[ -z "$THEME" ] && exit 0

T_PATH="$THEMES_DIR/$THEME"

# Aplicar configuración de Hyprland
#cp "$T_PATH/hyprland.conf" "$HYPR_THEME"

# Aplicar colores a hyprland
cp "$T_PATH/style-hypr.conf" "$HYPR_STYLE"

# Aplicar colores a wofi
#cp "$T_PATH/style-wofi.css" "$WOFI_STYLE"

# Aplicar colores a waybar
cp "$T_PATH/style-waybar.css" "$WAYBAR_STYLE"

# Cambiar wallpaper (editar hyprpaper.conf y recargar)
WALL="$T_PATH/wallpaper.jpg"
cat > "$HYPARPAPER_CONF" <<EOF
preload = $WALL
wallpaper = ,$WALL
EOF

# Recargar Hyprland y Hyprpaper, y waybar
killall waybar && waybar &
hyprctl reload
killall hyprpaper
hyprpaper & disown

notify-send "Tema cambiado a $THEME"

