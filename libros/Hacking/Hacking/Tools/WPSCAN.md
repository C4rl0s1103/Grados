-----------------------------
- Tags #Reconocimiento  #herramientas #Puertos #FuerzaBruta 
------------------------------
La herramienta **wpscan**[^1] es comúnmente utilizada para enumerar paginas webs que dispongan de gestión de contenido [[WordPress]] 

Su modo de uso es muy sencillo podríamos realizar un escaneo a modo de prueba ejecutando el siguiente comando de bash
``` bash
wpscan --url http://dominio.com
```

Si quisiéramos enumerar usuarios validos potenciales existentes detrás de este gestor de contenidos podríamos ejecutar el siguiente escaneo alternativo
``` bash
wpscan --url http://dominio.com --enumerate u
```

Otra de las utilidades de esta herramienta es que es capaz de aplicar fuerza bruta para descubrir credenciales validas en los paneles de autenticación 

``` bash
wpscan --url https://dominio.com -U ruben --passwords /usr/share/wordlist/rockyou.txt

```

Cabe destacar que este procedimiento también se puede realizar de manera manual[^2] abusando del archivo *xmlrcp.php*   ,siendo necesario para ello crear un script en bash o en python
![[Pasted image 20240404124257.png]]
hacer un escaneo de los pluguiins de wordpress

------------------
## Referencias
[^1]: Enlace al proyecto en gitHub [enlace](https://github.com/wpscanteam/wpscan)
[^2]: Procedmiento manual abusando del XMLRCCP [[XMLRCP]]
