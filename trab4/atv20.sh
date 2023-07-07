#!/bin/bash

# Lista os arquivos com seu tamanho da home, ordena do menor para maior arquivo e abre no less
du ~ -h | sort -h | less
