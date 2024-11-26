--------

------------

Creamos la sesion de chisel como server y nos conectamos con chisel como servidor desde la primera maquina hacia la maquina kali principal.
![[Pasted image 20240414195424.png]]

- Una vez visto desde nuestra maquina kali como llegar a vulnerar la segunda podemos  utilizar socat para todas las conexiones que recibamos desde la maquina vulnerada pasarla por el puerto 443 al puerto 443 de la maquina kali y asi poder llegar a tener la reverse shell via nc a la maquina kali principal.
![[Pasted image 20240414195648.png]]

- Una vez establecida la conexion podemos llegar a hackear la siguiente maquina y meterle el chisel y socat para poder tunelizar tambien el trafico de la red que reciba por el puerto 6565 hacia el 1234 que es el puerto en el que esta corriendo el chisel server principal y poder ver la ultima maquina con la kali. Lo primero es usar socat para poder conectar a la otra maquina.
![[Pasted image 20240414200446.png]]


-  Ahora ya podemos utilizar socat hacia el servidor de chisel principal añadiendo un nuevo puerto en este caso el 9999 que depues deberemos de añadir al proxychains para  que nos tunelice toda la red y asi poder llegar hasta la primera maquina.