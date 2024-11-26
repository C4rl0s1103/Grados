set /P PCenvio=Indica el PC a enviar:
set /P vecesenvio=Indica el numero de veces enviar el mensaje:
set /P mensaje=Indica el mensaje a mandar:

for /L %%i in (1,1,%vecesenvio%) do (
    msg * /server:ASIR2PC%PCenvio% %mensaje%
	timeout /t 1
)