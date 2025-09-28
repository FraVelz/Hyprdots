#!/bin/bash

echo ""
echo " [+] Actualizando archivos de Hyprdots..."
echo ""

# Ruta actual
ruta="$HOME/Documentos/Hyprdots"

# hyprland
cp -r -u $HOME/.config/hypr $ruta/config/

# waybar
cp -u $HOME/.config/waybar/config.jsonc $ruta/config/waybar/config.jsonc 
cp -u $HOME/.config/waybar/style.css $ruta/config/waybar/style.css
cp -u $HOME/.config/waybar/colors.css $ruta/config/waybar/colors.css

# nvim
cp -ru $HOME/.config/nvim/* $ruta/config/nvim/

# Kitty
cp -ru $HOME/.config/kitty/* $ruta/config/kitty/

# Zsh
cp -u $HOME/.zshrc $ruta/home/

echo ""
echo "¡Listo! Todos los archivos estan en Hyprdots."
echo ""

# Autor: Fravelz
