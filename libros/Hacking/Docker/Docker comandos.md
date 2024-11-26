
---

#comandos #docker #tabla #comandos 

---

| Comando                               | Ejemplo de Uso                                   | Descripción                                   |
|---------------------------------------|--------------------------------------------------|-----------------------------------------------|
| `docker build`                        | `docker build -t mi-imagen:1.0 .`                | Construye una imagen a partir de un Dockerfile en el directorio actual. |
| `docker pull`                         | `docker pull ubuntu:20.04`                       | Descarga una imagen desde Docker Hub.         |
| `docker push`                         | `docker push mi-repositorio/mi-imagen:1.0`       | Sube una imagen a un repositorio en Docker Hub. |
| `docker run`                          | `docker run -d --name mi-contenedor mi-imagen`  | Ejecuta un contenedor a partir de una imagen.  |
| `docker ps`                           | `docker ps`                                      | Lista los contenedores en ejecución.          |
| `docker images`                       | `docker images`                                  | Lista las imágenes locales.                   |
| `docker exec`                         | `docker exec -it mi-contenedor bash`            | Ejecuta un comando dentro de un contenedor en ejecución. |
| `docker stop`                         | `docker stop mi-contenedor`                      | Detiene un contenedor en ejecución.           |
| `docker rm`                           | `docker rm mi-contenedor`                        | Elimina un contenedor.                         |
| `docker rmi`                          | `docker rmi mi-imagen:1.0`                      | Elimina una imagen local.                     |
| `docker network`                      | `docker network create mi-red`                  | Crea una red personalizada para contenedores.  |
| `docker volume`                       | `docker volume create mi-volumen`                | Crea un volumen para almacenar datos persistentes. |
| `docker-compose up`                   | `docker-compose up -d`                          | Crea y levanta contenedores definidos en un archivo `docker-compose.yml`. |
| `docker-compose down`                 | `docker-compose down`                            | Detiene y elimina los contenedores definidos en un archivo `docker-compose.yml`. |
| `docker-compose ps`                   | `docker-compose ps`                              | Lista los contenedores definidos en un archivo `docker-compose.yml`. |
| `docker-compose logs`                 | `docker-compose logs`                            | Muestra los registros de los contenedores definidos en un archivo `docker-compose.yml`. |
| `docker-compose exec`                 | `docker-compose exec servicio comando`           | Ejecuta un comando en un servicio específico dentro de un archivo `docker-compose.yml`. |
| `docker-compose build`                | `docker-compose build`                           | Construye las imágenes definidas en un archivo `docker-compose.yml`. |
| `docker-compose pull`                     | `docker-compose pull`                            | Descarga imágenes actualizadas para los servicios definidos en un archivo `docker-compose.yml`. |
