--------------
#htb #xss #cookie 

--------

- Lo primero que hacemos es un escaneo de nmap como siempre para encontrar los puertos y servicios abiertos, y nos encontramos lo siguiente.
![[Pasted image 20240324155920.png]]

- Nos metemos a ver la pagina web y vemos un panel de support y un dashboard al que no podemos acceder ya que no somos administradores. Hacemos un par de pruebas e intercepto la peticion del support con burpsuite y vemos una cookie de sesion la cual podriamos intentar encontrar la de admin para poder acceder como admin. Nos damos cuenta que es vulnerable a un #xss por lo que probamos una forma de intercepar la cookie de sesion usando un xss.

- Entramos en payloadalltherthins y en el apartado de cookies de xss conseguimos encontrar un payload que funcionaba por lo que añadiendolo en el userAgent y en la parte vulnerable a xss nos dejo ver la cookie de sesion de admin
![[Pasted image 20240324160820.png]]
![[Pasted image 20240324160850.png]]

 - Ahora teniendo la cookie de sesion de admin ya podriamos ir al panel de dashboard aunque primero tenemos que añadir la cookie en el storage de firefox para que nos detecte como admin.

- En el panel de dashborad interceptamos la peticion tambien con burp y probamos a ejecutar comandos en el apartado date y en efecto nos funciona por lo que tenemos posibilidad de rce con el parametro data introducimos una revshell con nc y conseguimos el acceso a la maquina victima.

- Una vez dentro tiramos sudo -l y nos encontramos lo siguiente.![[Pasted image 20240324161612.png]]

- Es un script que ejecuta otr script llamado initdb.sh lo que hice fue crear ese script en /tmp añadiendole permisos suid a la bash para poder escalar los privilegios. Ejecuto el script como sudo desde /tmp y le da los permisos a la bash. Ahora simplemete ejecutamos bash -p y ya seriamos usuario root.
![[Pasted image 20240324161830.png]]
