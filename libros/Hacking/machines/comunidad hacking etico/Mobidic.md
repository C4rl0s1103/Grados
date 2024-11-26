----------
#docker  #comunidadHacking #ctf #keepas

--------

- Lo primero de todo lo que hicimos fue realizar un escaneo de nmap a la maquina vicitima en la que nos encontramos una serie de puertos abieros.
![[Pasted image 20240321001943.png]]

- Fuimos a ver el puerto 80 y nos encontramos con la pagina predeterminada de ubuntu, por lo que decidí hacer un escaneo de directorios con gobuster para ver que posibles directorios habia por detras, y nos encontramos el archivo penguin.php que contenia algo de informacion.
![[Pasted image 20240321002228.png]]

- Al encontrarnos con pinguinito llegamos a pensar que puede ser un usuario por lo que con hydra hago un ataque de fuerza bruta y consigo obtener el la contraseña love para este usuario. Accedemos via ssh a la maquina y funciona todo correctamente por lo que ya tendriamos la flag de user.

- Ahora comenzamos con la escalada la cual va a tener que ver con docker ya que bueno al hacer ifconfig vemos que estamos en la  interfaz de red de docker a parte de en la nuestra propia,  por lo que entra en juego chisel.

- Nos montamos un server de python y nos mandamos el binario de chisel a la maquina victima y ponemos la maquina local como servidor y la victima como cliente.

- Accedemos ahora a la ip del contenedor de docker por el puerto 3000 y nos encontramos con la web de grafana que seria la siguiente
 ![[Pasted image 20240321011034.png]]

- En el archivo que nos encontramos el usuario pinguinito vimos tambien como tenemos una version de grafana la cual es 8.3.0 y si la buscamos tiene una vulnerabilidad reportada y un exploit que podemos encontrar mediante searchsploit. El exploit nos permite leer archivos de dentro de la maquina como si fuese un LFI por lo que apuntamos al archivo que nos habiamos encontrado anteriormente en el cual nos mostraba una base de datos.

- Apuntamos al archivo /tmp/database_pass.txt y nos encontramos con una contrasela la cual podemos utilizar para desbloquear el archivo de keepas que habiamos encontrado anteriormente. 

- Por ultimo accedemos al archivo de keepas y si colocamos la contraseña que hemos obtenid podemos llegar a encontrar la contrasela de el nuevo usuario con el cual una vez dentro podemos llegar a ser root usando sudo su