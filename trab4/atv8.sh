#!/bin/bash

dir=mpeg

# Se o diretorio nao existir
if [ ! -d $dir ]; then 
    echo "Diretório $dir não existe"
    exit 1
fi

# Verifica se tem permissao de escrita no diretorio
if [ ! -w mpeg ]; then 
    echo "Diretório mpeg não tem permissão de escrita"
    exit 1
fi

# Para cada arquivo no diretorio
for arq in $(ls mpeg/*.mpeg); do 
  # Renomeia para .mp3
  mv $arq ${arq%.mpeg}.mp3
done
