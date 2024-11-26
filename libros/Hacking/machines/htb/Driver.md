-------------------
#htb #windows #scf  #PrintSpooler 

----------

- Lo primero que hacemos es un escaneo de nmap como siempre para encontrar los puertos y servicios abiertos, y nos encontramos lo siguiente.
![[Pasted image 20240322162125.png]]

- Al no encontrar nada via smb nos vamos hacia el apartado web ya que vemos el puerto 80 habilitado y nos encontramos con un panel de login el cual tiene unas credenciales default que son admin:admin y podemos entrar al panel de control de una impresora.

- Empezamos a explorar que podriamos llegar a hacer y se nos ocurre explotar un scf Malicous file y compartirlo por smbFolder con un smbServer. Estos al hacer la peticion hace que el usuario tenga que autenticarse por lo que como tira a mirar de nuestro archivo que estamos compartiendo podemos llegar a ver el hash y el usuario y podriamos intentar llegar a crackearlo.
![[Pasted image 20240322164249.png]]

- Le pasmos el hash que hemos obtenido a john y nos encuentra una password para el usuario tony con la cual nos vamos a poder conectar mediante evil-winrm y encontramos la flag, y ahora el siguiente paso seria llegar a escalar privilegios. 

- Ahora vamos a subirnos el WinPeas para ver cual va a ser la forma de poder escalar privilegios a ver que nos encuentra. Y nos termina encontrando un spolsv el cual si buscamos un exploit en github nos encuentar uno que ejecutandolo nos crear un usuario que esta en el grupo administrador.

- Lo ejecutamos y nos creamos un usuario ruben con contraseña ruben123 y validamos con crackmapecxec que funcione este usuario y en efecto nos funciona por lo que ya con evil-winrm nos conectamos como ruben y llegamos a ver la flag de root en el escritorio del administrador.




