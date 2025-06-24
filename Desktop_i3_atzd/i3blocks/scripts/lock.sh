#!/bin/bash

# Define teclado US Internacional
setxkbmap us -variant intl

# Pausa notificações
dunstctl set-paused true

# Inicia o i3lock em background
i3lock -i ~/.local/share/wallpapers/wallpaper_arch_blur_1920x1080.png -u -n &

# Espera o i3lock realmente iniciar (checa se o processo está rodando)
sleep 0.5
while ! pgrep -x i3lock > /dev/null; do
    sleep 0.1
done

# Aguarda um pouco para garantir que a tela está bloqueada
sleep 0.5

# Desliga o monitor
xset dpms force off

# Espera o i3lock terminar (usuário desbloqueou)
wait

# Retoma notificações
dunstctl set-paused false

# Restaura layout de teclado (ou mantenha US Intl se preferir)
setxkbmap us -variant intl
