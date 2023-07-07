#!/bin/bash

# Se o numero de argumentos for diferente de 1
if [ $# -ne 1 ]; then 
    echo "Uso: $0 <Diretório>"
    exit 1
fi

# Verifica se o diretorio existe
if [ ! -d $1 ]; then 
    echo "Diretório $1 não existe"
    exit 1
fi

# Imprime para cada arquivo no diretorio
i=1
for arq in $(ls $1); do 
  echo $i: $arq
  i=$((i+1))
done
