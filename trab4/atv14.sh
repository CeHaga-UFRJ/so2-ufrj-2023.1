#!/bin/bash

# Imprime todos os parametros passados
# i=1
# for param in $@; do
#   echo $i: $param
#   i=$((i+1))
# done

i=1
while [ -n "$1" ]; do
  echo $i: $1
  i=$((i+1))
  shift
done
