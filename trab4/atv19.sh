#!/bin/bash

# Se nao entrou com argumentos
if [ $# -eq 0 ]; then
    echo "Uso: $0 <Ideia>"
    exit 1
fi

# Adiciona a data no texto a ser adicionado
texto="$(date +"%d/%m/%Y %H:%M") $@"

# Adiciona a ideia no arquivo
echo $texto >> ideias.txt
