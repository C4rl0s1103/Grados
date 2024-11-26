#!/bin/bash

echo ¡¡Mirar archivo importante.txt!!

#Crea un archivo para el nombre de la base de datos, usuario y contraseña
cat > ~/importante.txt << EOF
Nombre de la base de datos: nextclouddb
Usuario: nextclouduser
Contraseña: nextclouduserpass
EOF

#Con la maquina arrancada sin iniciar sesión podemos ver la ip 
echo "\4" >> /etc/issue

echo "Instalando paquetes"
#Instalamos paquetes
apt update
apt install php8.3 wget unzip ssh php8.3-mysql php8.3-xml apache2 mariadb-server php php8.3-common php8.3-curl libapache2-mod-php php8.3-imap php8.2-redis php8.3-cli php8.3-snmp php8.3-xml php8.3-zip php8.3-mbstring php8.3-gd php8.3-xml php8.3-mysql php8.3-mbstring -y

echo "Instalando claves gpg"
#Instalamos paquetes
apt -y install lsb-release apt-transport-https ca-certificates 

wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

echo "Cambiando nombre a la maquina"

hostnamectl set-hostname lampnextcloud

#Creamos la base de datos
mysql -e"CREATE DATABASE nextclouddb; GRANT ALL PRIVILEGES ON nextclouddb.* TO 'nextclouduser'@'localhost' IDENTIFIED BY 'nextclouduserpass'; FLUSH PRIVILEGES;"

#Descargamos la ultima versión de nextcloud
cd /var/www/html
wget https://download.nextcloud.com/server/releases/latest.zip
unzip -q latest.zip
mv nextcloud/* . 
chown www-data: /var/www/html

reboot
