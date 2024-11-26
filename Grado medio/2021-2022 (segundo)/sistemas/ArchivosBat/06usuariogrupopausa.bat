REM Pregunta por usuario y grupo
REM Los crea y hace que el usuario pertenezca al grupo  
REM y luego los borra
REM Gonzalo Bilbao Alcázar
REM 01/02/2022
@ECHO OFF
CLS
SET/P usuario=Indica nombre del usuario:  
SET password=User@123
SET/P grupo=Indica nombre del grupo: 
CLS
NET USER %usuario% %password% /ADD
NET GROUP %grupo% /ADD
NET GROUP %grupo% %usuario% /ADD
PAUSE
NET GROUP %grupo% /DELETE
NET USER %usuario% /DELETE
