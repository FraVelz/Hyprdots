#!/bin/bash

sleep 1.5 # espera a que Hyprland esté listo
hyprctl dispatch workspace 1 && firefox &

sleep 3
hyprctl dispatch workspace 2 && code &

sleep 4.5
hyprctl dispatch workspace 3 && kitty &

# Autor: Fravelz

