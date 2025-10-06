#!/bin/bash

choice=$(echo -e "\n󰦛\n󰽥\n󰍂\n" \
    | rofi -dmenu -no-input -theme ~/.config/bin/styles/powermenu.rasi -disable-history)

case "$choice" in
    "") systemctl poweroff ;;
    "󰦛") systemctl reboot ;;
    "󰽥") systemctl suspend ;;
    "󰍂") systemctl exit ;;
    "") hyprctl dispatch exit ;;
    *) exit 0 ;;
esac

# Autor: Fravelz
