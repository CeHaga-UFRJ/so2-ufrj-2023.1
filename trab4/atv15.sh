#!/bin/bash

# Abre o arquivo /etc/passwd, pega a primeira coluna (delimitada por ':') e ordena
cat /etc/passwd | cut -f1 -d: | sort
