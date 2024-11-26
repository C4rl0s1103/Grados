REM Creador de N Usuarios y Grupos
REM Gonzalo Bilbao Alcázar
REM 02/02/2022
@ECHO OFF
:INICIO
CLS
ECHO *********************
ECHO **   1 - Definir   **
ECHO **   2 - Crear     **
ECHO **   3 - Borrar    **
ECHO **   4 - Salir     **
ECHO *********************
ECHO.
SET /P menu=Indica la opción: 
IF %menu%==1 GOTO DEFINIR
IF %menu%==2 GOTO CREAR
IF %menu%==3 GOTO BORRAR
IF %menu%==4 GOTO SALIR
:DEFINIR
SET /P grupo=Indica el nombre del grupo:
SET /P usuario=Indica el prefijo de los usuarios:
SET /P cantidad=¿Cuantos usuarios quieres crear?
:CREAR
NET GROUP %grupo% /ADD
SET /A tope=%cantidad%+1
SET i=1
:BUCLE
NET USER %usuario%%i% User@123 /ADD
NET GROUP %grupo% %usuario%%i% /ADD
SET /A i=%i%+1
IF %i% NEQ %tope% GOTO BUCLE
GOTO INCIO
:BORRAR
SET i=1
:BUCLE2
NET USER %usuario%%i% /DELETE
SET /A i=%i%+1
IF %i% NEQ %tope% GOTO BUCLE2
NET GROUP %grupo% %usuario%%i% /DELETE
GOTO INCIO
:SALIR
CLS