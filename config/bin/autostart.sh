#!/bin/bash

sleep 0.8  # espera a que Hyprland esté listo
hyprctl dispatch workspace 1 && firefox &

sleep 0.8
hyprctl dispatch workspace 2 && code &

sleep 0.8
hyprctl dispatch workspace 3 && kitty &

# Autor: Fravelz

