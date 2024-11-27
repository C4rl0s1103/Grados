#!/bin/bash

# Función para agregar todos los archivos, solicitar un mensaje de commit y hacer push
function commit_and_push() {
  git add .
  read -p "Ingrese el mensaje de commit: " commit_message
  git commit -m "$commit_message"
  git push
  echo "Commit y push realizados correctamente."
}

# Función para hacer push y apagar el ordenador después de un tiempo
function push_and_shutdown() {
 git add .
  read -p "Ingrese el mensaje de commit: " commit_message
  git commit -m "$commit_message"
  git push
  echo "Commit y push realizados correctamente."
  read -p "Ingrese el tiempo de espera en segundos antes de apagar (0 para cancelar): " wait_time
  if [[ $wait_time -gt 0 ]]; then
    echo "Apagando en $wait_time segundos..."
    sleep $wait_time
    shutdown -h now
  fi
}

# Menú principal
while true; do
  clear
  echo "Menú de opciones Git:"
  echo "1. Commit y push"
  echo "2. Push y apagar"
  echo "3. Salir"
  read -p "Ingrese una opción: " option

  case $option in
    1)
      commit_and_push
      ;;
    2)
      push_and_shutdown
      ;;
    3)
      echo "Saliendo..."
      break
      ;;
    *)
      echo "Opción inválida."
      ;;
  esac
done