#!/bin/bash
#variáveis de ambiente
echo $PATH # Imprime variavel PATH do ambiente
echo $USER $HOME # Imprime variavel USER do ambiente, um espaço e a variavel HOME
# Pode-se ver todas as variáveis de ambiente com o comando env | less
# Variaveis locais
echo "$ola Joao" # Imprime nada para $ola pois nao tem valor, seguido de " Joao"
echo "$olaJoao" # Imprime nada pois $olaJoao nao tem valor
echo "${ola} Joao" # Mesma coisa da linha 7
msg="$ola $USER" # Atribui a variavel $msg o texto " $USER", sendo o valor de $USER
echo msg # Imprime "msg"

#input
echo "Escreva qualquer coisa"; read var # Imprime "Escreva ..." e depois le a variavel var
echo "Escreveu $var" # Imprime a variavel lida

#execução
data=`date` # Roda o comando "date" e salva a saida em data 
echo $data # Imprime a saida do comando
info=`echo $HOME ; echo " estamos em "; pwd` # Roda dois echos seguidos de um pwd e salva a saida em info
echo $info # Imprime a saida do comando

#contas
X=1 # Atribui a variavel X o valor 1
let x=x+2+3 # Define o valor 5 a variavel x
echo "x=$x" # Imprime "x=5"
x=$((x+3)) # Calcula a expressao x+3 e atribui esse valor a variavel x
echo "x=$x" # Imprime "x=8"
let x-- # Subtrai 1 da variavel x
echo "x=$x" # Imprime "x=7"

#variáveis especiais
echo "Numero de argumentos para este script $#" # Imprime a quantidade de argumentos ao rodar o codigo (no caso de "bash atv1.sh", 0)
echo "Numero de argumentos para este script $*" # Imprime os argumentos, se tiver
echo "Primeiro argumento $1 Segundo argumento $2" # Imprime o primeiro argumento ($1) seguido do segundo argumento ($2)
echo "Nome deste script $0" # Imprime o nome do "arquivo.sh"
echo "O process ID deste script $$" # Imprime o ID do processo
echo "Exit status do comando anterior $?" # Imprime 0 pois o status do comando anterior foi bem sucedido
