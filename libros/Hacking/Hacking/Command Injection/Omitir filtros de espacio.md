----------
#commandInjection #comandos #injection 

---------


## Omitir operadores de la lista negra

Veremos que la mayoría de los operadores de inyección están en la lista negra. Sin embargo, el carácter de nueva línea generalmente no está en la lista negra, ya que puede ser necesario en la propia carga útil. Sabemos que el carácter de nueva línea funciona para agregar nuestros comandos tanto en Linux como en Windows, así que intentemos usarlo como nuestro operador de inyección: ![Operador de filtro](https://academy.hackthebox.com/storage/modules/109/cmdinj_filters_operator.jpg)

Como podemos ver, a pesar de que nuestra carga útil incluía un carácter de nueva línea, nuestra solicitud no fue denegada y obtuvimos la salida del comando ping, . Comencemos discutiendo cómo omitir un carácter comúnmente incluido en la lista negra: un carácter de espacio.`which means that this character is not blacklisted, and we can use it as our injection operator`

---

## Omitir espacios en la lista negra

Ahora que tenemos un operador de inyección en funcionamiento, modifiquemos nuestra carga útil original y la enviemos de nuevo como (): `127.0.0.1%0a whoami`![Espacio de filtro](https://academy.hackthebox.com/storage/modules/109/cmdinj_filters_spaces_1.jpg)

Como podemos ver, todavía recibimos un mensaje de error, lo que significa que todavía tenemos otros filtros que omitir. Entonces, como hicimos antes, agreguemos solo el siguiente carácter (que es un espacio) y veamos si causó la solicitud denegada: `invalid input`![Espacio de filtro](https://academy.hackthebox.com/storage/modules/109/cmdinj_filters_spaces_2.jpg)

Como podemos ver, el personaje espacial también está en la lista negra. Un espacio es un carácter comúnmente incluido en la lista negra, especialmente si la entrada no debe contener espacios, como una IP, por ejemplo. Aún así, ¡hay muchas maneras de agregar un carácter espacial sin usar realmente el carácter espacial!

#### Uso de pestañas

El uso de tabulaciones (%09) en lugar de espacios es una técnica que puede funcionar, ya que tanto Linux como Windows aceptan comandos con tabulaciones entre argumentos, y se ejecutan de la misma manera. Entonces, intentemos usar una tabulación en lugar del carácter de espacio () y veamos si nuestra solicitud es aceptada: `127.0.0.1%0a%09`![Espacio de filtro](https://academy.hackthebox.com/storage/modules/109/cmdinj_filters_spaces_3.jpg)

Como podemos ver, omitimos con éxito el filtro de caracteres de espacio mediante el uso de una tabulación en su lugar. Veamos otro método para reemplazar los caracteres de espacio.

#### Uso de $IFS

El uso de la variable de entorno de Linux ($IFS) también puede funcionar, ya que su valor predeterminado es un espacio y una tabulación, que funcionarían entre los argumentos de los comandos. Por lo tanto, si usamos donde deberían estar los espacios, la variable debería reemplazarse automáticamente con un espacio y nuestro comando debería funcionar. ${IFS}`

Usemos y veamos si funciona (): `${IFS}``127.0.0.1%0a${IFS}`![Espacio de filtro](https://academy.hackthebox.com/storage/modules/109/cmdinj_filters_spaces_4.jpg)

Vemos que nuestra solicitud no fue denegada esta vez, y volvimos a pasar por alto el filtro de espacio.

#### Uso de la expansión de llaves

Hay muchos otros métodos que podemos utilizar para eludir los filtros de espacio. Por ejemplo, podemos usar la función, que agrega automáticamente espacios entre argumentos envueltos entre llaves, de la siguiente manera:`Bash Brace Expansion`

  Omitir filtros de espacio

```shell-session
zunderrubb@htb[/htb]$ {ls,-la}

total 0
drwxr-xr-x 1 21y4d 21y4d   0 Jul 13 07:37 .
drwxr-xr-x 1 21y4d 21y4d   0 Jul 13 13:01 ..
```

Como podemos ver, el comando se ejecutó con éxito sin tener espacios. Podemos utilizar el mismo método en las omisiones del filtro de inyección de comandos, mediante el uso de la expansión de llaves en nuestros argumentos de comando, como (). Para descubrir más omisiones de filtro de espacio, consulte la página [PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/Command%20Injection#bypass-without-space) sobre cómo escribir comandos sin espacios.`127.0.0.1%0a{ls,-la}`

En el laboratorio vemos como funciona el uso de omitir el espacio para colar ya no solo uno si no dos comandos diferentes

![[Pasted image 20240328221930.png]]