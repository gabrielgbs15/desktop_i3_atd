#!/bin/bash

# Ícones unicode (use Nerd Font ou Font Awesome para ver os ícones)
ICON_ON=""
ICON_OFF=""

# Verifica se o bluetooth está ativo
if bluetoothctl show | grep -q "Powered: yes"; then
    status=""
    icon="$ICON_ON"
    color="#00BFFF" # azul
else
    status="Inativo"
    icon="$ICON_OFF"
    color="#888888" # cinza
fi

# Clique esquerdo abre o Blueman Manager
if [ "$BLOCK_BUTTON" = "1" ]; then
    blueman-manager &
fi

# Saída para o i3blocks
echo "$icon$status"
echo
echo "$color"