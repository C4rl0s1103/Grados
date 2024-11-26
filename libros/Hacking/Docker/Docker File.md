
-----------------
#docker

----------

Creamos un docker file con nano Dockerfile, hay que poner este nombre exacto si no no funcionara.

- Dentro del archivo vamos a crear una imagen con el comando `FROM` y el nombre de la imagen que vayamos a crear. Por ejemplo `FROM UBUNTU`
- Podemos ejecutar instrucciones dentro del dockerfile con el comando `RUN` podemos por ejemplo `RUN apt update && apt install pytyhon3 -y` 
- Podemos ejecutar este archivo dockerfile con el comando                                          `docker build --tag name .` Con esto ejecutamos el archivo con el nombre que nosotros queramos para la imagen y el punto ya que se nos ejecuta en el directorio actual de trabajo.
- Si queremos que cuando arranquemos el contenedor que creamos con python3 instalado nada mas abrir se este ya ejecutando python3 podemos modificar el dockerfile añadiendo el comando `CMD python3`


![[Pasted image 20240501161024.png]]



----------------------

