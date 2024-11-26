#!/bin/bash

echo ¡¡Mirar archivo importante.txt!!

#Crea un archivo para el nombre de la base de datos, usuario y contraseña
cat > ~/importante.txt << EOF
Nombre de la base de datos: wordpressdb
Usuario: wordpressuser
Contraseña: wordpressuserpass
EOF

#Con la maquina arrancada sin iniciar sesión podemos ver la ip 
echo "\4" >> /etc/issue

echo "Instalando paquetes"
#Instalamos paquetes
apt update ; apt install php ssh php-mysql php-xml apache2 mariadb-server -y

echo "Cambiando nombre a la maquina"

hostnamectl set-hostname lampwordpress

echo "Descargando wordpress"

#Descargamos la ultima versión de wordpress 
wget https://es.wordpress.org/latest-es_ES.tar.gz
echo "Descomprimir y mover archivos"
mv latest-es_ES.tar.gz /var/www/html/
cd /var/www/html/
rm index.html 
tar -xzf latest-es_ES.tar.gz wordpress/
rm latest-es_ES.tar.gz  
mv wordpress/* .
chown www-data: /var/www/html

echo "Creando base de datos"

#Creamos la base de datos
mysql -e"CREATE DATABASE wordpressdb; GRANT ALL PRIVILEGES ON wordpressdb.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'wordpressuserpass'; FLUSH PRIVILEGES;"

reboot

