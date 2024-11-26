--------------
#bash #comandos #linux 

--------

# SORT

- Podemos ordenar una lista de nombres alfabéticamente de la  
	siguiente  -> forma `sort  nombres.txt`
- Podemos ordenar una cadena de numeros de menor a mayor -> `sort -n numeros`
	 Y tambien podemos ordenarlos de mayor a menro -> `sort -n -r numeros` 
	 ![[Pasted image 20240505152732.png]]
	- Podemos tambien borrar numeros que esten repetidos con el parametro 
	 `sort -n -u numeros`


---------------------------------

# Head

- Lo podemos usar para leer las primeras diez líneas de un archivo, podríamos hacerlo de la siguiente forma -> `head archivo.txt`
	- Podríamos llegar a modificar las líneas que queremos leer del archivo usando el siguiente comando -> `head -5 archivo.txt` , esto solo leería las 5 primeras líneas de nuestro archivo y podríamos realizar esto con la cantidad de líneas que queramos leer.
	- Podriamos leer la vez las lineas que queramos de varios archivos al mismo tiempo de la siguiente manera `head -n 2 nombres prueba`
		![[Pasted image 20240505154037.png]]

----------------------------

# Tail

- Es al contrario que head con este comando podemos leer las 10 ultimas lineas de un archivo de la siguiente forma `tail arhivo.txt`
	 - Podriamos hacer lo mismo que con head añadiendo -n `tail -n 2 archivo`
	 - Tambien de varios archivos al mismo tiempo con el comando `tail -n 2 *`


-------------

# WC

- Se utiliza para contar las lineas que tiene un archivo y lo tendriamos que usar de la siguiente manera -> `cat nombres | wc -l `
	- Y para contar letras seria de la siguiente forma -> `cat nombres | wc -w `
	- Podríamos llegar a contar caracteres cat nombres | wc -c 


-------- 

# UNIC

- Se utiliza para borrar los repetidos de un archivo se usaria 
	 de la forma -> `cat nombres | uniq`

------------------

### Lo correcto de estos comandos que estamos viendo seria llegar a juntarlos todos para poder tratar la informacion de una manera mucho mas correcta y precisa, por lo que tenemos que probar mil formas y combinarlos todos