#!/bin/bash

echo ""
echo " [+] Actualizando en local..."
echo ""

# ruta actual
ruta="$HOME/Documentos/Hyprdots"

# hyprland
cp -ru $ruta/config/hypr/* $HOME/.config/hypr/ 

# Temas
cp -ru $ruta/config/themes/* $HOME/.config/themes/ 

# bin
cp -u $ruta/config/bin/* $HOME/.config/bin/

# waybar
cp -u $ruta/config/waybar/config.jsonc $HOME/.config/waybar/config.jsonc 
cp -u $ruta/config/waybar/style.css $HOME/.config/waybar/style.css 
cp -u $ruta/config/waybar/colors.css $HOME/.config/waybar/colors.css 

# nvim
cp -ru $ruta/config/nvim/* $HOME/.config/nvim/

# kitty
cp -ru $ruta/config/kitty/* $HOME/.config/kitty/

# zsh
cp -u $ruta/home/.zshrc $HOME/.zshrc 

pkill waybar && waybar &

echo ""
echo "¡Listo! Todos configuraciones estan en local."
echo ""

: '
sudo chown -R fravelz:fravelz ~/.config/nvim

como estamos modificando la carpeta raiz de .config/nvim en este 
apartado no se puede modificar las carpetas y se nesesitan del uso del 
super usuario (root, es decir del comando sudo), entonces para 
arreglar esos problemas cambiamos de propiedad de usuario a nuestro 
usuario personal.
'

# Autor: Fravelz
