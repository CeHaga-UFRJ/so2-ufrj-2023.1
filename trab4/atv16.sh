#!/bin/bash

# Abre o arquivo /etc/passwd, pega o bash na setima coluna, ordena e remove as linhas repetidas
cat /etc/passwd | cut -f7 -d: | sort | uniq
