
---------
#docker 

---------


- Creamos una imagen con el comando de docker hub y despues ejecutamos un contenedor de esa instancia de la siguiente manera

```bash
docker run -it 20
```

![[Pasted image 20240501005153.png]]

Para ver nuestros contenedores activos podemos hacer un `docker ps -a`

- Y para poder borrarlos podemos usar `docker rm id`
 - La imagen seguira estando por lo que tenemos que usar `docker rmi id` para que podamos eliminar una imagen de docker
