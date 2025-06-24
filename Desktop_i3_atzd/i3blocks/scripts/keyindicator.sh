#!/bin/sh

symbol="󰪛"  # Troque por outro símbolo se quiser

# Checa o estado do Caps Lock
if xset q | grep 'Caps Lock:' | grep -q 'on'; then
    echo "$symbol"
fi