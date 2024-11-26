----------
#linux #smb #windows #tool 

--------

  SMB

```shell-session
zunderrubb@htb[/htb]$ rpcclient -U "" 10.129.14.128

Enter WORKGROUP\'s password:
rpcclient $> 
```

Nos ofrece muchas peticiones diferentes con las que podemos ejecutar funciones específicas en el servidor SMB para obtener información. Se puede encontrar una lista completa de todas estas funciones en la [página de manual](https://www.samba.org/samba/docs/current/man-html/rpcclient.1.html) de rpcclient.`rpcclient`

|**Consulta**|**Descripción**|
|---|---|
|`srvinfo`|Información del servidor.|
|`enumdomains`|Enumere todos los dominios que se implementan en la red.|
|`querydominfo`|Proporciona información de dominio, servidor y usuario de los dominios implementados.|
|`netshareenumall`|Enumera todos los recursos compartidos disponibles.|
|`netsharegetinfo <share>`|Proporciona información sobre un recurso compartido específico.|
|`enumdomusers`|Enumera todos los usuarios del dominio.|
|`queryuser <RID>`|Proporciona información sobre un usuario específico.|

#### RPCclient: enumeración

  SMB

```shell-session
rpcclient $> srvinfo

        DEVSMB         Wk Sv PrQ Unx NT SNT DEVSM
        platform_id     :       500
        os version      :       6.1
        server type     :       0x809a03
		
		
rpcclient $> enumdomains

name:[DEVSMB] idx:[0x0]
name:[Builtin] idx:[0x1]


rpcclient $> querydominfo

Domain:         DEVOPS
Server:         DEVSMB
Comment:        DEVSM
Total Users:    2
Total Groups:   0
Total Aliases:  0
Sequence No:    1632361158
Force Logoff:   -1
Domain Server State:    0x1
Server Role:    ROLE_DOMAIN_PDC
Unknown 3:      0x1


rpcclient $> netshareenumall

netname: print$
        remark: Printer Drivers
        path:   C:\var\lib\samba\printers
        password:
netname: home
        remark: INFREIGHT Samba
        path:   C:\home\
        password:
netname: dev
        remark: DEVenv
        path:   C:\home\sambauser\dev\
        password:
netname: notes
        remark: CheckIT
        path:   C:\mnt\notes\
        password:
netname: IPC$
        remark: IPC Service (DEVSM)
        path:   C:\tmp
        password:
		
		
rpcclient $> netsharegetinfo notes

netname: notes
        remark: CheckIT
        path:   C:\mnt\notes\
        password:
        type:   0x0
        perms:  0
        max_uses:       -1
        num_uses:       1
revision: 1
type: 0x8004: SEC_DESC_DACL_PRESENT SEC_DESC_SELF_RELATIVE 
DACL
        ACL     Num ACEs:       1       revision:       2
        ---
        ACE
                type: ACCESS ALLOWED (0) flags: 0x00 
                Specific bits: 0x1ff
                Permissions: 0x101f01ff: Generic all access SYNCHRONIZE_ACCESS WRITE_OWNER_ACCESS WRITE_DAC_ACCESS READ_CONTROL_ACCESS DELETE_ACCESS 
                SID: S-1-1-0
```

Estos ejemplos nos muestran qué información se puede filtrar a usuarios anónimos. Una vez que un usuario tiene acceso a un servicio de red, solo se necesita un error para otorgarle demasiados permisos o demasiada visibilidad para poner a toda la red en un riesgo significativo.`anonymous`

Y lo que es más importante, el acceso anónimo a estos servicios también puede llevar al descubrimiento de otros usuarios, que pueden ser atacados con fuerza bruta en el caso más agresivo. Los humanos son más propensos a los errores que los procesos informáticos configurados correctamente, y la falta de conciencia de seguridad y la pereza a menudo conducen a contraseñas débiles que se pueden descifrar fácilmente. Veamos cómo podemos enumerar a los usuarios usando el archivo .`rpcclient`

#### Rpcclient - Enumeración de usuarios

  SMB

```shell-session
rpcclient $> enumdomusers

user:[mrb3n] rid:[0x3e8]
user:[cry0l1t3] rid:[0x3e9]


rpcclient $> queryuser 0x3e9

        User Name   :   cry0l1t3
        Full Name   :   cry0l1t3
        Home Drive  :   \\devsmb\cry0l1t3
        Dir Drive   :
        Profile Path:   \\devsmb\cry0l1t3\profile
        Logon Script:
        Description :
        Workstations:
        Comment     :
        Remote Dial :
        Logon Time               :      Do, 01 Jan 1970 01:00:00 CET
        Logoff Time              :      Mi, 06 Feb 2036 16:06:39 CET
        Kickoff Time             :      Mi, 06 Feb 2036 16:06:39 CET
        Password last set Time   :      Mi, 22 Sep 2021 17:50:56 CEST
        Password can change Time :      Mi, 22 Sep 2021 17:50:56 CEST
        Password must change Time:      Do, 14 Sep 30828 04:48:05 CEST
        unknown_2[0..31]...
        user_rid :      0x3e9
        group_rid:      0x201
        acb_info :      0x00000014
        fields_present: 0x00ffffff
        logon_divs:     168
        bad_password_count:     0x00000000
        logon_count:    0x00000000
        padding1[0..7]...
        logon_hrs[0..21]...


rpcclient $> queryuser 0x3e8

        User Name   :   mrb3n
        Full Name   :
        Home Drive  :   \\devsmb\mrb3n
        Dir Drive   :
        Profile Path:   \\devsmb\mrb3n\profile
        Logon Script:
        Description :
        Workstations:
        Comment     :
        Remote Dial :
        Logon Time               :      Do, 01 Jan 1970 01:00:00 CET
        Logoff Time              :      Mi, 06 Feb 2036 16:06:39 CET
        Kickoff Time             :      Mi, 06 Feb 2036 16:06:39 CET
        Password last set Time   :      Mi, 22 Sep 2021 17:47:59 CEST
        Password can change Time :      Mi, 22 Sep 2021 17:47:59 CEST
        Password must change Time:      Do, 14 Sep 30828 04:48:05 CEST
        unknown_2[0..31]...
        user_rid :      0x3e8
        group_rid:      0x201
        acb_info :      0x00000010
        fields_present: 0x00ffffff
        logon_divs:     168
        bad_password_count:     0x00000000
        logon_count:    0x00000000
        padding1[0..7]...
        logon_hrs[0..21]...
```

A continuación, podemos utilizar los resultados para identificar el RID del grupo, que luego podemos utilizar para recuperar información de todo el grupo.

#### Rpcclient - Información de grupo

  SMB

```shell-session
rpcclient $> querygroup 0x201

        Group Name:     None
        Description:    Ordinary Users
        Group Attribute:7
        Num Members:2
```

Sin embargo, también puede suceder que no todos los comandos estén disponibles para nosotros, y tengamos ciertas restricciones basadas en el usuario. Sin embargo, la consulta se permite principalmente en función del RID. Por lo tanto, podemos usar el rpcclient para forzar los RID para obtener información. Debido a que es posible que no sepamos a quién se le ha asignado qué RID, sabemos que obtendremos información al respecto tan pronto como consultemos un RID asignado. Hay varias formas y herramientas que podemos utilizar para esto. Para quedarnos con la herramienta, podemos crear un using en el que enviamos un comando al servicio usando rpcclient y filtramos los resultados.`queryuser <RID>``For-loop``Bash`

#### RID de usuario por fuerza bruta

  SMB

```shell-session
zunderrubb@htb[/htb]$ for i in $(seq 500 1100);do rpcclient -N -U "" 10.129.14.128 -c "queryuser 0x$(printf '%x\n' $i)" | grep "User Name\|user_rid\|group_rid" && echo "";done

        User Name   :   sambauser
        user_rid :      0x1f5
        group_rid:      0x201
		
        User Name   :   mrb3n
        user_rid :      0x3e8
        group_rid:      0x201
		
        User Name   :   cry0l1t3
        user_rid :      0x3e9
        group_rid:      0x201
```

Una alternativa a esto sería un script de Python de [Impacket](https://github.com/SecureAuthCorp/impacket) llamado [samrdump.py](https://github.com/SecureAuthCorp/impacket/blob/master/examples/samrdump.py).