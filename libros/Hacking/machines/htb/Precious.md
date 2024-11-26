--------------
#htb #pdfkit #python #deserialization #YAML

-----------


- Lo primero que hacemos es un escaneo de nmap como siempre para encontrar los puertos y servicios abiertos, y nos encontramos lo siguiente.
![[Pasted image 20240326110802.png]]

- Añadimos el dominio que nos hemos encontrado en el escaneo de nmap, y todo seguido nos vamos a ver en la web que nos podemos encontrar ahi.

- Accedemos a la web y vemos que si le pasamos un archivo compartido no los convierte a pdf y nos lo podemos decargar, asi que me lo descargo y utilizao exiftool para poder llegar a ver los metadatos que contiene la imagen y me muestra lo siguiente.
![[Pasted image 20240326111800.png]]
- Tras ver la version buscamos exploits y encontramos un posible command injection en la url que poniamos para descargar archivos y lo vamos a porbar el comand injection seria el siguiente.
![[Pasted image 20240326112745.png]]

- Vemos que nos ha funcionado en esta imagen.
![[Pasted image 20240326112814.png]]

- Con esto ya podemos establecer una reverse shell que nos va a permitir el acceso como usuario ruby. Nos establecemos la reverse shell usando el one liner en bash ya que nos funciona a la primera. Ahora hemos visto que tenemos otro usuario y no tenemos la usr flag por lo que tenemos que hacer user pivoting. Y ahora ya nos tocara comenzar con la escalada de privilegios.

--------------------


- Buscamos varias formas de realizar la escalada y nos encontramos un archivo config que tenia la contraseña de henrry y nos facilitaria la forma de llegar a ser el usuario henrry con el que ya deberiamos de saltar a root.
![[Pasted image 20240326123949.png]]

- Ahora siendo el usuario henry tiramos de sudo -l y nos dice que podemos ejecutar como root un script en ruby el cual vamos a investigar un poco y nos encontramos con una parte que contiene YAML.load y un archivo que lo esta cargando desde ninguna ruta contemplada por lo que ese archivo lo podriamos llegar a ejecutar desde cualquier ruta.

- Buscamos un archivo en google poniendo RCE YML file y nos encuentra varios creamos el archivo que no indica la ruta lo ejecutamos desde ese directorio pasandole el comando chmod u+s y consegumos tener privilegios de suid en la /bin/bash con eso ya podriamos ser root, solo nos quedaria meter un bash -p para ejecutar la bash con preivilegios y llegariamos a ser root.