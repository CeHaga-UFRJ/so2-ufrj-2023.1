#!/bin/bash

# Imprime os arquivos que contem a palavra "bash" a partir da home e abre no less
grep bash ~ -roal | less
# Explicação:
# -r: recursivo
# -o: imprime apenas o trecho que contem a palavra
# -a: trata o arquivo binario como texto
# -l: imprime apenas o nome do arquivo
