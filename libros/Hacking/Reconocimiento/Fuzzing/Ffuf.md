
Podemos usar [ffuf](https://github.com/ffuf/ffuf) para descubrir archivos y carpetas que no podemos detectar simplemente navegando por el sitio web. Todo lo que tenemos que hacer es iniciar con una lista de nombres de carpetas e indicarle que busque recursivamente a través de ellas.`ffuf`

  Arrastrándose

```shell-session

zunderrubb@htb[/htb]$ ffuf -recursion -recursion-depth 1 -u http://192.168.10.10/FUZZ -w /opt/useful/SecLists/Discovery/Web-Content/raft-small-directories-lowercase.txt

        /'___\  /'___\           /'___\
       /\ \__/ /\ \__/  __  __  /\ \__/
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/
         \ \_\   \ \_\  \ \____/  \ \_\
          \/_/    \/_/   \/___/    \/_/

       v1.1.0-git
________________________________________________

 :: Method           : GET
 :: URL              : http://192.168.10.10/FUZZ
 :: Wordlist         : FUZZ: /opt/useful/SecLists/Discovery/Web-Content/raft-small-directories-lowercase.txt
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 40
 :: Matcher          : Response status: 200,204,301,302,307,401,403,405
________________________________________________

wp-admin                [Status: 301, Size: 317, Words: 20, Lines: 10]
[INFO] Adding a new job to the queue: http://192.168.10.10/wp-admin/FUZZ

wp-includes             [Status: 301, Size: 320, Words: 20, Lines: 10]
[INFO] Adding a new job to the queue: http://192.168.10.10/wp-includes/FUZZ

wp-content              [Status: 301, Size: 319, Words: 20, Lines: 10]
[INFO] Adding a new job to the queue: http://192.168.10.10/wp-content/FUZZ

admin                   [Status: 302, Size: 0, Words: 1, Lines: 1]
login                   [Status: 302, Size: 0, Words: 1, Lines: 1]
feed                    [Status: 301, Size: 0, Words: 1, Lines: 1]
[INFO] Adding a new job to the queue: http://192.168.10.10/feed/FUZZ
...
```

- `-recursion`: Activa el escaneo recursivo.
- `-recursion-depth`: Especifica la profundidad máxima que se va a explorar.
- `-u`: Nuestra URL de destino, y será el punto de inyección.`FUZZ`
- `-w`: Ruta a nuestra lista de palabras.

Podemos ver en la imagen cómo crea nuevos trabajos para cada carpeta detectada. Esta tarea puede requerir muchos recursos para el servidor de destino. Si el sitio web responde más lento de lo habitual, podemos reducir la tasa de solicitudes utilizando el parámetro.`ffuf``-rate`

El módulo [Atacar aplicaciones web con Ffuf](https://academy.hackthebox.com/course/preview/attacking-web-applications-with-ffuf) profundiza mucho más en el uso y muestra muchas de las técnicas que se enseñan en este módulo.`ffuf`

---

## Divulgación de información confidencial

Es típico que el servidor web y la aplicación web manejen los archivos que necesita para funcionar. Sin embargo, es común encontrar archivos de copia de seguridad o sin referencia que pueden tener información o credenciales importantes. La copia de seguridad o los archivos sin referencia se pueden generar mediante la creación de instantáneas, diferentes versiones de un archivo o desde un editor de texto sin el conocimiento del desarrollador web. Hay algunas listas de extensiones comunes que podemos encontrar en los archivos de [SecLists](https://github.com/danielmiessler/SecLists/tree/master/Discovery/Web-Content).`raft-[ small | medium | large ]-extensions.txt`

Combinaremos algunas de las carpetas que hemos encontrado antes, una lista de extensiones comunes y algunas palabras extraídas del sitio web para ver si podemos encontrar algo que no debería estar allí. El primer paso será crear un archivo con los siguientes nombres de carpeta y guardarlo como .`folders.txt`

  Arrastrándose

```shell-session
wp-admin
wp-content
wp-includes
```

A continuación, extraeremos algunas palabras clave del sitio web utilizando [CeWL](https://github.com/digininja/CeWL). Le indicaremos a la herramienta que extraiga palabras con una longitud mínima de 5 caracteres, las convierta a minúsculas y las guarde en un archivo llamado wordlist.txt :`-m5``--lowercase``-w <FILE>`

  Arrastrándose

```shell-session
zunderrubb@htb[/htb]$ cewl -m5 --lowercase -w wordlist.txt http://192.168.10.10
```

El siguiente paso será combinar todo en ffuf para ver si podemos encontrar alguna información jugosa. Para ello, utilizaremos los siguientes parámetros en:`ffuf`

- `-w`: Separamos las listas de palabras por coma y les añadimos un alias para inyectarlas como puntos de fuzzing más tarde
- `-u`: Nuestra URL de destino con los puntos de fuzzing.

  Arrastrándose

```shell-session
zunderrubb@htb[/htb]$ ffuf -w ./folders.txt:FOLDERS,./wordlist.txt:WORDLIST,./extensions.txt:EXTENSIONS -u http://192.168.10.10/FOLDERS/WORDLISTEXTENSIONS

        /'___\  /'___\           /'___\
       /\ \__/ /\ \__/  __  __  /\ \__/
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/
         \ \_\   \ \_\  \ \____/  \ \_\
          \/_/    \/_/   \/___/    \/_/

       v1.1.0-git
________________________________________________

 :: Method           : GET
 :: URL              : http://192.168.10.10/FOLDERS/WORDLISTEXTENSIONS
 :: Wordlist         : FOLDERS: ./folders.txt
 :: Wordlist         : WORDLIST: ./wordlist.txt
 :: Wordlist         : EXTENSIONS: ./extensions.txt
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 40
 :: Matcher          : Response status: 200,204,301,302,307,401,403,405
________________________________________________

[Status: 200, Size: 8, Words: 1, Lines: 2]
    * EXTENSIONS: ~
    * FOLDERS: wp-content
    * WORDLIST: secret

[Status: 200, Size: 0, Words: 1, Lines: 1]
    * FOLDERS: wp-includes
    * WORDLIST: comment
    * EXTENSIONS: .php

[Status: 302, Size: 0, Words: 1, Lines: 1]
    * FOLDERS: wp-admin
    * WORDLIST: comment
    * EXTENSIONS: .php

...
```

  Arrastrándose

```shell-session
zunderrubb@htb[/htb]$ curl http://192.168.10.10/wp-content/secret~

Oooops!
```

Siguiendo este enfoque, hemos encontrado con éxito un archivo secreto.




| **Command**                                                                                                                                                     | **Description**          |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `ffuf -h`                                                                                                                                                       | ffuf help                |
| `ffuf -w wordlist.txt:FUZZ -u http://SERVER_IP:PORT/FUZZ`                                                                                                       | Directory Fuzzing        |
| `ffuf -w wordlist.txt:FUZZ -u http://SERVER_IP:PORT/indexFUZZ`                                                                                                  | Extension Fuzzing        |
| `ffuf -w wordlist.txt:FUZZ -u http://SERVER_IP:PORT/blog/FUZZ.php`                                                                                              | Page Fuzzing             |
| `ffuf -w wordlist.txt:FUZZ -u http://SERVER_IP:PORT/FUZZ -recursion -recursion-depth 1 -e .php -v`                                                              | Recursive Fuzzing        |
| `ffuf -w wordlist.txt:FUZZ -u https://FUZZ.hackthebox.eu/`                                                                                                      | Sub-domain Fuzzing       |
| `ffuf -w wordlist.txt:FUZZ -u http://academy.htb:PORT/ -H 'Host: FUZZ.academy.htb' -fs xxx`                                                                     | VHost Fuzzing            |
| `ffuf -w wordlist.txt:FUZZ -u http://admin.academy.htb:PORT/admin/admin.php?FUZZ=key -fs xxx`                                                                   | Parameter Fuzzing - GET  |
| `ffuf -w wordlist.txt:FUZZ -u http://admin.academy.htb:PORT/admin/admin.php -X POST -d 'FUZZ=key' -H 'Content-Type: application/x-www-form-urlencoded' -fs xxx` | Parameter Fuzzing - POST |
| `ffuf -w ids.txt:FUZZ -u http://admin.academy.htb:PORT/admin/admin.php -X POST -d 'id=FUZZ' -H 'Content-Type: application/x-www-form-urlencoded' -fs xxx`       | Value Fuzzing            |

# Wordlists

|**Command**|**Description**|
|---|---|
|`/opt/useful/SecLists/Discovery/Web-Content/directory-list-2.3-small.txt`|Directory/Page Wordlist|
|`/opt/useful/SecLists/Discovery/Web-Content/web-extensions.txt`|Extensions Wordlist|
|`/opt/useful/SecLists/Discovery/DNS/subdomains-top1million-5000.txt`|Domain Wordlist|
|`/opt/useful/SecLists/Discovery/Web-Content/burp-parameter-names.txt`|Parameters Wordlist|

# Misc

|**Command**|**Description**|
|---|---|
|`sudo sh -c 'echo "SERVER_IP academy.htb" >> /etc/hosts'`|Add DNS entry|
|`for i in $(seq 1 1000); do echo $i >> ids.txt; done`|Create Sequence Wordlist|
|`curl http://admin.academy.htb:PORT/admin/admin.php -X POST -d 'id=key' -H 'Content-Type: application/x-www-form-urlencoded'`|curl w/ POST|