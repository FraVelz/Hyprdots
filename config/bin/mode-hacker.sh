#!/usr/bin/env bash

# Ejecutar con Hyprland ya iniciado.
sleep 1.5

# 1) Abro (primera ventana)
hyprctl dispatch -- exec kitty --title a &
sleep 0.25

# 2) Ahora quiero abrir 'a' dividiendo el conjunto (a,b) -> split a la derecha
hyprctl dispatch layoutmsg preselect r
hyprctl dispatch -- exec kitty --override font_size=12 --title c -- tty-clock -c -C 4
sleep 0.30

# 3) Finalmente abro 'b' (si quieres otra colocación, cambia preselect antes)
hyprctl dispatch -- exec kitty --title d -- cava &

