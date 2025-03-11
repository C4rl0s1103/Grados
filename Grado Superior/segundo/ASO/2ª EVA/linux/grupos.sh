#!/bin/bash

filas=0
grupo=0
nombregrupo=0

if [ $# -eq 0 ]; then
  echo "No has pasado parametros"
  exit
fi

while [ $# -ne 0 ]; do

  filas=$(grep -i $1: /etc/passwd | cut -d: -f4)

if [ $? -eq 0 ]; then

  nombregrupo=$(grep :$filas: /etc/group | cut -d: -f1)
  echo "El usuario $1 Existe en el sistema su grupo principal es $nombregrupo"

  grupo=$(grep -v "^$nombregrupo" /etc/group | grep $nombregrupo | cut -d: -f1)

  for i in $grupo
  do
    echo "El usuario $1 tambien pertenece al grupo $i"
  done
else
  echo "Este usuario $1 no Existe en el sistema"
fi
shift
done