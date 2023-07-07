#!/bin/bash

# Se o numero de argumentos for diferente de 1
if [ $# -ne 1 ]; then 
    echo "Uso: $0 <Arquivo>"
    exit 1
fi

# Verifica se o arquivo existe
if [ ! -f $1 ]; then 
    echo "Arquivo $1 não existe"
    exit 1
fi

# Conta linhas e palavras usando wc
linha=$(wc -l < $1)
palavras=$(wc -w < $1)

echo "O arquivo $1 tem $linha linhas e $palavras palavras."
