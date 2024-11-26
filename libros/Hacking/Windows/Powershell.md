------------

---------

---
tags:
  - comandos
  - windows
  - tabla
  - powershell
---


--------
### Administración de Servicios y Procesos

| Comando | Ejemplo | Descripción |
| ---- | ---- | ---- |
| Get-Service | `Get-Service` | Obtiene información sobre los servicios en el sistema. |
| Stop-Service | `Stop-Service -Name NombreServicio` | Detiene un servicio en ejecución. |
| Start-Service | `Start-Service -Name NombreServicio` | Inicia un servicio. |
| Restart-Service | `Restart-Service -Name NombreServicio` | Reinicia un servicio. |
| Set-Service | `Set-Service -Name NombreServicio -Status "Running"` | Cambia el estado de un servicio. |
| Get-Process | `Get-Process` | Muestra una lista de procesos en ejecución. |
| Stop-Process | `Stop-Process -Name NombreProceso` | Detiene un proceso en ejecución. |
| Start-Process | `Start-Process -FilePath "Ruta\archivo.exe"` | Inicia un nuevo proceso. |
|  |  |  |

### Manipulación de Archivos y Directorios

| Comando           | Ejemplo                                         | Descripción                                      |
|-------------------|-------------------------------------------------|--------------------------------------------------|
| Get-Content       | `Get-Content -Path archivo.txt`                | Muestra el contenido de un archivo en la terminal. |
| Set-Content       | `Set-Content -Path archivo.txt -Value "NuevoContenido"` | Modifica el contenido de un archivo.   |
| New-Item          | `New-Item -Path C:\Directorio\archivo.txt`     | Crea un nuevo archivo o directorio.             |
| Remove-Item       | `Remove-Item -Path archivo.txt`                | Elimina archivos o directorios.                  |
| Copy-Item         | `Copy-Item -Path archivo.txt -Destination C:\Destino\` | Copia archivos o directorios.           |
| Move-Item         | `Move-Item -Path archivo.txt -Destination nuevo_nombre.txt` | Mueve o renombra archivos o directorios. |
| Get-Item          | `Get-Item -Path archivo.txt`                   | Obtiene información detallada sobre un archivo o directorio. |
| Rename-Item       | `Rename-Item -Path archivo.txt -NewName nuevo_nombre.txt` | Cambia el nombre de un archivo o directorio. |
| Get-ChildItem     | `Get-ChildItem -Path C:\Directorio`            | Lista archivos y directorios en un directorio específico. |
| Set-Location      | `Set-Location -Path C:\Ruta`                   | Cambia el directorio actual.                    |
| Get-Location      | `Get-Location`                                  | Muestra la ruta del directorio actual.           |
| Test-Path         | `Test-Path -Path C:\Archivo.txt`               | Verifica si una ruta de archivo o directorio existe. |

