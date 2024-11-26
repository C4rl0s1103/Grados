-----------
#htb #lfi #tomcat #lxd

----------------

- Lo primero fue hacer un escaneo de nmap en el que nos reporto el puerto 8080, 80 y el puerto 22 ssh.

- Llegamos al puerto 80 y nos añadimos el dominio megahosting.htb al /etc/hosts/ para que funcionase perfectamente la web. Y en uno de los parametros de esta pagina llegamos a encontrarnos un archivo que daba pie a un lfi ya que apuntaba a archivos internos de la maquina.

- Mediente enumeracion de este lfi llegamos a poder ver un usuario y una contraseña para el panel de manager del tomcat que estaba corriendo por el puerto 8080

![[Pasted image 20240321012740.png]]

Pero nos damos cuenta de que estas credenciales no nos funcionan por lo que tenemos que probar otra forma diferente de escalar nuestros privilegios ya que por esta via es imposible.

- Buscando en google nos encontramos una ruta alternativa con la que poder acceder al manager del tomcat que es /host-manager/html/ y cuando nos solicita las credenciales si que consegimos acceder al panal de control con las credenciales que obtubimos anteriormente.

![[Pasted image 20240321012801.png]]

- En el panel de tomcat no podemos subir un archivo war como solemos hacer de normal por lo que en este caso vamos a usar curl para listar las aplicaciones que tenemos corriendo en nuestro servidor.

![[Pasted image 20240321012818.png]]


- Y ya que no podemos desde el panel de administracion de tomcat subir ningun archivo, vamos a usar curl para llegar a subir el archivo de la siguiente manera

![[Pasted image 20240321012834.png]]

- Una vez subido el archivo podemos facilmente llegar hasta el desde la url y ejecutarlo por lo que poniendonos en escucha mediante nc llegariamos a tener la conexion que necesitamos y llegariamos a obtener la shell como Tomcat.

------------------------------

- Una vez dentro para poder saltar al usuario ash buscamos la contraseña en /var/www/html y nos encontramos un archivo .zip al que hay que intentar romper la contraseña para poder descomprimirlo. La pasamos por el rockyou y nos encuentra una contraseña la cual vamos a poder utilizar para escalar los privilegios del usuario Tomcat al usuario ash.

Siendo ash hacemos un id y nos encontramos que estamos en estos grupos. 

![[Pasted image 20240321012854.png]]

- Por lo que en searchsploit tenemos el siguiente exploit creado por s4vitar con el cual vamos a poder escarar los privilegios de manear automatica, vamos a tener que ponernos el exploit y ademas desde la descripcion del exploit un enlace en el cual nos tendremos que descargar  y ejecutarlo coin bash para que nos quede un comprimido. Nos lo compartimos todo a la maquina victima y lo ejecutamos.

![[Pasted image 20240321012910.png]]

 - Entraremos dentro de un contenedor en el cual ya podremos ver la flag de root directamente y estariamos dentro de /root y podriamos llegar a ver la flag.
