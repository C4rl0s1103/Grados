@echo off

echo "vamos a eliminar usuarios"
for /f "tokens=1-5 delims=* usebackq" %%a IN (`type contrataciones.txt`) do (
echo "estoy borrando la herencia al grupo ESTECO"
net localgroup ESTECO %%a /delete
echo "estoy eliminando el usuario: %%a"
net user %%a /delete
)

echo "eliminamos el grupo ESTECO"
net localgroup ESTECO /delete