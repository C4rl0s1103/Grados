---
tags:
  - commandInjection
  - comandos
---
# Omitir otros personajes de la lista negra

---

Además de los operadores de inyección y los caracteres de espacio, un carácter muy común en la lista negra es el carácter de barra diagonal () o barra invertida (), ya que es necesario especificar directorios en Linux o Windows. Podemos utilizar varias técnicas para producir cualquier personaje que queramos evitando el uso de personajes en la lista negra.`/``\`

---

## Linux

Hay muchas técnicas que podemos utilizar para tener barras diagonales en nuestra carga útil. Una de esas técnicas que podemos usar para reemplazar barras diagonales () es a través de como lo hicimos con . Si bien se reemplaza directamente con un espacio, no existe tal variable de entorno para barras diagonales o punto y coma. Sin embargo, estos caracteres se pueden usar en una variable de entorno, y podemos especificar y de nuestra cadena para que coincida exactamente con este carácter.`or any other character``Linux Environment Variables``${IFS}``${IFS}``start``length`

Por ejemplo, si nos fijamos en la variable de entorno en Linux, puede tener un aspecto similar al siguiente:`$PATH`

  Omitir otros personajes de la lista negra

```shell-session
zunderrubb@htb[/htb]$ echo ${PATH}

/usr/local/bin:/usr/bin:/bin:/usr/games
```

Entonces, si comenzamos en el carácter, y solo tomamos una cadena de longitud, terminaremos con solo el carácter, que podemos usar en nuestra carga útil:`0``1``/`

  Omitir otros personajes de la lista negra

```shell-session
zunderrubb@htb[/htb]$ echo ${PATH:0:1}

/
```

**Nota:** Cuando usamos el comando anterior en nuestra carga útil, no agregaremos , ya que solo lo estamos usando en este caso para mostrar el carácter de salida.`echo`

También podemos hacer lo mismo con las variables de entorno or. También podemos usar el mismo concepto para obtener un carácter de punto y coma, que se usará como operador de inyección. Por ejemplo, el siguiente comando nos da un punto y coma:`$HOME``$PWD`

  Omitir otros personajes de la lista negra

```shell-session
zunderrubb@htb[/htb]$ echo ${LS_COLORS:10:1}

;
```

Ejercicio: Intente comprender cómo el comando anterior dio como resultado un punto y coma y, a continuación, utilícelo en la carga útil para usarlo como operador de inyección. Sugerencia: El comando imprime todas las variables de entorno en Linux, por lo que puede ver cuáles pueden contener caracteres útiles y luego intentar reducir la cadena solo a ese carácter.`printenv`

Por lo tanto, intentemos usar variables de entorno para agregar un punto y coma y un espacio a nuestra carga útil () como nuestra carga útil, y veamos si podemos omitir el filtro: `127.0.0.1${LS_COLORS:10:1}${IFS}`![Operador de filtro](https://academy.hackthebox.com/storage/modules/109/cmdinj_filters_spaces_5.jpg)

Como podemos ver, esta vez también hemos evitado con éxito el filtro de caracteres.

---

## Windows

El mismo concepto funciona también en Windows. Por ejemplo, para producir una barra diagonal en , podemos una variable de Windows ( -> ), y luego especificar una posición inicial ( -> ), y finalmente especificar una posición final negativa, que en este caso es la longitud del nombre de usuario ( -> ) :`Windows Command Line (CMD)``echo``%HOMEPATH%``\Users\htb-student``~6``\htb-student``htb-student``-11``\`

  Omitir otros personajes de la lista negra

```cmd-session
C:\htb> echo %HOMEPATH:~6,-11%

\
```

Podemos lograr lo mismo usando las mismas variables en . Con PowerShell, una palabra se considera una matriz, por lo que tenemos que especificar el índice del carácter que necesitamos. Como solo necesitamos un carácter, no tenemos que especificar las posiciones inicial y final:`Windows PowerShell`

  Omitir otros personajes de la lista negra

```powershell-session
PS C:\htb> $env:HOMEPATH[0]

\


PS C:\htb> $env:PROGRAMFILES[10]
PS C:\htb>
```

También podemos usar el comando PowerShell para imprimir todas las variables de entorno y luego elegir una de ellas para producir un carácter que necesitamos. `Get-ChildItem Env:``Try to be creative and find different commands to produce similar characters.`

---

## Cambio de personaje

Existen otras técnicas para producir los caracteres requeridos sin usarlos, como . Por ejemplo, el siguiente comando de Linux desplaza el carácter por el que pasamos. Entonces, todo lo que tenemos que hacer es encontrar el carácter en la tabla ASCII que está justo antes de nuestro carácter necesario (podemos obtenerlo con ), luego agregarlo en lugar de en el siguiente ejemplo. De esta forma, el último carácter impreso sería el que necesitamos:`shifting characters``1``man ascii``[`

  Omitir otros personajes de la lista negra

```shell-session
zunderrubb@htb[/htb]$ man ascii     # \ is on 92, before it is [ on 91
zunderrubb@htb[/htb]$ echo $(tr '!-}' '"-~'<<<[)

\
```

Podemos usar comandos de PowerShell para lograr el mismo resultado en Windows, aunque pueden ser bastante más largos que los de Linux.