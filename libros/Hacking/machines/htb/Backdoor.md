----------
#htb #wordpress #lfi #linux 

-----------

- Empezamos como siempre haciendo un escaneo de nmap sobre los puertos viendo las versiones y lanzando scripts y nos encontramos lo siguiente.
![[Pasted image 20240326143007.png]]

- Le realizamos un whatweb y ya nos vamos encontrando que estamos ante un wordpress. Por lo que vamos buscando subdirectorios y enlazamos la ip al bacdorr.htb y seguimos tambien buscando pluggins con posibles vulnerabilidades. Y nos encontramos un un pluggin llamado ebook Download que nos permite hacer un #directorytraversal.