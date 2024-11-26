
------------
#linux #web #comandos 

----------------


En este módulo, enviaremos solicitudes web a través de dos de las herramientas más importantes para cualquier probador de penetración web, un navegador web, como Chrome o Firefox, y la herramienta de línea de comandos.`cURL`

[cURL](https://curl.haxx.se/) (URL del cliente) es una herramienta de línea de comandos y una biblioteca que admite principalmente HTTP junto con muchos otros protocolos. Esto lo convierte en un buen candidato para scripts, así como para la automatización, por lo que es esencial para enviar varios tipos de solicitudes web desde la línea de comandos, lo cual es necesario para muchos tipos de pruebas de penetración web.

Podemos enviar una solicitud HTTP básica a cualquier URL usándola como argumento para cURL, de la siguiente manera:

  Protocolo de transferencia de hipertexto (HTTP)

```shell-session
zunderrubb@htb[/htb]$ curl inlanefreight.com

<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
...SNIP...
```

Vemos que cURL no renderiza el código HTML/JavaScript/CSS, a diferencia de un navegador web, sino que lo imprime en su formato sin procesar. Sin embargo, como probadores de penetración, nos interesa principalmente el contexto de solicitud y respuesta, que suele ser mucho más rápido y cómodo que un navegador web.

También podemos usar cURL para descargar una página o un archivo y generar el contenido en un archivo usando la bandera. Si queremos especificar el nombre del archivo de salida, podemos usar la bandera y especificar el nombre. De lo contrario, podemos usar y cURL usará el nombre del archivo remoto, de la siguiente manera:`-O``-o``-O`

  Protocolo de transferencia de hipertexto (HTTP)

```shell-session
zunderrubb@htb[/htb]$ curl -O inlanefreight.com/index.html
zunderrubb@htb[/htb]$ ls
index.html
```

Como podemos ver, la salida no se imprimió esta vez, sino que se guardó en . Nos dimos cuenta de que cURL todavía imprimía algún estado mientras procesaba la solicitud. Podemos silenciar el estado con la bandera, de la siguiente manera:`index.html``-s`

  Protocolo de transferencia de hipertexto (HTTP)

```shell-session
zunderrubb@htb[/htb]$ curl -s -O inlanefreight.com/index.html
```

Esta vez, cURL no imprimió nada, ya que la salida se guardó en el archivo. Finalmente, podemos usar la bandera para ver qué otras opciones podemos usar con cURL:`index.html``-h`

  Protocolo de transferencia de hipertexto (HTTP)

```shell-session
zunderrubb@htb[/htb]$ curl -h
Usage: curl [options...] <url>
 -d, --data <data>   HTTP POST data
 -h, --help <category> Get help for commands
 -i, --include       Include protocol response headers in the output
 -o, --output <file> Write to file instead of stdout
 -O, --remote-name   Write output to a file named as the remote file
 -s, --silent        Silent mode
 -u, --user <user:password> Server user and password
 -A, --user-agent <name> Send User-Agent <name> to server
 -v, --verbose       Make the operation more talkative

This is not the full help, this menu is stripped into categories.
Use "--help category" to get an overview of all categories.
Use the user manual `man curl` or the "--help all" flag for all options.
```

Como menciona el mensaje anterior, podemos usarlo para imprimir un menú de ayuda más detallado, o (por ejemplo, ) para imprimir la ayuda detallada de una bandera específica. Si alguna vez necesitamos leer documentación más detallada, podemos usar para ver la página completa del manual de cURL.`--help all``--help category``-h http``man curl`