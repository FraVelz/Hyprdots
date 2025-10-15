#!/bin/bash

EMOJI=$(cat <<EOF
😀  feliz
😂  risa
❤️  corazon
🔥  fuego
✨  estrella
😎  Fachero
👍  ok
EOF
)

chosen=$(echo "$EMOJI" | rofi -dmenu -i -p "Emoji" | awk '{print $1}')

if [ -n "$chosen" ]; then
    echo -n "$chosen" | wl-copy
    wtype "$chosen"
fi

# Autor: Fravelz
