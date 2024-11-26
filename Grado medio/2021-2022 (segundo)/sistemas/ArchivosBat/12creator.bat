REM Creador de Usuarios
REM Gonzalo Bilbao Alcázar
REM 02/02/2022
@ECHO OFF
CLS
SET /P cantidad=¿Cuantos usuarios quieres crear?
SET /A tope=%cantidad%+1
SET i=1
:INICIO
NET USER usuario%i% User@123 /ADD
SET /A i=%i%+1
IF %i% NEQ %tope% GOTO INICIO