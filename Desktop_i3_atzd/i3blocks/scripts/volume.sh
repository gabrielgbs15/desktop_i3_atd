#!/usr/bin/env bash

STEP="5%"

get_volume() {
    VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)
    MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
    
    if [ "$MUTE" = "yes" ]; then
        echo "🔇 MUTE"
    else
        echo "🔊 $VOLUME"
    fi
}

case "$BLOCK_BUTTON" in
    1) pavucontrol & ;;  # Botão esquerdo - abre pavucontrol
    3) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;  # Botão direito - mute/unmute
    4) pactl set-sink-volume @DEFAULT_SINK@ +$STEP ;;  # Scroll para cima - aumenta volume
    5) pactl set-sink-volume @DEFAULT_SINK@ -$STEP ;;  # Scroll para baixo - diminui volume
esac

get_volume
