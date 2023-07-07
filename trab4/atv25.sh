#!/bin/bash

IFS=$'\n'

# Para cada usuario
for usuario in $(cat /etc/passwd); do
  # Pega o nome do usuario
  nome=$(echo $usuario | cut -d: -f1)
  # Pega o UID do usuario
  uid=$(echo $usuario | cut -d: -f3)
  # Se UID for maior que 100
  if [ $uid -gt 100 ]; then
    echo "$nome ($uid)"
  fi
done
