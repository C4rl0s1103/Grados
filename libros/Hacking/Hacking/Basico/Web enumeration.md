
------
#web #wordpress #gobuster #enumeration

------------

Al realizar el escaneo de servicios, a menudo nos encontraremos con servidores web que se ejecutan en los puertos 80 y 443. Los servidores web alojan aplicaciones web (a veces más de 1) que a menudo proporcionan una superficie de ataque considerable y un objetivo de muy alto valor durante una prueba de penetración. La enumeración web adecuada es fundamental, especialmente cuando una organización no expone muchos servicios o esos servicios están correctamente revisados.

---

## Gobuster

Después de descubrir una aplicación web, siempre vale la pena verificar si podemos descubrir archivos o directorios ocultos en el servidor web que no estén destinados al acceso público. Podemos usar una herramienta como [ffuf](https://github.com/ffuf/ffuf) o [GoBuster](https://github.com/OJ/gobuster) para realizar esta enumeración de directorios. A veces encontraremos funcionalidades ocultas o páginas/directorios que exponen datos sensibles que pueden ser aprovechados para acceder a la aplicación web o incluso a la ejecución remota de código en el propio servidor web.

#### Enumeración de directorios/archivos

GoBuster es una herramienta versátil que permite realizar DNS, vhost y fuerza bruta de directorios. La herramienta tiene funciones adicionales, como la enumeración de buckets públicos de AWS S3. Para los propósitos de este módulo, estamos interesados en los modos de fuerza bruta de directorios (y archivos) especificados con el modificador . Ejecutemos un simple escaneo usando la lista de palabras.`dir``dirb``common.txt`

  Enumeración web

```shell-session
zunderrubb@htb[/htb]$ gobuster dir -u http://10.10.10.121/ -w /usr/share/dirb/wordlists/common.txt

===============================================================
Gobuster v3.0.1
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@_FireFart_)
===============================================================
[+] Url:            http://10.10.10.121/
[+] Threads:        10
[+] Wordlist:       /usr/share/dirb/wordlists/common.txt
[+] Status codes:   200,204,301,302,307,401,403
[+] User Agent:     gobuster/3.0.1
[+] Timeout:        10s
===============================================================
2020/12/11 21:47:25 Starting gobuster
===============================================================
/.hta (Status: 403)
/.htpasswd (Status: 403)
/.htaccess (Status: 403)
/index.php (Status: 200)
/server-status (Status: 403)
/wordpress (Status: 301)
===============================================================
2020/12/11 21:47:46 Finished
===============================================================
```

Un código de estado HTTP revela que la solicitud del recurso se realizó correctamente, mientras que un código de estado HTTP 403 indica que tenemos prohibido acceder al recurso. Un código de estado 301 indica que estamos siendo redirigidos, lo cual no es un caso de error. Vale la pena familiarizarse con los diversos códigos de estado HTTP, que se pueden encontrar [aquí](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes). El módulo de la Academia también cubre los códigos de estado HTTP más en profundidad.`200``Web Requests`

El escaneo se completó con éxito e identifica una instalación de WordPress en . WordPress es el CMS (Content Management System) más utilizado y tiene una enorme superficie de ataque potencial. En este caso, visitar en un navegador revela que WordPress todavía está en modo de configuración, lo que nos permitirá obtener la ejecución remota de código (RCE) en el servidor.`/wordpress``http://10.10.10.121/wordpress`

![phpinfo](https://academy.hackthebox.com/storage/modules/77/wordpress.png)

#### Enumeración de subdominios DNS

También puede haber recursos esenciales alojados en subdominios, como paneles de administración o aplicaciones con funcionalidades adicionales que podrían explotarse. Podemos usarlo para enumerar los subdominios disponibles de un dominio determinado usando la bandera para especificar el modo DNS. En primer lugar, vamos a clonar el [repositorio](https://github.com/danielmiessler/SecLists) de GitHub de SecLists, que contiene muchas listas útiles para el fuzzing y la explotación:`GoBuster``dns`

#### Instalación de SecLists

  Enumeración web

```shell-session
zunderrubb@htb[/htb]$ git clone https://github.com/danielmiessler/SecLists
```

  Enumeración web

```shell-session
zunderrubb@htb[/htb]$ sudo apt install seclists -y
```

A continuación, agregue un servidor DNS como 1.1.1.1 al archivo. Apuntaremos al dominio, el sitio web de una empresa ficticia de transporte y logística.`/etc/resolv.conf``inlanefreight.com`

  Enumeración web

```shell-session
zunderrubb@htb[/htb]$ gobuster dns -d inlanefreight.com -w /usr/share/SecLists/Discovery/DNS/namelist.txt

===============================================================
Gobuster v3.0.1
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@_FireFart_)
===============================================================
[+] Domain:     inlanefreight.com
[+] Threads:    10
[+] Timeout:    1s
[+] Wordlist:   /usr/share/SecLists/Discovery/DNS/namelist.txt
===============================================================
2020/12/17 23:08:55 Starting gobuster
===============================================================
Found: blog.inlanefreight.com
Found: customer.inlanefreight.com
Found: my.inlanefreight.com
Found: ns1.inlanefreight.com
Found: ns2.inlanefreight.com
Found: ns3.inlanefreight.com
===============================================================
2020/12/17 23:10:34 Finished
===============================================================
```

Este escaneo revela varios subdominios interesantes que podríamos examinar más a fondo. El módulo [Atacar aplicaciones web con Ffuf](https://academy.hackthebox.com/module/details/54) entra en más detalles sobre la enumeración web y el fuzzing.

---

## Sugerencias de enumeración web

Repasemos algunos consejos adicionales de enumeración web que ayudarán a completar máquinas en HTB y en el mundo real.

#### Captura de banners / Encabezados de servidor web

En la última sección, discutimos el acaparamiento de pancartas con fines generales. Los encabezados de servidor web proporcionan una buena imagen de lo que está alojado en un servidor web. Pueden revelar el marco de aplicación específico en uso, las opciones de autenticación y si al servidor le faltan opciones de seguridad esenciales o se ha configurado incorrectamente. Podemos usarlo para recuperar información del encabezado del servidor desde la línea de comandos. es otra adición esencial a nuestro kit de herramientas de pruebas de penetración, y se recomienda familiarizarse con sus muchas opciones.`cURL``cURL`

  Enumeración web

```shell-session
zunderrubb@htb[/htb]$ curl -IL https://www.inlanefreight.com

HTTP/1.1 200 OK
Date: Fri, 18 Dec 2020 22:24:05 GMT
Server: Apache/2.4.29 (Ubuntu)
Link: <https://www.inlanefreight.com/index.php/wp-json/>; rel="https://api.w.org/"
Link: <https://www.inlanefreight.com/>; rel=shortlink
Content-Type: text/html; charset=UTF-8
```

Otra herramienta útil es [EyeWitness](https://github.com/FortyNorthSecurity/EyeWitness), que se puede utilizar para tomar capturas de pantalla de las aplicaciones web de destino, tomarles las huellas dactilares e identificar posibles credenciales predeterminadas.

#### Whatweb

Podemos extraer la versión de los servidores web, los marcos de soporte y las aplicaciones utilizando la herramienta de línea de comandos. Esta información puede ayudarnos a identificar las tecnologías en uso y comenzar a buscar posibles vulnerabilidades.`whatweb`

  Enumeración web

```shell-session
zunderrubb@htb[/htb]$ whatweb 10.10.10.121

http://10.10.10.121 [200 OK] Apache[2.4.41], Country[RESERVED][ZZ], Email[license@php.net], HTTPServer[Ubuntu Linux][Apache/2.4.41 (Ubuntu)], IP[10.10.10.121], Title[PHP 7.4.3 - phpinfo()]
```

`Whatweb` es una herramienta útil y contiene muchas funciones para automatizar la enumeración de aplicaciones web en una red.

  Enumeración web

```shell-session
zunderrubb@htb[/htb]$ whatweb --no-errors 10.10.10.0/24

http://10.10.10.11 [200 OK] Country[RESERVED][ZZ], HTTPServer[nginx/1.14.1], IP[10.10.10.11], PoweredBy[Red,nginx], Title[Test Page for the Nginx HTTP Server on Red Hat Enterprise Linux], nginx[1.14.1]
http://10.10.10.100 [200 OK] Apache[2.4.41], Country[RESERVED][ZZ], HTTPServer[Ubuntu Linux][Apache/2.4.41 (Ubuntu)], IP[10.10.10.100], Title[File Sharing Service]
http://10.10.10.121 [200 OK] Apache[2.4.41], Country[RESERVED][ZZ], Email[license@php.net], HTTPServer[Ubuntu Linux][Apache/2.4.41 (Ubuntu)], IP[10.10.10.121], Title[PHP 7.4.3 - phpinfo()]
http://10.10.10.247 [200 OK] Bootstrap, Country[RESERVED][ZZ], Email[contact@cross-fit.htb], Frame, HTML5, HTTPServer[OpenBSD httpd], IP[10.10.10.247], JQuery[3.3.1], PHP[7.4.12], Script, Title[Fine Wines], X-Powered-By[PHP/7.4.12], X-UA-Compatible[ie=edge]
```

#### Certificados

Los certificados SSL/TLS son otra fuente de información potencialmente valiosa si se utiliza HTTPS. Al navegar y ver el certificado, se revelan los detalles a continuación, incluida la dirección de correo electrónico y el nombre de la empresa. Estos podrían usarse para llevar a cabo un ataque de phishing si esto está dentro del alcance de una evaluación.`https://10.10.10.121/`

![phpinfo](https://academy.hackthebox.com/storage/modules/77/cert.png)

#### Robots.txt

Es común que los sitios web contengan un archivo, cuyo propósito es indicar a los rastreadores web de los motores de búsqueda, como Googlebot, a qué recursos se puede y no se puede acceder para la indexación. El archivo puede proporcionar información valiosa, como la ubicación de los archivos privados y las páginas de administración. En este caso, vemos que el archivo contiene dos entradas no permitidas.`robots.txt``robots.txt``robots.txt`

![phpinfo](https://academy.hackthebox.com/storage/modules/77/robots.png)

Al navegar a través de un navegador, se muestra una página de inicio de sesión de administrador de HTB.`http://10.10.10.121/private`

![phpinfo](https://academy.hackthebox.com/storage/modules/77/academy.png)

#### Código fuente

También vale la pena verificar el código fuente de cualquier página web que encontremos. Podemos presionar para que aparezca la ventana de código fuente en un navegador. En este ejemplo se muestra un comentario de desarrollador que contiene credenciales para una cuenta de prueba, que podría usarse para iniciar sesión en el sitio web.`[CTRL + U]`

![phpinfo](https://academy.hackthebox.com/storage/modules/77/source.png)