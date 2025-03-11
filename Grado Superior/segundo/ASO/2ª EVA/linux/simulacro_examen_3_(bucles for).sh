#!/bin/bash

numero=0
factorial=1

read -p "Introduce un numero para hallar el factorial:" numero
if [ $numero -eq 0 ]
then
    echo "no me has pasado parametros"
fi

if [ $numero -gt 1 ] && [ $numero -le 9 ]
then
    echo -e "\n+++++++++++++++++++EL FACTORIAL DEL NUMERO $numero++++++++"
    for ((i=numero;i>=1;i--))
    do
        factorial=$((factorial*i))
    done
    echo "el factorial del numero $numero es: $factorial"
else
    echo "el numero introducido $numero es un valor incorrecto"
    exit
fi
