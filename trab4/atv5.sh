#!/bin/bash

# Se o numero de argumentos for diferente de 1
if [ $# -ne 1 ]; then 
    echo "Uso: $0 <Arquivo>"
    exit 1
fi

# Se o arquivo $1 nao existir
if ! bash atv4.sh $1 > /dev/null; then 
    echo "Arquivo $1 não existe"
    exit 1
fi

# Salva o tamanho do arquivo $1 na variavel tam
tam=$(stat -c%s $1)

# Se o tamanho do arquivo for maior que 100
if [ $tam -gt 100 ]; then 
    echo "Arquivo $1 tem mais de 100 bytes (tamanho: $tam bytes)"
    exit 0
fi

echo "Arquivo $1 tem menos de 100 bytes (tamanho: $tam bytes)"
