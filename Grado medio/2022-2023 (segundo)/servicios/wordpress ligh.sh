#!/bin/bash


apt update ; apt install php ssh php-mysql php-xml apache2 mariadb-server -y

wget https://es.wordpress.org/latest-es_ES.tar.gz
echo "Descomprimir y mover archivos"
mv latest-es_ES.tar.gz /var/www/html/
cd /var/www/html/
rm index.html 
tar -xzf latest-es_ES.tar.gz wordpress/
rm latest-es_ES.tar.gz  
mv wordpress/* .
chown www-data: /var/www/html

mysql -e"CREATE DATABASE wordpressdb; 
GRANT ALL PRIVILEGES ON wordpressdb.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'wordpressuserpass'; 
FLUSH PRIVILEGES;"

reboot

