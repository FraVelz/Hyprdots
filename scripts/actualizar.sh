#!/bin/bash

echo ""
echo " [+] Actualizando en local..."
echo ""

# ruta actual
ruta="$HOME/Documentos/Hyprdots"

# hyprland
cp -rv $ruta/config/hypr/* $HOME/.config/hypr/
echo -e " [+] Hypland Listo!!! \n"

# Temas
cp -rv $ruta/config/themes/* $HOME/.config/themes/ 
echo -e " [+] Temas Listo!!! \n"

# bin
cp -rv $ruta/config/bin/* $HOME/.config/bin/
echo -e " [+] Bin Listo!!! \n"

# waybar
cp -v $ruta/config/waybar/config.jsonc $HOME/.config/waybar/config.jsonc 
cp -v $ruta/config/waybar/style.css $HOME/.config/waybar/style.css 
cp -v $ruta/config/waybar/colors.css $HOME/.config/waybar/colors.css 
cp -v $ruta/config/waybar/ip.sh $HOME/.config/waybar/ip.sh
cp -v $ruta/config/waybar/target.sh $HOME/.config/waybar/target.sh
cp -v $ruta/config/waybar/vpn-status.sh $HOME/.config/waybar/vpn-status.sh
echo -e " [+] Waybar Listo!!! \n"

# nvim
cp -rv $ruta/config/nvim/* $HOME/.config/nvim/
echo -e " [+] Nvim Listo!!! \n"

# kitty
cp -rv $ruta/config/kitty/* $HOME/.config/kitty/
echo -e " [+] Kitty Listo!!! \n"

# fastfetch
cp -rv $ruta/config/fastfetch/* $HOME/.config/fastfetch/
echo -e " [+] Kitty Listo!!! \n"

# Fondos de pantalla (wallpapers)
cp -v $ruta/config/wallpapers/* $HOME/.config/wallpapers/
echo -e " [+] Wallpapers Listo!!! \n"

# zsh
cp -v $ruta/home/.zshrc $HOME/.zshrc 
echo -e " [+] Zsh Listo!!! \n"

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
