#!/bin/bash

# Procura todos os arquivos do usuario www-data e salva em "arq.txt"
find / -user www-data -type f > arq.txt
# Procura todos os diretorios
find / -user www-data -type d > dir.txt

# Concantena os arquivos "arq.txt" e "dir.txt" e salva em "lista.txt"
cat arq.txt dir.txt > lista.txt
