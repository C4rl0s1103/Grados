REM Creador de N Usuarios y Grupos
REM Gonzalo Bilbao Alcázar
REM 02/02/2022
@ECHO OFF
CLS
SET /P grupo=Indica el nombre del grupo:
NET GROUP %grupo% /ADD
SET /P usuario=Indica el prefijo de los usuarios:
SET /P cantidad=¿Cuantos usuarios quieres crear?
SET /A tope=%cantidad%+1
SET i=1
:INICIO
NET USER usuario%i% User@123 /ADD
NET GROUP %grupo% %usuario%%i% /ADD
SET /A i=%i%+1
IF %i% NEQ %tope% GOTO INICIO