
----------

-----

Un host virtual () es una función que permite alojar varios sitios web en un solo servidor. Esta es una excelente solución si tienes muchos sitios web y no quieres pasar por el largo (y costoso) proceso de configurar un nuevo servidor web para cada uno. Imagínese tener que configurar un servidor web diferente para una versión móvil y otra de escritorio de la misma página. Hay dos formas de configurar hosts virtuales:`vHost`

- `IP`-Alojamiento virtual basado en
- `Name`-Alojamiento virtual basado en

#### Alojamiento virtual basado en IP

Para este tipo, un host puede tener varias interfaces de red. Se pueden configurar varias direcciones IP, o alias de interfaz, en cada interfaz de red de un host. Los servidores o servidores virtuales que se ejecutan en el host pueden enlazarse a una o varias direcciones IP. Esto significa que se pueden direccionar diferentes servidores bajo diferentes direcciones IP en este host. Desde el punto de vista del cliente, los servidores son independientes entre sí.

#### Alojamiento virtual basado en nombres

La distinción para qué dominio se solicitó el servicio se realiza en el nivel de aplicación. Por ejemplo, varios nombres de dominio, como y , pueden hacer referencia a la misma IP. Internamente en el servidor, estos se separan y distinguen mediante diferentes carpetas. Con este ejemplo, en un servidor Linux, el vHost podría apuntar a la carpeta . Para el nombre de la carpeta se adaptaría y podría tener un aspecto similar a .`admin.inlanefreight.htb``backup.inlanefreight.htb``admin.inlanefreight.htb``/var/www/admin``backup.inlanefreight.htb``/var/www/backup`

Durante nuestras actividades de descubrimiento de subdominios, hemos visto algunos subdominios que tienen la misma dirección IP que pueden ser hosts virtuales o, en algunos casos, servidores diferentes que se encuentran detrás de un proxy.

Imaginemos que hemos identificado un servidor web durante una prueba de penetración interna y muestra un sitio web predeterminado mediante el siguiente comando. ¿Hay algún anfitrión virtual presente?`192.168.10.10`

  Anfitriones virtuales

```shell-session
zunderrubb@htb[/htb]$ curl -s http://192.168.10.10

<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

Vamos a realizar una solicitud enviando un dominio previamente identificado durante la recopilación de información en el encabezado. Podemos hacerlo de la siguiente manera:`cURL``HOST`

  Anfitriones virtuales

```shell-session
zunderrubb@htb[/htb]$ curl -s http://192.168.10.10 -H "Host: randomtarget.com"

<html>
    <head>
        <title>Welcome to randomtarget.com!</title>
    </head>
    <body>
        <h1>Success! The randomtarget.com server block is working!</h1>
    </body>
</html>
```

Ahora podemos automatizar esto usando un archivo de diccionario de posibles nombres de vhost (como en Pwnbox) y examinando el encabezado Content-Length para buscar cualquier diferencia.`/opt/useful/SecLists/Discovery/DNS/namelist.txt`

#### Lista de vHosts

  Anfitriones virtuales

```shell-session
app
blog
dev-admin
forum
help
m
my
shop
some
store
support
www
```

#### Fuzzing de vHost

  Anfitriones virtuales

```shell-session
zunderrubb@htb[/htb]$ cat ./vhosts | while read vhost;do echo "\n********\nFUZZING: ${vhost}\n********";curl -s -I http://192.168.10.10 -H "HOST: ${vhost}.randomtarget.com" | grep "Content-Length: ";done


********
FUZZING: app
********
Content-Length: 612

********
FUZZING: blog
********
Content-Length: 612

********
FUZZING: dev-admin
********
Content-Length: 120

********
FUZZING: forum
********
Content-Length: 612

********
FUZZING: help
********
Content-Length: 612

********
FUZZING: m
********
Content-Length: 612

********
FUZZING: my
********
Content-Length: 612

********
FUZZING: shop
********
Content-Length: 612

********
FUZZING: some
********
Content-Length: 195

********
FUZZING: store
********
Content-Length: 612

********
FUZZING: support
********
Content-Length: 612

********
FUZZING: www
********
Content-Length: 185
```

Hemos identificado con éxito un host virtual llamado , al que podemos acceder mediante una solicitud.`dev-admin``cURL`

  Anfitriones virtuales

```shell-session
zunderrubb@htb[/htb]$ curl -s http://192.168.10.10 -H "Host: dev-admin.randomtarget.com"

<!DOCTYPE html>
<html>
<body>

<h1>Randomtarget.com Admin Website</h1>

<p>You shouldn't be here!</p>

</body>
</html>
```

---

## Automatización de la detección de hosts virtuales

Podemos usar este enfoque manual para una pequeña lista de hosts virtuales, pero no será factible si tenemos una lista extensa. Usando [ffuf](https://github.com/ffuf/ffuf), podemos acelerar el proceso y filtrar en función de los parámetros presentes en la respuesta. Vamos a replicar el mismo proceso que hicimos con ffuf, pero primero, veamos algunas de sus opciones.

  Anfitriones virtuales

```shell-session

MATCHER OPTIONS:
  -mc                 Match HTTP status codes, or "all" for everything. (default: 200,204,301,302,307,401,403,405)
  -ml                 Match amount of lines in response
  -mr                 Match regexp
  -ms                 Match HTTP response size
  -mw                 Match amount of words in response

FILTER OPTIONS:
  -fc                 Filter HTTP status codes from response. Comma separated list of codes and ranges
  -fl                 Filter by amount of lines in response. Comma separated list of line counts and ranges
  -fr                 Filter regexp
  -fs                 Filter HTTP response size. Comma separated list of sizes and ranges
  -fw                 Filter by amount of words in response. Comma separated list of word counts and ranges
```

Podemos hacer coincidir o filtrar las respuestas en función de diferentes opciones. El servidor web responde con un sitio web predeterminado y estático cada vez que emitimos un host virtual no válido en el encabezado. Podemos usar la opción de filtrar por tamaño para descartar la respuesta predeterminada ya que siempre tendrá el mismo tamaño.`HOST``-fs`

  Anfitriones virtuales

```shell-session
zunderrubb@htb[/htb]$ ffuf -w ./vhosts -u http://192.168.10.10 -H "HOST: FUZZ.randomtarget.com" -fs 612

        /'___\  /'___\           /'___\
       /\ \__/ /\ \__/  __  __  /\ \__/
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/
         \ \_\   \ \_\  \ \____/  \ \_\
          \/_/    \/_/   \/___/    \/_/

       v1.1.0-git
________________________________________________

 :: Method           : GET
 :: URL              : http://192.168.10.10
 :: Wordlist         : FUZZ: ./vhosts
 :: Header           : Host: FUZZ.randomtarget.com
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 40
 :: Matcher          : Response status: 200,204,301,302,307,401,403,405
 :: Filter           : Response size: 612
________________________________________________

dev-admin               [Status: 200, Size: 120, Words: 7, Lines: 12]
www                     [Status: 200, Size: 185, Words: 41, Lines: 9]
some                    [Status: 200, Size: 195, Words: 41, Lines: 9]
:: Progress: [12/12] :: Job [1/1] :: 0 req/sec :: Duration: [0:00:00] :: Errors: 0 ::
```

Dónde:

- `-w`: Ruta a nuestra lista de palabras
- `-u`: URL que queremos fuzz
- `-H "HOST: FUZZ.randomtarget.com"`: Este es el encabezado, y la palabra se usará como punto de fuzzing.`HOST``FUZZ`
- `-fs 612`: Filtre las respuestas con un tamaño de 612, tamaño de respuesta predeterminado en este caso.