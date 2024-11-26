@echo off

REM BORRAMOS EL GRUPO ESTECO, POR SI YA ESTABA CREADO
net localgroup ESTECO /delete 

REM CREAMOS EL GRUPO ESTECO 
net localgroup ESTECO /add

echo "Creamos los usuarios del archivo contrataciones.txt"
for /f "tokens=1-5 delims=* usebackq" %%a IN (`type contrataciones.txt`) do (
echo "estoy creando el usuario: %%b con el nombre: %%a y con la contrasenia: %%e"
net user %%a %%e /add
echo "estoy agregando el usuario: %%a al grupo local esteco"
net localgroup ESTECO %%a /add
)