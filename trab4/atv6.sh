#!/bin/bash

# Calcula o total de processos
total=$(( $(ps aux | wc -l) - 1 )) # -1 para descontar o cabecalho
echo "Existem $total processos rodando"
