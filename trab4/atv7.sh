#!/bin/bash

read -p "Entre com um mês(1-12): " mes
# Se o mes for menor que 1 ou maior que 12
if [[ ! $mes =~ ^[0-9]+$ ]] || [ $mes -lt 1 ] || [ $mes -gt 12 ]; then 
    echo "Mês inválido"
    exit 1
fi

read -p "Entre com um ano: " ano
# Se o ano for menor que 1
if [[ ! $ano =~ ^[0-9]+$ ]] || [ $ano -lt 1 ]; then 
    echo "Ano inválido"
    exit 1
fi

# Mostra o calendario com mes e ano especificados
cal $mes $ano 
