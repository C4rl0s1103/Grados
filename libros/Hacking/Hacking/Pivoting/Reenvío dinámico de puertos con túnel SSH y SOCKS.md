
---------------
#htb #ssh #pivoting 

---------

## Reenvío de puertos en contexto

`Port forwarding` es una técnica que nos permite redirigir una solicitud de comunicación de un puerto a otro. El reenvío de puertos utiliza TCP como capa de comunicación principal para proporcionar comunicación interactiva para el puerto reenviado. Sin embargo, se pueden utilizar diferentes protocolos de capa de aplicación, como SSH o [incluso SOCKS](https://en.wikipedia.org/wiki/SOCKS) (capa que no es de aplicación) para encapsular el tráfico reenviado. Esto puede ser eficaz para eludir los firewalls y utilizar los servicios existentes en el host comprometido para pasar a otras redes.

![[Pasted image 20240327194046.png]]

- Para realizar el PortForwarding por ssh debermos hacerlo de la siguiente manera

````shell-session
zunderrubb@htb[/htb]$ ssh -L 1234:localhost:3306 ubuntu@10.129.202.64
````

- El comando le dice al cliente SSH que solicite al servidor SSH que reenvíe todos los datos que enviamos a través del puerto en el servidor Ubuntu. Al hacer esto, deberíamos poder acceder al servicio MySQL localmente en el puerto 1234. Podemos usar Netstat o Nmap para consultar nuestro host local en el puerto 1234 para verificar si el servicio MySQL fue reenviado.
	`-L``1234``localhost:3306`

- Podriamos llegar a hacer comprobaciones usando netstat -n para ver los puertos que estan abiertos o realizando un escaneo de nmap al localhosts.

Del mismo modo, si queremos reenviar varios puertos desde el servidor de Ubuntu a su host local, puede hacerlo incluyendo el argumento en su comando ssh. Por ejemplo, el siguiente comando reenvía el puerto 80 del servidor web apache al puerto local del host de ataque en .`local port:server:port``8080`
#### Reenvío de varios puertos

  Reenvío dinámico de puertos con túnel SSH y SOCKS

```shell-session
zunderrubb@htb[/htb]$ ssh -L 1234:localhost:3306 -L 8080:localhost:80 ubuntu@10.129.202.64
```


## Configuración de Pivot

Ahora, si escribe en el host de Ubuntu, encontrará que este servidor tiene varias NIC:`ifconfig`

- Uno conectado a nuestro host de ataque (`ens192`)
- Uno que se comunica con otros hosts dentro de una red diferente (`ens224`)
- La interfaz de bucle invertido ().`lo`

A diferencia del escenario anterior, en el que sabíamos a qué puerto acceder, en nuestro escenario actual, no sabemos qué servicios se encuentran al otro lado de la red. Por lo tanto, podemos escanear rangos más pequeños de IP en la red () red o en toda la subred (). No podemos realizar este escaneo directamente desde nuestro host de ataque porque no tiene rutas a la red. Para ello, tendremos que realizar y nuestros paquetes de red a través del servidor de Ubuntu. Podemos hacer esto iniciando un en nuestro (host de ataque personal o Pwnbox) y luego configurar SSH para reenviar ese tráfico a través de SSH a la red (172.16.5.0/23) después de conectarnos al host de destino.`172.16.5.1-200``172.16.5.0/23``172.16.5.0/23``dynamic port forwarding``pivot``SOCKS listener``local host`

A esto se le llama over. SOCKS son las siglas de , un protocolo que ayuda a comunicarse con los servidores en los que se aplican restricciones de cortafuegos. A diferencia de la mayoría de los casos en los que iniciaría una conexión para conectarse a un servicio, en el caso de SOCKS, el tráfico inicial es generado por un cliente SOCKS, que se conecta al servidor SOCKS controlado por el usuario que desea acceder a un servicio en el lado del cliente. Una vez establecida la conexión, el tráfico de red se puede enrutar a través del servidor SOCKS en nombre del cliente conectado.`SSH tunneling``SOCKS proxy``Socket Secure`

Esta técnica se utiliza a menudo para eludir las restricciones establecidas por los cortafuegos y permitir que una entidad externa eluda el cortafuegos y acceda a un servicio dentro del entorno de cortafuegos. Una ventaja más de utilizar el proxy SOCKS para dinamizar y reenviar datos es que los proxies SOCKS pueden pivotar mediante la creación de una ruta a un servidor externo desde . Los proxies SOCKS son actualmente de dos tipos: y . SOCKS4 no proporciona ninguna autenticación ni soporte UDP, mientras que SOCKS5 sí lo proporciona. Tomemos un ejemplo de la siguiente imagen donde tenemos una red NAT de 172.16.5.0/23, a la que no podemos acceder directamente.`NAT networks``SOCKS4``SOCKS5`

![[Pasted image 20240327220547.png]]

- En la imagen anterior, el host de ataque inicia el cliente SSH y solicita al servidor SSH que le permita enviar algunos datos TCP a través del socket ssh. El servidor SSH responde con un acuse de recibo y, a continuación, el cliente SSH comienza a escuchar en . Cualquier dato que envíe aquí se transmitirá a toda la red (172.16.5.0/23) a través de SSH. Podemos usar el siguiente comando para realizar este reenvío dinámico de puertos.`localhost:9050`

