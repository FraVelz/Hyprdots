#!/bin/bash

echo ""
echo " [+] Actualizando archivos de Hyprdots..."
echo ""

# ruta actual
ruta="$HOME/Documentos/Hyprdots" # hyprland
cp -rv $HOME/.config/hypr/* $ruta/config/hypr/

# temas
cp -rv $HOME/.config/themes/* $ruta/config/themes/

# bin
cp -rv $HOME/.config/bin/* $ruta/config/bin/

# waybar
cp -v $HOME/.config/waybar/config.jsonc $ruta/config/waybar/config.jsonc 
cp -v $HOME/.config/waybar/style.css $ruta/config/waybar/style.css
cp -v $HOME/.config/waybar/colors.css $ruta/config/waybar/colors.css

# nvim
cp -rv $HOME/.config/nvim/* $ruta/config/nvim/

# kitty
cp -rv $HOME/.config/kitty/* $ruta/config/kitty/

# zsh
cp -v $HOME/.zshrc $ruta/home/

echo ""
echo "¡Listo! Todos los archivos estan en Hyprdots."
echo ""

# Autor: Fravelz
