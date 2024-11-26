----------------
#linux #htb #xss #sql 

-----------

- Lo primero de todo es realiza el escaneo de nmap para poder llegar a ver puertos y servicios que estén abiertos y nos encontramos lo siguiente.
![[Pasted image 20240322231803.png]]

- Después de ver el puerto 80 lo primero que se me ocurre es ir a ver el puerto web por lo que me dirijo a ver la pagina web a ver que nos podemos encontrar por ahi, y despues de realizar pruebas a la pagina web nos damos cuenta de que al cambiar de usuario y poner uno demasiado largo nos lo recorta por lo que puede que este aconteciendo un [[sqlTruncationAttack ]].

- Empezamos a hacer pruebas hacia este sql truncation interceptando la peticion de login con burp y probar añadiendo espacios y un punto para ver en que momento tras ejecutar ctrl espacio en el repeater no me dice que el usuario existe y veremos que ahi es donde peta y sera la line de caracteres donde podremos realizar el ataque.
![[Pasted image 20240323001100.png]]
