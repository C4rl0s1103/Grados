REM Pregunta si eres hombre o mujer
REM Gonzalo Bilbao Alcázar
REM 01/02/2022
@ECHO OFF
:INICIO
CLS
SET /P sexo=Dime si eres hombre o mujer:
IF %sexo%=="hombre" GOTO HOMBRE
IF %sexo%=="mujer" GOTO MUJER
:HOMBRE
ECHO Eres un hombre
PAUSE
GOTO INICIO
:MUJER
ECHO Eres una mujer
GOTO INICIOg
PAUSE
