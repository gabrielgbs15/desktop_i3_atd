#!/bin/bash

# Nome do dispositivo da bateria (ajuste se necessário)
BAT="BAT0"

# Pega informações da bateria
if [ ! -d /sys/class/power_supply/$BAT ]; then
    echo "No battery"
    exit 33
fi

capacity=$(cat /sys/class/power_supply/$BAT/capacity)
status=$(cat /sys/class/power_supply/$BAT/status)

# Ícones unicode para bateria
if [ "$capacity" -ge 90 ]; then
    icon=""
elif [ "$capacity" -ge 70 ]; then
    icon=""
elif [ "$capacity" -ge 50 ]; then
    icon=""
elif [ "$capacity" -ge 30 ]; then
    icon=""
else
    icon=""
fi

# Cor padrão (azul)
color="#869dc6"

# Se estiver carregando, cor amarela
if [ "$status" = "Charging" ]; then
    icon=" $icon"
    color="#FFFF00"
# Se estiver abaixo de 30% e não carregando, cor vermelha
elif [ "$capacity" -lt 30 ]; then
    color="#FF0000"
fi

# Mostra ícone, porcentagem e status
echo "$icon $capacity%"
echo
echo "$color"

