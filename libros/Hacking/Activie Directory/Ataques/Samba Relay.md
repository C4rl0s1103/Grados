
----------
#activeDirectory #responder #smbrelay 

------------

 Envenenar la red utilizando el responder.py

![[Pasted image 20240422204651.png]]

`python3 Responder.py -i eth0 -rdw` 

- Si el samba no esta firmado y mediante estamoos envenenando la red se realiza una peticion obtendremos un hash NTLM de version2.

![[Pasted image 20240422204933.png]]

- Y puedes incluso llegar a pillar el hash del administrador.
![[Pasted image 20240422205049.png]]

Con estos hashes no podemos hacer pass de hash pero si que podriamos llegar a obtener la contraseña crackeada usando herramientas como john.

![[Pasted image 20240422205356.png]]

