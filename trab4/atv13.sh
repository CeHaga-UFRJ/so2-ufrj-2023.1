#!/bin/bash

# Se o numero de argumentos for diferente de 1
if [ $# -ne 1 ]; then 
    echo "Uso: $0 <Número>"
    exit 1
fi

# Se o argumento não for um número
if [[ ! $1 =~ ^[0-9]+$ ]]; then 
    echo "O argumento $1 não é um número"
    exit 1
fi

# Faz contagem regressiva indo de $1 até 0
for i in $(seq $1 -1 0); do
  echo $i
  sleep 1
done
