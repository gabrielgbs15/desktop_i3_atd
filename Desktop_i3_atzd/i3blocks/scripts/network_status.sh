#!/bin/bash

# Verifica conexão ativa
conexao=$(nmcli -t -f TYPE,DEVICE,STATE dev | grep ":connected" | head -n 1)

if [[ -z "$conexao" ]]; then
    echo "睊 Desconectado"
else
    tipo=$(echo $conexao | cut -d: -f1)
    dispositivo=$(echo $conexao | cut -d: -f2)

    if [ "$tipo" = "wifi" ]; then
        ssid=$(nmcli -t -f active,ssid dev wifi | grep "^yes" | cut -d: -f2)
        echo " $ssid"
    elif [ "$tipo" = "ethernet" ]; then
        echo " "
    else
        echo "$tipo: $dispositivo"
    fi
fi

# Clique com botão esquerdo abre o gerenciador de conexões
case $BLOCK_BUTTON in
    1) nm-connection-editor & ;;
esac

