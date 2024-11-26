----------------------------------
#htb #ssti #subdomain

----------------------------

- Empezamos como siempre haciendo un escaneo de nmap sobre los puertos viendo las versiones y lanzando scripts y nos encontramos lo siguiente.
![[Pasted image 20240323133553.png]]

- Nos descargamos un archivo .tar que nos encontramos en la pagina web el cual contenia una base de datos que contenia la infomacion para poder logearnos, estaba encriptada pero con john conseguimos la contraseña. Nos logueamos en el panel de admin y pudimos entrar en el panel de administracion.

- Como no hemos encontrado nada dentro del gestor de administracion, realizamos un escaneo de subdominios en el que nos encontramos un subdominio llamado email.bolt.htb

- Mediante la inspeccion del codigo conseguimos logearnos de manear conrrecta en el subdominio que habiamos encontrado anteriormente.

- Nos permite enviar un mensaje al correo desde el panel de administracion el cual tras realizar alguna prueba es vulnerable a ssti por lo que le metemos un payload sado de [[payloadallthethings]] y se lo añadimos en el campo vulnerable.
![[Pasted image 20240323144930.png]]

![[Pasted image 20240323145009.png]]


- Como es vulnerable nos montamos desde nuestra maquina en kali un index.html en el que metemos una revshell en bash y la compartimos mediante un servidor en python, desde la web modificamos el parametro id del payload por un curl | bash que nos interprete la shell y nos ponemos en escucha con nc y ya cionseguiriamos acceseo a la maquina como www-data.


-----------------------

- Para escalar privilegios empezamos a tirar de leanpeas ya que no encontramos nada de manera manual, a ver si encontramos alguna manera de como escalar privilegios, ya que de primeras no estamos en ningun usurario solo estamos en www-data

- En leanpeas no muestra una posible contraseña filtrada en el sistema la cual nos sirve para migrar hacia el usuario eddie y conseguimos encontrar la primera flag.


