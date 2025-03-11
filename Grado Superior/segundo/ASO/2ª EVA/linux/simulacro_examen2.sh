#!/bin/bash

numero=0
factorial=1

if [ $1 -eq 0 ]
then
    echo "no me has pasado parametros"
fi

if [ $1 -gt 1 -a $1 -le 9 ]
then
    echo -e "\n+++++++++++++++++++EL FACTORIAL DEL NUMERO $1++++++++"
    numfac=$1
    numero=$1
    while [ $numero -gt 1 ]
    do
        factorial=$((numero*factorial))
        numero=$((numero-1))
    done
    echo "el factorial del numero $numfac es: $factorial"
else
    echo "numero incorrecto, tiene que ser entre 1 y 9"
    exit
fi


