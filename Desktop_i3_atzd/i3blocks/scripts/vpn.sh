#!/bin/sh

# Símbolo do escudo (Nerd Font)
icon=""

# Cores (ajuste se quiser)
color_on="#869dc6"    # Azul
color_off="#2f2f2f"   # Preto

status_line=$(sudo /usr/sbin/ufw status 2>/dev/null | head -n1 | tr -d '\r\n' | tr '[:upper:]' '[:lower:]')

if echo "$status_line" | grep -q "ativo"; then
    echo "$icon"
    echo "$color_on"
else
    echo "$icon"
    echo "$color_off"
fi
