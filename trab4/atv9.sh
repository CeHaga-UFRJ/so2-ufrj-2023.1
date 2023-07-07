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

# Verifica se tem permissao de escrita no diretorio
if [ ! -w $1 ]; then 
    echo "Diretório $1 não tem permissão de escrita"
    exit 1
fi

# Para cada arquivo no diretorio
for arq in $(ls $1/*.mpeg); do 
  # Renomeia para .mp3
  mv $arq ${arq%.mpeg}.mp3
done
