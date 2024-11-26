
-------------
#htb #windows #activeDirectory 

---------

- Lo primero que hacemos es un escaneo de nmap como siempre para encontrar los puertos y servicios abiertos, y nos encontramos lo siguiente.
![[Pasted image 20240402181850.png]]

- Seguido utilizamos crackmapexec para ver ante que nos estabamos enfrentando y vemos el siguiente resultado.

![[Pasted image 20240402181947.png]]

- Utilizamos rpcclient para enumerar todos los subdominios y usuarios ya que nos deja conectarnos mediante un null sesion.
![[Pasted image 20240402182516.png]]

- Utilizo una query para que me deje solamente los usuarios y me monto un diccionario de usuarios para empezar con el ataque.
![[Pasted image 20240402183126.png]]

 - Utilizamos impacket para hacer un ASREPRoast attack en el que le pasamos el dominio que habiamos encontrado anteriormente y una lista de usuarios que tambien habiamos obtenido anteriormente para que pruebe usuarios validos y nos llegue a devolver un hash para intentar crackear

![[Pasted image 20240402183652.png]]

- Conseguimos crackear la credencial y si es bastante débil por lo que nos ha dado el resultado de la contraseña. ![[Pasted image 20240402183840.png]]

- Con crackmapexec comprobamos si es valida y si tiene permisos para ser utilizada mediante evil-winrm y nos pone pwned por lo que nos podemos conectar mediante win-rm y llegar a ver la flag de user en el escritorio de nuestro usuario.

