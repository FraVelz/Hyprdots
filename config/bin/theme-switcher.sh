#!/bin/bash

# Mostrar Menu Rofi **************************************************

THEMES_DIR="$HOME/.config/themes" # Directorio de temas

# Mostrar lista de temas disponibles con wofi
THEME=$(ls $THEMES_DIR | rofi -dmenu -p "> " -theme ~/.config/bin/styles/themeswitcher.rasi)

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
cp $T_PATH/styles-bin/powermenu.rasi     $HOME/.config/bin/styles/powermenu.rasi
cp $T_PATH/styles-bin/selector-app.rasi  $HOME/.config/bin/styles/selector-app.rasi
cp $T_PATH/styles-bin/themeswitcher.rasi $HOME/.config/bin/styles/themeswitcher.rasi


# Aplicar colores y estilo a waybar
#cp $T_PATH/.css $HOME/.config/waybar/style.css
cp $T_PATH/style-waybar.css $HOME/.config/waybar/style.css
cp $T_PATH/colors.css $HOME/.config/waybar/colors.css
cp $T_PATH/config.jsonc $HOME/.config/waybar/config.jsonc

# Aplicar colores y estilo a Terminal Kitty
cp $T_PATH/kitty.conf $HOME/.config/kitty/kitty.conf

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
