REM Menú de opciones
REM Gonzalo Bilbao Alcázar
REM 02/02/2022
@ECHO OFF
:INICIO
CLS
ECHO *****************************
ECHO **	     1 - SUSTO     	**
ECHO **	     2 - MUERTE    	**
ECHO **	     3 - DESTRUCCION    **
ECHO **	     4 - CAOS     	**
ECHO **	     5 - SALIR     	**
ECHO *****************************
SET /P opcion=Elige la opción:
IF %opcion%==1 GOTO SUSTO
IF %opcion%==2 GOTO MUERTE
IF %opcion%==3 GOTO DESTRUCCION
IF %opcion%==4 GOTO CAOS
IF %opcion%==5 GOTO SALIR
:SUSTO
ECHO BO!
PAUSE
GOTO INICIO
:MUERTE
ECHO PAM!
PAUSE
GOTO INICIO
:DESTRUCCION
ECHO KABOOM!
PAUSE
GOTO INICIO
:CAOS
ECHO NONADA!
PAUSE
GOTO INICIO
:SALIR
ECHO HASTA LA PROXIMA!!!