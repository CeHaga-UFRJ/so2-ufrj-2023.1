#!/bin/bash

# Verifica se tem 2 argumentos
if [ $# -ne 2 ]; then 
    echo "Uso: $0 <DiretórioOrigem> <DiretórioDestino>"
    exit 1
fi

# Verifica se o diretorio existe
if [ ! -d $1 ]; then 
    echo "Diretório $1 não existe"
    exit 1
fi

if [ ! -d $2 ]; then 
    echo "Diretório $2 não existe"
    exit 1
fi

if [ $1 = $2 ]; then 
    echo "Diretórios iguais, use diretórios diferentes"
    exit 1
fi

# Cria o backup
nome=BKP-$(date +%Y-%m-%d).tar.gz
tar -czf $2/$nome $1
