#!/bin/bash

## pondremos la ip de la maquina en el issue, esto sirve si tenemos una maquina sin entorno grafico
echo "pondremos la ip de la maquina en el archivo issue"
sleep 2
echo "\4" >> /etc/issue

## Actualizar paquetes y instalar curl 
echo "Instalamos curl"
sleep 2
sudo apt update >/dev/null
sudo apt install curl -y  >/dev/null

## Instalación de docker
echo "Descargamos de la web de docker el archivo get-docker.sh"
sleep 5
sudo curl -fsSL https://get.docker.com/ -o get-docker.sh
sudo chmod +x get-docker.sh
sudo ./get-docker.sh

## Dar permisos al usuario 
echo "Damos permisos al usuario"
sleep 2
sudo usermod -aG docker ${USER}
newgrp docker

## instalaremos docker-compose 
echo "Instalamos docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sleep 2

## Otorgaremos permisos de ejecucion
echo "otorgaremos permisos de ejecucion al archivo descargado"
sleep 3
sudo chmod +x /usr/local/bin/docker-compose

## vemos si ya esta instalado docker-compose
echo "Verificamos si esta instalado docker-compose"
docker-compose --version 
sleep 3

## Instalamos el contenedor hello-world para ver si funciona correctamente
echo "instalamos el contenedor hello-world"
docker run hello-world
sleep 5

## Creamos el volumen de portainer
echo "creamos el volumen de portainer" 
sleep 2
docker volume create portainer_data

## Descargamos e instalamos el contendor de portainer 
echo "Descargamos e instalamos el contendor de container"
sleep 2
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest 

## usaremos docker-ps para ver si esta ejecutandose correctamente
echo "Vemos si esta portainer instalado"
docker ps
sleep 3

## ejecutamos el comando "ip -c a" para saber la direccion IP
echo "vemos que ip tiene la maquina"
ip -c a

## Pondremos lo siguiente en nuestro navegador 
echo "Pondremos lo siguiente en el navegador Https://ip:4443"