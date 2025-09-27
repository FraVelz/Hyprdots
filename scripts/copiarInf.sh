#!/bin/bash

echo ""
echo " [+] Actualizar Git..."
echo ""

# Ruta actual
ruta="$HOME/Documentos/Hyprdots"

# hyprland
cp -r $HOME/.config/hypr $ruta/config/

# waybar
cp $HOME/.config/waybar/config.jsonc $ruta/config/waybar/config.jsonc 
cp $HOME/.config/waybar/style.css $ruta/config/waybar/style.css
cp $HOME/.config/waybar/colors.css $ruta/config/waybar/colors.css

# nvim
cp -r $HOME/.config/nvim $ruta/config/

# Kitty
cp -r $HOME/.config/kitty $ruta/config/

# Zsh
cp $HOME/.zshrc $ruta/

echo ""
echo "¡Listo! Todos los archivos estan en Hyprdots."
echo ""

# Autor: Fravelz
