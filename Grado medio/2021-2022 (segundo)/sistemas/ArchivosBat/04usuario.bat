REM Pregunta por usuario y lo crea
REM Gonzalo Bilbao Alcázar
REM 01/02/2022
@ECHO OFF
CLS
SET/P usuario=Indica nombre del usuario: 
CLS
SET password=User@123
CLS
NET USER %usuario% %password% /ADD