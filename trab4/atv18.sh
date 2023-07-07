#!/bin/bash

# Repete 5 vezes
for i in $(seq 1 5); do
  # Cria as pastas dentro de "pasta18"
  mkdir -p pasta18/dir$i
  # Cria os arquivos dentro de "pasta18/dir$i"
  for j in $(seq 1 5); do
    touch pasta18/dir$i/file$j
  done
done
