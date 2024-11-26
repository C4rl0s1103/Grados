REM Calculadora
REM Gonzalo Bilbao Alcázar
REM 02/02/2022
@ECHO OFF
:INICIO
CLS
ECHO **************************
ECHO **	     1 - SUMA        **
ECHO **	     2 - RESTA       **
ECHO **	     3 - PROUCTO     **
ECHO **	     4 - COCIENTE    **
ECHO **	     5 - SALIR	     **
ECHO **************************
SET /P numero1=¿Que primer número quieres operar?
SET /P numero2=¿Que segundo número quieres operar?
SET /P opcion=¿Que operacion quieres ejecutar?
IF %opcion%==1 GOTO SUMA
IF %opcion%==2 GOTO RESTA
IF %opcion%==3 GOTO PRODUCTO
IF %opcion%==4 GOTO COCIENTE
IF %opcion%==5 GOTO SALIR
:SUMA
SET /A resultado=%numero1%+%numero2%
ECHO El resultado de la suma es %resultado%
PAUSE
GOTO INICIO
:resta
SET /A resultado=%numero1%-%numero2%
ECHO El resultado de la resta es %resultado%
PAUSE
GOTO INICIO
:PRODUCTO
SET /A resultado=%numero1%*%numero2%
ECHO El resultado del producto es %resultado%
PAUSE
GOTO INICIO
:COCIENTE
IF %numero2%==0 GOTO SINSENTIDO
SET /A resultado=%numero1%/%numero2%
ECHO El resultado del cociente es %resultado%
PAUSE
GOTO INICIO
:SINSENTIDO
ECHO Esa operacion no esta permitida
PAUSE
GOTO INICIO
:SALIR
ECHO Hasta pronto!!! 