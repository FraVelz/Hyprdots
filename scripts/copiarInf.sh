#!/bin/bash

echo ""
echo " [+] Actualizando archivos de Hyprdots..."
echo ""

# ruta actual
ruta="$HOME/Documentos/Hyprdots"

# hyprland
cp -ru $HOME/.config/hypr/* $ruta/config/hypr/

# temas
cp -ru $HOME/.config/themes/* $ruta/config/themes/

# bin
cp -ru $HOME/.config/bin/* $ruta/config/bin/

# waybar
cp -u $HOME/.config/waybar/config.jsonc $ruta/config/waybar/config.jsonc 
cp -u $HOME/.config/waybar/style.css $ruta/config/waybar/style.css
cp -u $HOME/.config/waybar/colors.css $ruta/config/waybar/colors.css

# nvim
cp -ru $HOME/.config/nvim/* $ruta/config/nvim/

# kitty
cp -ru $HOME/.config/kitty/* $ruta/config/kitty/

# zsh
cp -u $HOME/.zshrc $ruta/home/

echo ""
echo "¡Listo! Todos los archivos estan en Hyprdots."
echo ""

# Autor: Fravelz
