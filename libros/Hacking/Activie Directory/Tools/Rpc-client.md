
--------
#activeDirectory #tools #enumeration 

--------

- Podemos ejecutar con un null sesion y ver si nos permite enumerar usuarios o grupos del sistema

- `rpc-client -U '' -N`

- Despues podriamos usar comandos como enumdomusers o enumdomgroups para tratar de enumera.

- Tambien podriamos disponer de una sesion y acceder con las credenciales del sistema 


**Enumeración con rpcclient**

La utilidad de Samba se utiliza para interactuar con **puntos de conexión RPC a través de canalizaciones con nombre**. A continuación, se muestran los comandos que se pueden emitir a las interfaces SAMR, LSARPC y LSARPC-DS después de establecer una **sesión SMB**, lo que a menudo requiere credenciales.`**rpcclient**`


Información del servidor

- **Para obtener información del servidor**: se utiliza el comando.`srvinfo`
    

Enumeración de usuarios

- **Los usuarios se pueden enumerar** mediante: y .`querydispinfo``enumdomusers`
    
- **Datos de un usuario** por: .`queryuser <0xrid>`
    
- **Grupos de un usuario** con: .`queryusergroups <0xrid>`
    
- **El SID de un usuario se recupera** a través de: .`lookupnames <username>`
    
- **Alias de usuarios** por: .`queryuseraliases [builtin|domain] <sid>`
    

Copiar

```
# Users' RIDs-forced
for i in $(seq 500 1100); do
    rpcclient -N -U "" [IP_ADDRESS] -c "queryuser 0x$(printf '%x\n' $i)" | grep "User Name\|user_rid\|group_rid" && echo "";
done

# samrdump.py can also serve this purpose
```


Enumeración de grupos

- **Agrupaciones** por: .`enumdomgroups`
    
- **Detalles de un grupo** con: .`querygroup <0xrid>`
    
- **Los miembros de un grupo** a través de: .`querygroupmem <0xrid>`
    


Enumeración de grupos de alias

- **Alias agrupa por**: .`enumalsgroups <builtin|domain>`
    
- **Miembros de un grupo de alias** con: .`queryaliasmem builtin|domain <0xrid>`
    



Enumeración de dominios

- **Dominios** que usan: .`enumdomains`
    
- **El SID de un dominio se recupera** a través de: .`lsaquery`
    
- **La información del dominio se obtiene** mediante: .`querydominfo`
    



Enumeración de acciones

- **Todas las acciones disponibles** por: .`netshareenumall`
    
- **La información sobre un recurso compartido específico se obtiene** con: .`netsharegetinfo <share>`
    


Operaciones adicionales con SID

- **SID por nombre** mediante: .`lookupnames <username>`
    
- **Más SID** a través de: .`lsaenumsid`
    
- **El ciclo de RID para comprobar más SID se realiza mediante**: .`lookupsids <sid>`