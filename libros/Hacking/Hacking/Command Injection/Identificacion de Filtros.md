------------
#commandInjection #comandos #injection 

---------

## Detección de filtros/WAF

Comencemos visitando la aplicación web en el ejercicio al final de esta sección. Vemos la misma aplicación web que hemos estado explotando, pero ahora tiene algunas mitigaciones bajo la manga. Podemos ver que si probamos los operadores anteriores que probamos, como (, , ), obtenemos el mensaje de error : `Host Checker``;``&&``||``invalid input`![Filter](https://academy.hackthebox.com/storage/modules/109/cmdinj_filters_1.jpg)

Esto indica que algo que enviamos activó un mecanismo de seguridad que denegó nuestra solicitud. Este mensaje de error se puede mostrar de varias maneras. En este caso, lo vemos en el campo donde se muestra la salida, lo que significa que fue detectado y evitado por la propia aplicación web. .`PHP``If the error message displayed a different page, with information like our IP and our request, this may indicate that it was denied by a WAF`

Comprobemos la carga útil que enviamos:

Código: bash

```bash
127.0.0.1; whoami
```

Aparte de la IP (que sabemos que no está en la lista negra), enviamos:

1. Un carácter de punto y coma `;`
2. Un carácter espacial
3. Un comando`whoami`

Por lo tanto, la aplicación web o , o ambas. Entonces, veamos cómo omitir cada uno.`detected a blacklisted character``detected a blacklisted command`

---

## Personajes en la lista negra

Una aplicación web puede tener una lista de caracteres en la lista negra y, si el comando los contiene, denegaría la solicitud. El código puede tener un aspecto similar al siguiente:`PHP`

Código: php

```php
$blacklist = ['&', '|', ';', ...SNIP...];
foreach ($blacklist as $character) {
    if (strpos($_POST['ip'], $character) !== false) {
        echo "Invalid input";
    }
}
```

Si algún carácter de la cadena que enviamos coincide con un carácter de la lista negra, nuestra solicitud es denegada. Antes de comenzar nuestros intentos de eludir el filtro, debemos tratar de identificar qué carácter causó la solicitud denegada.

---

## Identificación de personajes en la lista negra

Reduzcamos nuestra solicitud a un carácter a la vez y veamos cuándo se bloquea. Sabemos que la carga útil () funciona, así que comencemos agregando el punto y coma (): `127.0.0.1``127.0.0.1;`![Filter Character](https://academy.hackthebox.com/storage/modules/109/cmdinj_filters_2.jpg)

Todavía recibimos un error , lo que significa que un punto y coma está en la lista negra. Entonces, veamos si todos los operadores de inyección que discutimos anteriormente están en la lista negra.`invalid input`


