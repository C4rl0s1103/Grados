---------

-----------
## VirusTotal

VirusTotal mantiene su servicio de replicación de DNS, que se desarrolla preservando las resoluciones de DNS realizadas cuando los usuarios visitan las URL proporcionadas por ellos. Para recibir información sobre un dominio, escriba el nombre de dominio en la barra de búsqueda y haga clic en la pestaña "Relaciones".

![imagen](https://academy.hackthebox.com/storage/modules/144/virustotal.png)

---

## Certificados

Otra fuente de información interesante que podemos utilizar para extraer subdominios son los certificados SSL/TLS. La razón principal es Certificate Transparency (CT), un proyecto que requiere que todos los certificados SSL/TLS emitidos por una Autoridad de Certificación (CA) se publiquen en un registro de acceso público.

Aprenderemos a examinar los registros de CT para descubrir nombres de dominio y subdominios adicionales para una organización de destino utilizando dos recursos principales:

- [https://censys.io](https://censys.io/)
    
- [https://crt.sh](https://crt.sh/)
    

Podemos navegar a https://search.censys.io/certificates o https://crt.sh e introducir el nombre de dominio de nuestra organización objetivo para empezar a descubrir nuevos subdominios.

![imagen](https://academy.hackthebox.com/storage/modules/144/censys_facebook.png)

   

![](https://academy.hackthebox.com/storage/modules/144/crt_facebook.png)

Aunque el sitio web es excelente, nos gustaría tener esta información organizada y poder combinarla con otras fuentes encontradas a lo largo del proceso de recopilación de información. Permítanos realizar una solicitud curl al sitio web de destino solicitando una salida JSON, ya que esto es más manejable para nosotros de procesar. Podemos hacer esto a través de los siguientes comandos:

#### Transparencia de certificados

  Enumeración pasiva de subdominios

```shell-session
zunderrubb@htb[/htb]$ export TARGET="facebook.com"
zunderrubb@htb[/htb]$ curl -s "https://crt.sh/?q=${TARGET}&output=json" | jq -r '.[] | "\(.name_value)\n\(.common_name)"' | sort -u > "${TARGET}_crt.sh.txt"
```

  Enumeración pasiva de subdominios

```shell-session
zunderrubb@htb[/htb]$ head -n20 facebook.com_crt.sh.txt

*.adtools.facebook.com
*.ak.facebook.com
*.ak.fbcdn.net
*.alpha.facebook.com
*.assistant.facebook.com
*.beta.facebook.com
*.channel.facebook.com
*.cinyour.facebook.com
*.cinyourrc.facebook.com
*.connect.facebook.com
*.cstools.facebook.com
*.ctscan.facebook.com
*.dev.facebook.com
*.dns.facebook.com
*.extern.facebook.com
*.extools.facebook.com
*.f--facebook.com
*.facebook.com
*.facebookcorewwwi.onion
*.facebookmail.com
```

|||
|---|---|
|`curl -s`|Emita la solicitud con un resultado mínimo.|
|`https://crt.sh/?q=<DOMAIN>&output=json`|Pregunte por la salida json.|
|`jq -r '.[]' "\(.name_value)\n\(.common_name)"'`|Procese la salida json e imprima el nombre, el valor y el nombre común del certificado, uno por línea.|
|`sort -u`|Ordene alfabéticamente la salida proporcionada y elimine los duplicados.|

También podemos realizar manualmente esta operación contra un objetivo usando OpenSSL a través de:

  Enumeración pasiva de subdominios

```shell-session
zunderrubb@htb[/htb]$ export TARGET="facebook.com"
zunderrubb@htb[/htb]$ export PORT="443"
zunderrubb@htb[/htb]$ openssl s_client -ign_eof 2>/dev/null <<<$'HEAD / HTTP/1.0\r\n\r' -connect "${TARGET}:${PORT}" | openssl x509 -noout -text -in - | grep 'DNS' | sed -e 's|DNS:|\n|g' -e 's|^\*.*||g' | tr -d ',' | sort -u

*.facebook.com
*.facebook.net
*.fbcdn.net
*.fbsbx.com
*.m.facebook.com
*.messenger.com
*.xx.fbcdn.net
*.xy.fbcdn.net
*.xz.fbcdn.net
facebook.com
messenger.com
```

---

## Automatización de la enumeración pasiva de subdominios

Hemos aprendido a adquirir información útil de nuestra organización objetivo, como subdominios, patrones de nomenclatura, TLD alternativos, rangos de IP, etc., utilizando servicios de terceros sin interactuar directamente con su infraestructura ni depender de herramientas automatizadas. Ahora, aprenderemos a enumerar subdominios utilizando herramientas e información obtenida previamente.

---

#### TheHarvester

[TheHarvester](https://github.com/laramies/theHarvester) es una herramienta fácil de usar pero potente y eficaz para las pruebas de penetración en las primeras etapas y los compromisos del equipo rojo. Podemos usarlo para recopilar información que ayude a identificar la superficie de ataque de una empresa. La herramienta recopila , , , y de varias fuentes de datos públicos para la recopilación pasiva de información. Por ahora, usaremos los siguientes módulos:`emails``names``subdomains``IP addresses``URLs`

|||
|---|---|
|[Baidu](http://www.baidu.com/)|Motor de búsqueda Baidu.|
|`Bufferoverun`|Utiliza datos del Proyecto Sonar de Rapid7 - [www.rapid7.com/research/project-sonar/](http://www.rapid7.com/research/project-sonar/)|
|[Crtsh](https://crt.sh/)|Búsqueda de certificados de Comodo.|
|[Objetivo de piratas informáticos](https://hackertarget.com/)|Escáneres de vulnerabilidades en línea e inteligencia de red para ayudar a las organizaciones.|
|`Otx`|Intercambio de amenazas abierto de AlienVault - [https://otx.alienvault.com](https://otx.alienvault.com/)|
|[Rapiddns](https://rapiddns.io/)|Herramienta de consulta de DNS, que facilita la consulta de subdominios o sitios que utilizan la misma IP.|
|[Sublist3r](https://github.com/aboul3la/Sublist3r)|Herramienta rápida de enumeración de subdominios para probadores de penetración|
|[Amenaza](http://www.threatcrowd.org/)|Inteligencia de amenazas de código abierto.|
|[Minero de amenazas](https://www.threatminer.org/)|Minería de datos para inteligencia de amenazas.|
|`Trello`|Buscar tableros de Trello (utiliza la búsqueda de Google)|
|[Urlscan](https://urlscan.io/)|Un espacio aislado para la web que es un escáner de URL y sitios web.|
|`Vhost`|Búsqueda de hosts virtuales de Bing.|
|[Virustotal](https://www.virustotal.com/gui/home/search)|Búsqueda de dominios.|
|[Ojo de zoom](https://www.zoomeye.org/)|Una versión china de Shodan.|

Para automatizar esto, crearemos un archivo llamado sources.txt con los siguientes contenidos.

  Enumeración pasiva de subdominios

```shell-session
zunderrubb@htb[/htb]$ cat sources.txt

baidu
bufferoverun
crtsh
hackertarget
otx
projectdiscovery
rapiddns
sublist3r
threatcrowd
trello
urlscan
vhost
virustotal
zoomeye
```

Una vez creado el archivo, ejecutaremos los siguientes comandos para recopilar información de estas fuentes.

  Enumeración pasiva de subdominios

```shell-session
zunderrubb@htb[/htb]$ export TARGET="facebook.com"
zunderrubb@htb[/htb]$ cat sources.txt | while read source; do theHarvester -d "${TARGET}" -b $source -f "${source}_${TARGET}";done

<SNIP>
*******************************************************************
*  _   _                                            _             *
* | |_| |__   ___    /\  /\__ _ _ ____   _____  ___| |_ ___ _ __  *
* | __|  _ \ / _ \  / /_/ / _` | '__\ \ / / _ \/ __| __/ _ \ '__| *
* | |_| | | |  __/ / __  / (_| | |   \ V /  __/\__ \ ||  __/ |    *
*  \__|_| |_|\___| \/ /_/ \__,_|_|    \_/ \___||___/\__\___|_|    *
*                                                                 *
* theHarvester 4.0.0                                              *
* Coded by Christian Martorella                                   *
* Edge-Security Research                                          *
* cmartorella@edge-security.com                                   *
*                                                                 *
*******************************************************************


[*] Target: facebook.com

[*] Searching Urlscan.

[*] ASNS found: 29
--------------------
AS12578
AS13335
AS13535
AS136023
AS14061
AS14618
AS15169
AS15817

<SNIP>
```

Cuando finalice el proceso, podemos extraer todos los subdominios encontrados y ordenarlos mediante el siguiente comando:

  Enumeración pasiva de subdominios

```shell-session
zunderrubb@htb[/htb]$ cat *.json | jq -r '.hosts[]' 2>/dev/null | cut -d':' -f 1 | sort -u > "${TARGET}_theHarvester.txt"
```

Ahora podemos fusionar todos los archivos de reconocimiento pasivo a través de:

  Enumeración pasiva de subdominios

```shell-session
zunderrubb@htb[/htb]$ cat facebook.com_*.txt | sort -u > facebook.com_subdomains_passive.txt
zunderrubb@htb[/htb]$ cat facebook.com_subdomains_passive.txt | wc -l

11947
```

Hasta ahora, hemos logrado encontrar 11947 subdominios que fusionan los archivos de resultados de reconocimiento pasivo. Es importante tener en cuenta aquí que hay muchos más métodos para encontrar subdominios de forma pasiva. Se muestran más posibilidades, por ejemplo, en el módulo [OSINT: Corporate Recon](https://academy.hackthebox.com/course/preview/osint-corporate-recon).