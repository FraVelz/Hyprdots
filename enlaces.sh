#!/bin/bash

echo " [+] Configurando Enlaces simbolicos..."

# Ruta actual
ruta="$HOME/Documentos/Hyprdots"

# waybar
ln -sf $HOME/.config/waybar/config.jsonc $ruta/config/waybar/config.jsonc 
ln -sf $HOME/.config/waybar/style.css $ruta/config/waybar/style.css
ln -sf $HOME/.config/waybar/colors.css $ruta/config/waybar/colors.css

# nvim
ln -sf $HOME/.config/nvim $ruta/config/

# Zsh
#ln -sf ./.zshrc ~/.zshrc

# Neovim
#ln -sf ./config/nvim/ ~/.config/nvim/init.vim

# Kitty
#ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf

# Hyprland
#ln -sf ~/dotfiles/hyprland/hyprland.conf ~/.config/hyprland/hyprland.conf

echo "¡Listo! Todos los archivos apuntan a ~/dotfiles"

# Autor: Fravelz

