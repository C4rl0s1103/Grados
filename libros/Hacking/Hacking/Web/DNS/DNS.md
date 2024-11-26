
-----------
#dns #subdomain #dig #dnsenum

--------------------



## Nslookup y DIG

Ahora que tenemos una comprensión clara de lo que es DNS, echemos un vistazo a la utilidad de línea de comandos. Supongamos que un cliente nos solicitó realizar una prueba de penetración externa. Por lo tanto, primero debemos familiarizarnos con su infraestructura e identificar qué hosts son de acceso público. Podemos averiguarlo utilizando diferentes tipos de solicitudes de DNS. Con , podemos buscar servidores de nombres de dominio en Internet y pedirles información sobre hosts y dominios. Aunque la herramienta tiene dos modos, interactivo y no interactivo, nos centraremos principalmente en el módulo no interactivo.`Nslookup``Nslookup`

Podemos consultar los registros con solo enviar un nombre de dominio. Pero también podemos usar el parámetro para buscar registros de recursos específicos. Algunos ejemplos son:`A``-query`

#### Consulta: Registros A

  DNS

```shell-session
zunderrubb@htb[/htb]$ export TARGET="facebook.com"
zunderrubb@htb[/htb]$ nslookup $TARGET

Server:		1.1.1.1
Address:	1.1.1.1#53

Non-authoritative answer:
Name:	facebook.com
Address: 31.13.92.36
Name:	facebook.com
Address: 2a03:2880:f11c:8083:face:b00c:0:25de
```

También podemos especificar un servidor de nombres si es necesario agregando al comando. A diferencia de nslookup, nos muestra algo más de información que puede ser de importancia.`@<nameserver/IP>``DIG`

  DNS

```shell-session
zunderrubb@htb[/htb]$ dig facebook.com @1.1.1.1

; <<>> DiG 9.16.1-Ubuntu <<>> facebook.com @1.1.1.1
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 58899
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
;; QUESTION SECTION:
;facebook.com.                  IN      A

;; ANSWER SECTION:
facebook.com.           169     IN      A       31.13.92.36

;; Query time: 20 msec
;; SERVER: 1.1.1.1#53(1.1.1.1)
;; WHEN: Mo Okt 18 16:03:17 CEST 2021
;; MSG SIZE  rcvd: 57
```

La entrada comienza con el nombre de dominio completo, incluido el punto final. La entrada puede mantenerse en la memoria caché durante segundos antes de que se deba volver a solicitar la información. Es comprensible que la clase sea Internet ().`169``IN`

#### Consulta: Registros A para un subdominio

  DNS

```shell-session
zunderrubb@htb[/htb]$ export TARGET=www.facebook.com
zunderrubb@htb[/htb]$ nslookup -query=A $TARGET

Server:		1.1.1.1
Address:	1.1.1.1#53

Non-authoritative answer:
www.facebook.com	canonical name = star-mini.c10r.facebook.com.
Name:	star-mini.c10r.facebook.com
Address: 31.13.92.36
```

  DNS

```shell-session
zunderrubb@htb[/htb]$ dig a www.facebook.com @1.1.1.1

; <<>> DiG 9.16.1-Ubuntu <<>> a www.facebook.com @1.1.1.1
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 15596
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
;; QUESTION SECTION:
;www.facebook.com.              IN      A

;; ANSWER SECTION:
www.facebook.com.       3585    IN      CNAME   star-mini.c10r.facebook.com.
star-mini.c10r.facebook.com. 45 IN      A       31.13.92.36

;; Query time: 16 msec
;; SERVER: 1.1.1.1#53(1.1.1.1)
;; WHEN: Mo Okt 18 16:11:48 CEST 2021
;; MSG SIZE  rcvd: 90
```

#### Querying: PTR Records for an IP Address

  DNS

```shell-session
zunderrubb@htb[/htb]$ nslookup -query=PTR 31.13.92.36

Server:		1.1.1.1
Address:	1.1.1.1#53

Non-authoritative answer:
36.92.13.31.in-addr.arpa	name = edge-star-mini-shv-01-frt3.facebook.com.

Authoritative answers can be found from:
```

  DNS

```shell-session
zunderrubb@htb[/htb]$ dig -x 31.13.92.36 @1.1.1.1

; <<>> DiG 9.16.1-Ubuntu <<>> -x 31.13.92.36 @1.1.1.1
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 51730
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
;; QUESTION SECTION:
;36.92.13.31.in-addr.arpa.      IN      PTR

;; ANSWER SECTION:
36.92.13.31.in-addr.arpa. 1028  IN      PTR     edge-star-mini-shv-01-frt3.facebook.com.

;; Query time: 16 msec
;; SERVER: 1.1.1.1#53(1.1.1.1)
;; WHEN: Mo Okt 18 16:14:20 CEST 2021
;; MSG SIZE  rcvd: 106
```

#### Querying: ANY Existing Records

In this example, we are using Google as an example instead of Facebook as the last one did not respond to our query.

  DNS

```shell-session
zunderrubb@htb[/htb]$ export TARGET="google.com"
zunderrubb@htb[/htb]$ nslookup -query=ANY $TARGET

Server:		10.100.0.1
Address:	10.100.0.1#53

Non-authoritative answer:
Name:	google.com
Address: 172.217.16.142
Name:	google.com
Address: 2a00:1450:4001:808::200e
google.com	text = "docusign=05958488-4752-4ef2-95eb-aa7ba8a3bd0e"
google.com	text = "docusign=1b0a6754-49b1-4db5-8540-d2c12664b289"
google.com	text = "v=spf1 include:_spf.google.com ~all"
google.com	text = "MS=E4A68B9AB2BB9670BCE15412F62916164C0B20BB"
google.com	text = "globalsign-smime-dv=CDYX+XFHUw2wml6/Gb8+59BsH31KzUr6c1l2BPvqKX8="
google.com	text = "apple-domain-verification=30afIBcvSuDV2PLX"
google.com	text = "google-site-verification=wD8N7i1JTNTkezJ49swvWW48f8_9xveREV4oB-0Hf5o"
google.com	text = "facebook-domain-verification=22rm551cu4k0ab0bxsw536tlds4h95"
google.com	text = "google-site-verification=TV9-DBe4R80X4v0M4U_bd_J9cpOJM0nikft0jAgjmsQ"
google.com	nameserver = ns3.google.com.
google.com	nameserver = ns2.google.com.
google.com	nameserver = ns1.google.com.
google.com	nameserver = ns4.google.com.
google.com	mail exchanger = 10 aspmx.l.google.com.
google.com	mail exchanger = 40 alt3.aspmx.l.google.com.
google.com	mail exchanger = 20 alt1.aspmx.l.google.com.
google.com	mail exchanger = 30 alt2.aspmx.l.google.com.
google.com	mail exchanger = 50 alt4.aspmx.l.google.com.
google.com
	origin = ns1.google.com
	mail addr = dns-admin.google.com
	serial = 398195569
	refresh = 900
	retry = 900
	expire = 1800
	minimum = 60
google.com	rdata_257 = 0 issue "pki.goog"

Authoritative answers can be found from:
```

  DNS

```shell-session
zunderrubb@htb[/htb]$ dig any google.com @8.8.8.8

; <<>> DiG 9.16.1-Ubuntu <<>> any google.com @8.8.8.8
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 49154
;; flags: qr rd ra; QUERY: 1, ANSWER: 22, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;google.com.                    IN      ANY

;; ANSWER SECTION:
google.com.             249     IN      A       142.250.184.206
google.com.             249     IN      AAAA    2a00:1450:4001:830::200e
google.com.             549     IN      MX      10 aspmx.l.google.com.
google.com.             3549    IN      TXT     "apple-domain-verification=30afIBcvSuDV2PLX"
google.com.             3549    IN      TXT     "facebook-domain-verification=22rm551cu4k0ab0bxsw536tlds4h95"
google.com.             549     IN      MX      20 alt1.aspmx.l.google.com.
google.com.             3549    IN      TXT     "docusign=1b0a6754-49b1-4db5-8540-d2c12664b289"
google.com.             3549    IN      TXT     "v=spf1 include:_spf.google.com ~all"
google.com.             3549    IN      TXT     "globalsign-smime-dv=CDYX+XFHUw2wml6/Gb8+59BsH31KzUr6c1l2BPvqKX8="
google.com.             3549    IN      TXT     "google-site-verification=wD8N7i1JTNTkezJ49swvWW48f8_9xveREV4oB-0Hf5o"
google.com.             9       IN      SOA     ns1.google.com. dns-admin.google.com. 403730046 900 900 1800 60
google.com.             21549   IN      NS      ns1.google.com.
google.com.             21549   IN      NS      ns3.google.com.
google.com.             549     IN      MX      50 alt4.aspmx.l.google.com.
google.com.             3549    IN      TXT     "docusign=05958488-4752-4ef2-95eb-aa7ba8a3bd0e"
google.com.             549     IN      MX      30 alt2.aspmx.l.google.com.
google.com.             21549   IN      NS      ns2.google.com.
google.com.             21549   IN      NS      ns4.google.com.
google.com.             549     IN      MX      40 alt3.aspmx.l.google.com.
google.com.             3549    IN      TXT     "MS=E4A68B9AB2BB9670BCE15412F62916164C0B20BB"
google.com.             3549    IN      TXT     "google-site-verification=TV9-DBe4R80X4v0M4U_bd_J9cpOJM0nikft0jAgjmsQ"
google.com.             21549   IN      CAA     0 issue "pki.goog"

;; Query time: 16 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Mo Okt 18 16:15:22 CEST 2021
;; MSG SIZE  rcvd: 922
```

The more recent [RFC8482](https://tools.ietf.org/html/rfc8482) specified that DNS requests be abolished. Therefore, we may not receive a response to our request from the DNS server or get a reference to the said RFC8482.`ANY``ANY`

  DNS

```shell-session
zunderrubb@htb[/htb]$ dig any cloudflare.com @8.8.8.8

; <<>> DiG 9.16.1-Ubuntu <<>> any cloudflare.com @8.8.8.8
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 22509
;; flags: qr rd ra ad; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;cloudflare.com.                        IN      ANY

;; ANSWER SECTION:
cloudflare.com.         2747    IN      HINFO   "RFC8482" ""
cloudflare.com.         2747    IN      RRSIG   HINFO 13 2 3789 20211019145905 20211017125905 34505 cloudflare.com. 4/Bq8xUN96SrOhuH0bj2W6s2pXRdv5L5NWsgyTAGLAjEwwEF4y4TQuXo yGtvD3B13jr5KhdXo1VtrLLMy4OR8Q==

;; Query time: 16 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Mo Okt 18 16:16:27 CEST 2021
;; MSG SIZE  rcvd: 174
```

#### Querying: TXT Records

  DNS

```shell-session
zunderrubb@htb[/htb]$ export TARGET="facebook.com"
zunderrubb@htb[/htb]$ nslookup -query=TXT $TARGET

Server:		1.1.1.1
Address:	1.1.1.1#53

Non-authoritative answer:
facebook.com	text = "v=spf1 redirect=_spf.facebook.com"
facebook.com	text = "google-site-verification=A2WZWCNQHrGV_TWwKh6KHY90tY0SHZo_RnyMJoDaG0s"
facebook.com	text = "google-site-verification=wdH5DTJTc9AYNwVunSVFeK0hYDGUIEOGb-RReU6pJlY"

Authoritative answers can be found from:
```

  DNS

```shell-session
zunderrubb@htb[/htb]$ dig txt facebook.com @1.1.1.1

; <<>> DiG 9.16.1-Ubuntu <<>> txt facebook.com @1.1.1.1
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 63771
;; flags: qr rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
;; QUESTION SECTION:
;facebook.com.                  IN      TXT

;; ANSWER SECTION:
facebook.com.           86400   IN      TXT     "v=spf1 redirect=_spf.facebook.com"
facebook.com.           7200    IN      TXT     "google-site-verification=A2WZWCNQHrGV_TWwKh6KHY90tY0SHZo_RnyMJoDaG0s"
facebook.com.           7200    IN      TXT     "google-site-verification=wdH5DTJTc9AYNwVunSVFeK0hYDGUIEOGb-RReU6pJlY"

;; Query time: 24 msec
;; SERVER: 1.1.1.1#53(1.1.1.1)
;; WHEN: Mo Okt 18 16:17:46 CEST 2021
;; MSG SIZE  rcvd: 249
```

#### Consulta: Registros MX

  DNS

```shell-session
zunderrubb@htb[/htb]$ export TARGET="facebook.com"
zunderrubb@htb[/htb]$ nslookup -query=MX $TARGET

Server:		1.1.1.1
Address:	1.1.1.1#53

Non-authoritative answer:
facebook.com	mail exchanger = 10 smtpin.vvv.facebook.com.

Authoritative answers can be found from:
```

  DNS

```shell-session
zunderrubb@htb[/htb]$ dig mx facebook.com @1.1.1.1

; <<>> DiG 9.16.1-Ubuntu <<>> mx facebook.com @1.1.1.1
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 9392
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
;; QUESTION SECTION:
;facebook.com.                  IN      MX

;; ANSWER SECTION:
facebook.com.           3600    IN      MX      10 smtpin.vvv.facebook.com.

;; Query time: 40 msec
;; SERVER: 1.1.1.1#53(1.1.1.1)
;; WHEN: Mo Okt 18 16:18:22 CEST 2021
;; MSG SIZE  rcvd: 68
```

Hasta ahora, hemos reunido , , , y registros con los comandos y. A las organizaciones se les dan direcciones IP en Internet, pero no siempre son sus propietarios. Es posible que confíen en s y proveedores de alojamiento que les alquilan bloques de red más pequeños.`A``NS``MX``CNAME``nslookup``dig``ISP`

Podemos combinar algunos de los resultados recopilados a través de nslookup con la base de datos whois para determinar si nuestra organización objetivo utiliza proveedores de alojamiento. Esta combinación es similar al siguiente ejemplo:

#### Nslookup

  DNS

```shell-session
zunderrubb@htb[/htb]$ export TARGET="facebook.com"
zunderrubb@htb[/htb]$ nslookup $TARGET

Server:		1.1.1.1
Address:	1.1.1.1#53

Non-authoritative answer:
Name:	facebook.com
Address: 157.240.199.35
Name:	facebook.com
Address: 2a03:2880:f15e:83:face:b00c:0:25de
```

#### WHOIS

  DNS

```shell-session
zunderrubb@htb[/htb]$ whois 157.240.199.35

NetRange:       157.240.0.0 - 157.240.255.255
CIDR:           157.240.0.0/16
NetName:        THEFA-3
NetHandle:      NET-157-240-0-0-1
Parent:         NET157 (NET-157-0-0-0-0)
NetType:        Direct Assignment
OriginAS:
Organization:   Facebook, Inc. (THEFA-3)
RegDate:        2015-05-14
Updated:        2015-05-14
Ref:            https://rdap.arin.net/registry/ip/157.240.0.0



OrgName:        Facebook, Inc.
OrgId:          THEFA-3
Address:        1601 Willow Rd.
City:           Menlo Park
StateProv:      CA
PostalCode:     94025
Country:        US
RegDate:        2004-08-11
Updated:        2012-04-17
Ref:            https://rdap.arin.net/registry/entity/THEFA-3


OrgAbuseHandle: OPERA82-ARIN
OrgAbuseName:   Operations
OrgAbusePhone:  +1-650-543-4800
OrgAbuseEmail:  domain@facebook.com
OrgAbuseRef:    https://rdap.arin.net/registry/entity/OPERA82-ARIN

OrgTechHandle: OPERA82-ARIN
OrgTechName:   Operations
OrgTechPhone:  +1-650-543-4800
OrgTechEmail:  domain@facebook.com
OrgTechRef:    https://rdap.arin.net/registry/entity/OPERA82-ARIN
```