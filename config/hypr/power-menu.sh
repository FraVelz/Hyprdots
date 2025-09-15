#!/bin/bash

choice=$(echo -e "🔌 Apagar\n🔁 Reiniciar\n💤 Suspender\n🚪 Cerrar sesión\n❌ Cancelar" | \
wofi --dmenu --prompt "Acción:")

case "$choice" in
    "🔌 Apagar") systemctl poweroff ;;
    "🔁 Reiniciar") systemctl reboot ;;
    "💤 Suspender") systemctl suspend ;;
    "🚪 Cerrar sesión") hyprctl dispatch exit ;;
    *) exit 0 ;;
esac

