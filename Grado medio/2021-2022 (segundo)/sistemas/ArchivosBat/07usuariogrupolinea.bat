REM Pregunta por usuario y grupo eb l�nea
REM Los crea y hace que el usuario pertenezca al grupo
REM Gonzalo Bilbao Alc�zar
REM 01/02/2022
@ECHO OFF
CLS
SET usuario=%1  
SET password=User@123
SET grupo=%2
CLS
NET USER %usuario% %password% /ADD
NET GROUP %grupo% /ADD
NET GROUP %grupo% %usuario% /ADD