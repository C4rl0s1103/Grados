-----
#bash #linux 

------

- Podemos crear un grupo con el comando -> `sudo addgroup name` 

- Podemos visualizar todos los grupos con el comando -> `getent group`

- Podemos añadir un usuario a un grupo con el comando -> `sudo usermod -aG nombreGrupo nombreUsuario`

- Podemos cambiar los permisos de grupo de un archivo con el comando -> 
```bash 
sudo chown usuario:grupoQueQueremosCambiar nombreArchivo
```

- Podemos darle permisos de grupo a un archivo de la siguiente 
forma -> `chmod g+x nombre` , de esta manera le damos permisos de ejecucion

