#!/bin/bash

# Se o numero de argumentos for diferente de 1
if [ $# -ne 1 ]; then 
    echo "Uso: $0 <Arquivo>"
    exit 1
fi

# Se o arquivo $1 nao existir
if [ ! -f $1 ]; then 
    echo "Arquivo $1 não existe"
    exit 1
fi

echo "Arquivo $1 existe"
