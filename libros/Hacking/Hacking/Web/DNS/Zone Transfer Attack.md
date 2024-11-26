
------------
#dns #subdomain #dig #dnsenum

-------------------

`Zone transfer` se refiere a la transferencia de zonas a otro servidor en DNS, que generalmente ocurre a través del puerto TCP 53. Este procedimiento se abrevia (). Dado que una falla de DNS generalmente tiene graves consecuencias para una empresa, el archivo de zona se mantiene casi invariablemente idéntico en varios servidores de nombres. Cuando se realizan cambios, se debe garantizar que todos los servidores tengan los mismos datos. La sincronización entre los servidores implicados se realiza mediante la transferencia de zona. Usando una clave secreta, que hemos visto inicialmente en la configuración predeterminada, los servidores se aseguran de comunicarse con su propio maestro o esclavo. La transferencia de zona implica la mera transferencia de archivos o registros y la detección de discrepancias en los conjuntos de datos de los servidores involucrados.`Asynchronous Full Transfer Zone``AXFR``rndc-key`

Los datos originales de una zona se encuentran en un servidor DNS, que se denomina servidor de nombres para esta zona. Sin embargo, para aumentar la confiabilidad, realizar una distribución de carga simple o proteger el primario de ataques, en la práctica se instalan uno o más servidores adicionales en casi todos los casos, que se denominan servidores de nombres para esta zona. Para algunos (), es obligatorio hacer que los archivos de zona sean accesibles en al menos dos servidores.`primary``secondary``Top-Level Domains``TLDs``Second Level Domains`

Por lo general, las entradas DNS solo se crean, modifican o eliminan en la principal. Esto se puede hacer editando manualmente el archivo de zona correspondiente o automáticamente mediante una actualización dinámica desde una base de datos. Un servidor DNS que sirve como fuente directa para sincronizar un archivo de zona se denomina maestro. Un servidor DNS que obtiene datos de zona de un maestro se denomina esclavo. Un primario es siempre un maestro, mientras que un secundario puede ser tanto un esclavo como un maestro.

El esclavo obtiene el registro de la zona relevante del maestro a ciertos intervalos, el llamado tiempo de actualización, generalmente una hora, y compara los números de serie. Si el número de serie del registro SOA del maestro es mayor que el del esclavo, los conjuntos de datos ya no coinciden.`SOA`

#### DIG - Transferencia de zona AXFR

  DNS

```shell-session
zunderrubb@htb[/htb]$ dig axfr inlanefreight.htb @10.129.14.128

; <<>> DiG 9.16.1-Ubuntu <<>> axfr inlanefreight.htb @10.129.14.128
;; global options: +cmd
inlanefreight.htb.      604800  IN      SOA     inlanefreight.htb. root.inlanefreight.htb. 2 604800 86400 2419200 604800
inlanefreight.htb.      604800  IN      TXT     "MS=ms97310371"
inlanefreight.htb.      604800  IN      TXT     "atlassian-domain-verification=t1rKCy68JFszSdCKVpw64A1QksWdXuYFUeSXKU"
inlanefreight.htb.      604800  IN      TXT     "v=spf1 include:mailgun.org include:_spf.google.com include:spf.protection.outlook.com include:_spf.atlassian.net ip4:10.129.124.8 ip4:10.129.127.2 ip4:10.129.42.106 ~all"
inlanefreight.htb.      604800  IN      NS      ns.inlanefreight.htb.
app.inlanefreight.htb.  604800  IN      A       10.129.18.15
internal.inlanefreight.htb. 604800 IN   A       10.129.1.6
mail1.inlanefreight.htb. 604800 IN      A       10.129.18.201
ns.inlanefreight.htb.   604800  IN      A       10.129.34.136
inlanefreight.htb.      604800  IN      SOA     inlanefreight.htb. root.inlanefreight.htb. 2 604800 86400 2419200 604800
;; Query time: 4 msec
;; SERVER: 10.129.14.128#53(10.129.14.128)
;; WHEN: So Sep 19 18:51:19 CEST 2021
;; XFR size: 9 records (messages 1, bytes 520)
```

Si el administrador usara una subred para la opción con fines de prueba o como solución alternativa, o la estableciera en , todos consultarían todo el archivo de zona en el servidor DNS. Además, se pueden consultar otras zonas, que incluso pueden mostrar direcciones IP y nombres de host internos.`allow-transfer``any`

#### DIG - Transferencia de zona AXFR - Interno

  DNS

```shell-session
zunderrubb@htb[/htb]$ dig axfr internal.inlanefreight.htb @10.129.14.128

; <<>> DiG 9.16.1-Ubuntu <<>> axfr internal.inlanefreight.htb @10.129.14.128
;; global options: +cmd
internal.inlanefreight.htb. 604800 IN   SOA     inlanefreight.htb. root.inlanefreight.htb. 2 604800 86400 2419200 604800
internal.inlanefreight.htb. 604800 IN   TXT     "MS=ms97310371"
internal.inlanefreight.htb. 604800 IN   TXT     "atlassian-domain-verification=t1rKCy68JFszSdCKVpw64A1QksWdXuYFUeSXKU"
internal.inlanefreight.htb. 604800 IN   TXT     "v=spf1 include:mailgun.org include:_spf.google.com include:spf.protection.outlook.com include:_spf.atlassian.net ip4:10.129.124.8 ip4:10.129.127.2 ip4:10.129.42.106 ~all"
internal.inlanefreight.htb. 604800 IN   NS      ns.inlanefreight.htb.
dc1.internal.inlanefreight.htb. 604800 IN A     10.129.34.16
dc2.internal.inlanefreight.htb. 604800 IN A     10.129.34.11
mail1.internal.inlanefreight.htb. 604800 IN A   10.129.18.200
ns.internal.inlanefreight.htb. 604800 IN A      10.129.34.136
vpn.internal.inlanefreight.htb. 604800 IN A     10.129.1.6
ws1.internal.inlanefreight.htb. 604800 IN A     10.129.1.34
ws2.internal.inlanefreight.htb. 604800 IN A     10.129.1.35
wsus.internal.inlanefreight.htb. 604800 IN A    10.129.18.2
internal.inlanefreight.htb. 604800 IN   SOA     inlanefreight.htb. root.inlanefreight.htb. 2 604800 86400 2419200 604800
;; Query time: 0 msec
;; SERVER: 10.129.14.128#53(10.129.14.128)
;; WHEN: So Sep 19 18:53:11 CEST 2021
;; XFR size: 15 records (messages 1, bytes 664)
```

Los registros individuales con los nombres de host también se pueden averiguar con la ayuda de un ataque de fuerza bruta. Para hacer esto, necesitamos una lista de posibles nombres de host, que usamos para enviar las solicitudes en orden. Estas listas son proporcionadas, por ejemplo, por [SecLists](https://github.com/danielmiessler/SecLists/blob/master/Discovery/DNS/subdomains-top1million-5000.txt).`A`

Una opción sería ejecutar un en Bash que enumere estas entradas y envíe la consulta correspondiente al servidor DNS deseado.`for-loop`

#### Fuerza bruta de subdominios

  DNS

```shell-session
zunderrubb@htb[/htb]$ for sub in $(cat /opt/useful/SecLists/Discovery/DNS/subdomains-top1million-110000.txt);do dig $sub.inlanefreight.htb @10.129.14.128 | grep -v ';\|SOA' | sed -r '/^\s*$/d' | grep $sub | tee -a subdomains.txt;done

ns.inlanefreight.htb.   604800  IN      A       10.129.34.136
mail1.inlanefreight.htb. 604800 IN      A       10.129.18.201
app.inlanefreight.htb.  604800  IN      A       10.129.18.15
```

Para ello se pueden utilizar muchas herramientas diferentes, y la mayoría de ellas funcionan de la misma manera. Una de estas herramientas es, por ejemplo, [DNSenum](https://github.com/fwaeytens/dnsenum).

  DNS

```shell-session
zunderrubb@htb[/htb]$ dnsenum --dnsserver 10.129.14.128 --enum -p 0 -s 0 -o subdomains.txt -f /opt/useful/SecLists/Discovery/DNS/subdomains-top1million-110000.txt inlanefreight.htb

dnsenum VERSION:1.2.6

-----   inlanefreight.htb   -----


Host's addresses:
__________________



Name Servers:
______________

ns.inlanefreight.htb.                    604800   IN    A        10.129.34.136


Mail (MX) Servers:
___________________



Trying Zone Transfers and getting Bind Versions:
_________________________________________________

unresolvable name: ns.inlanefreight.htb at /usr/bin/dnsenum line 900 thread 1.

Trying Zone Transfer for inlanefreight.htb on ns.inlanefreight.htb ...
AXFR record query failed: no nameservers


Brute forcing with /home/cry0l1t3/Pentesting/SecLists/Discovery/DNS/subdomains-top1million-110000.txt:
_______________________________________________________________________________________________________

ns.inlanefreight.htb.                    604800   IN    A        10.129.34.136
mail1.inlanefreight.htb.                 604800   IN    A        10.129.18.201
app.inlanefreight.htb.                   604800   IN    A        10.129.18.15
ns.inlanefreight.htb.                    604800   IN    A        10.129.34.136

...SNIP...
done.
```

