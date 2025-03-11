/*######################################################################
########################################################################
####																####
####								ASGBD							####
####					PRÁCTICA 1    -    TEMA 13					####
####																####
########################################################################
######################################################################*/


/*1. Conectarse localmente con el usuario "root" de forma corta y después comprobar el usuario
con el que has entrado al servidor.*/

	shell> mysql -u root -p	  /* Entramos desde CMD con el usuairo root*/
	mysql> SELECT user();  	  /* Comprobamos el usuario con el que nos hemos conectado*/




/*2. Contesta:
a) ¿Cómo se llama la tabla qué almacena las cuentas de usuario?*/
	USER

/*b) ¿A qué base de datos pertenece esa tabla?*/
	MYSQL
	/*La base de datos "mysql" y la tabla user vienen creadas por defecto en el servidor*/



/*3. Mostrar usuario, host y password de todas las cuentas de ususario.*/

	mysql> SELECT user, host, authentication_string FROM mysql.user;

	/* o */

	mysql> use mysql
	mysql> select user, host, authentication_string
      	   FROM user;

	/*La tabla user de la báse de datos mysql guarda toda la información 
	acerca de las cuentas de usuario creadas en el servidor
	User -> Es el nombre del usuario
	Host -> Es el equipo desde el cual se está conectado, en nuestro caso (localhost)
	authentication_string -> hace referencia a la contraseña del usuario (encriptada)*/




/*4. Crear una cuenta de usuario llamada "usuario1" y contraseña "usuario1" para acceder en
modo local con todos los privilegios o permisos sobre todas las tablas de todas las BBDD.*/

	mysql> GRANT ALL PRIVILEGES 
		   ON *.*
		   TO usuario1@localhost 
		   IDENTIFIED BY 'usuario1';

	/* La cláusula GRANT en MySQL se utiliza para otorgar privilegios a usuarios 
	en una base de datos. Si dicho usuario no existe previamente, este se creará 
	en el momento y con los permisos indicados.

	Su sintaxis es la siguiente:
	GRANT [tipo_de_privilegio] 
	ON [baseDeDatos.tabla] 
	TO [usuario@host] 
	IDENTIFIED BY [contraseña];

	==============================================================================

	NOTA EXTRA (Carmen no lo ha explicado):
	En versiones de mysql superiores a la 8.0 incluída primero debemos crear el
	usuario y después darle permisos, no nos permite crear usuarios directamente con GRANT

	CREATE USER 'usuario1@localhost' 
	IDENTIFIED BY 'usuario1';
	================================
	GRANT ALL PRIVILEGES 
	ON *.* 
	TO 'usuario1'@'localhost';

	*/




/*5. Crear una cuenta de usuario llamada "usuario2" sin contraseña para acceder en modo local
con el permiso SELECT sobre todas las tablas de todas las BBDD.*/

	mysql> GRANT SELECT
		   ON *.*
		   TO usuario2@localhost;  
	/* NO ES PSIBLE */

	/*A partir de la version 5.7.40 de mysql No está permitido crear usuarios (sin contraseña)
	con la instruccion GRANT*/
				
	/* LO CREAMOS CON CONTRASEÑA*/
	mysql> GRANT SELECT 
		   ON *.*
		   TO usuario2@localhost 
		   IDENTIFIED BY 'usuario2'; 




/*6. Cuando se hace una conexión al servidor MySQL la identifica por el hostname. ¿Qué partes
tiene el hostname?*/

	/*
	Explicación 1
	-------------
	[usuario@host]
	[usuario] Es el nombre del usuario.
	[@host] Especifica desde qué host/máquina nos conectamos (ejemplo: 'localhost' o '192.168.10.5').


	Explicación 2
	-------------
	- El host desde el cual se hace la conexion 
		es decir el nombre de maquina cliente  (o IP)
		desde donde nos conectamos 
	- El nombre de usuario.	
	*/




/*7. Mostrar usuario, host y password de todas las cuentas de usuario.*/

	mysql> SELECT user, host, authentication_string
		   FROM mysql.user;

	/*(Versiones anteriores)*/
	mysql> SELECT user, host, password 
		   FROM mysql.user;





/*8. Investigar algún campo más de la tabla user de la BBDD mysql. Explica que información
muestran los siguientes campos: 

	A. select_priv: 
		(Y/N) permite consultar informacion de todas las tablas de todas las BBDD.
	B. insert_priv:
		(Y/N) permite insertar nuevos registros en todas las tablas de todas las BBDD.
	C. delete_priv:
		(Y/N) permite borrar egistros de todas en todas las tablas de todas las BBDD.*/

	mysql> SELECT USER, host, select_priv, insert_priv, delete_priv
		   FROM mysql.user;
	/*Muestra DESORDENADOS todos los datos indicados de la tabla user*/

	mysql> SELECT * FROM mysql.user \G
	/*Muestra en formato legible todos los datos de la tabla user OJO: sin ; al final*/




/*9. Investigar los campos de la tabla db de la BBDD mysql. Explica que información muestran
los siguietes campos: select_priv, insert_priv y c. delete_priv.

	A. select_priv: 
		(Y/N) permite consultar informacion de todas las tablas de todas las BBDD.
	B. insert_priv:
		(Y/N) permite insertar nuevos registros en todas las tablas de todas las BBDD.
	C. delete_priv:
		(Y/N) permite borrar egistros de todas en todas las tablas de todas las BBDD.*/

	mysql> SELECT user, host, db, authentication_string, insert_privi, delete_privi
		   FROM mysql.db;
	/*Muestra DESORDENADOS todos los datos indicados de la tabla db*/	

	mysql> SELECT * FROM mysql.db \G 
	/*Muestra en formato legible todos los datos de la tabla db OJO: sin ; al final*/




/*10. Muestra únicamente los privilegios o permisos que tiene asignado el usuario
"usuario2@localhost" */

	mysql> SHOW GRANTS FOR usuario2@localhost;

	/*La cláusula SHOW GRANTS FOR [usuario@hots] muestra todos los permisos que tiene
	el usuario indicado*/








/*######################################################################
########################################################################
####																####
####								ASGBD							####
####					PRÁCTICA 2    -    TEMA 13					####
####																####
########################################################################
######################################################################*/




/*1. Conectarte localmente con el usuario "root" de forma corta y después comprobar el usuario
con el que has entrado al servidor.*/

	shell> mysql -u root
	mysql> SELECT USER ();




/*2 Crear una cuenta de usuario llamada "usuario3" y contraseña "user3" para acceder en modo
local con todos los privilegios o permisos sobre todas las tablas de la BBDD “curso”.*/

	mysql> GRANT ALL PRIVILEGES	
		   ON curso.*
		   TO usuario3@localhost
		   IDENTIFIED BY 'USER3';
	/* OJO: Especificamos únicamente la base de datos curso*/




/*3 Crear una cuenta de usuario llamada "usuario4" sin contraseña para acceder en modo local
con el permiso SELECT,INSERT sobre todas las tablas de la BBDD “curso”.*/

	mysql> GRANT SELECT, INSERT	
		   ON curso.*
		   TO usuario4@localhost;

		   /*En vesiones de mysql superiores a la 5.7.40 debemos indicar contraseña obligatoriamente
		   para ello añadimos la siguiente linea al final */
		   IDENTIFIED BY 'USER4';



/*4 Mostrar los campos user, host y password de la tabla user de la BBDD mysql.*/

    /* Estamos como root */
	mysql> SELECT user, host, authetication_string
		   FROM mysql.user;

	/*La tabla user muestra todos los usuarios sean cuales sean sus permisos.
	- Especifica (Y) solo en los permisos asignados a nivel global.
	- Especifica (N) si no tiene ese permiso asignado a nivel global. 
	Es decir si dicho permisos se concedió en todas las bbdd y tablas con (*.*).*/
		
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


/*5. Mostrar los campos host, db y user de la tabla db de la BBDD mysql.*/

	mysql> SELECT user, host, db
		   FROM mysql.db;
		
	/*La tabla db muestra los usuarios con permisos asignados a nivel de una
	base de datos completa, por ejemplo utilizando (curso.*)   */

	mysql> SELECT user, host, db, select_priv, insert_priv, delete_priv
		   FROM mysql.db;
	
	/*Para que se vea mas bonito el select anterior, ojo, sin ; al final*/
	mysql> SELECT * FROM mysql.db \G





/* 6. Como sabes el “usuario4” se ha creado sin contraseña. Deseamos asignarle la contraseña
"usuario4". ¿Cuál/es de las siguientes formas es válida?. Para la/las formas válidas debes
indicar todos los pasos.
a) Conectado desde el usuario3.
b) Conectado desde el usuario4.
c) Conectado desde el usuario1.

	/*6 NO SE HACEEEEEE*/


7. Como sabes el “usuario3” se ha creado con contraseña. Deseamos asignarle una nueva
contraseña "usuario3". ¿Cuál/es de las siguientes formas es válida?. Para la/las formas
válidas debes indicar todos los pasos.
a) Conectado desde el usuario3.
b) Conectado desde el usuario4.

	/*7 NO SE HACEEEEEE*/*/




/*8. Desconectarte como usuario root. Volver a conectarte localmente con el usuario "usuario3"
de forma corta y comprobar el usuario con el que has entrado al servidor.*/

	mysql> exit   /*Vale exit o quit*/
	shell> mysql -u ususario3 -p
	mysql> SELECT USER();
	/*Despues de poner mysql -u usuario3 -p nos solicitará la contraseña*/

	/*OJO, Recordatorio*/
	C:\User\alumno>  cd \ 					  /* Con cd \ nos movemos a C:\  */
	C:\>  cd wamp\bin\mysql\mysql5.7.40\bin   /* Esta ruta es la que representamos como "Shell"*/




/*9. Muestra únicamente los privilegios o permisos que tiene asignado el usuario
"usuario3@localhost".*/

	mysql> SHOW GRANTS FOR usuario3@localhost;




/*10. Desde "usuario3@localhost" crea una nueva BBDD llamada "instituto". Si no es posible
explica por qué.*/  

/*Nos conectamos como usuario3 y ejecutamos la siguiente sentencia*/
CREATE DATABASE instituto;
/*ERROR: no se puede crear un BBDD nueva porque el "usuario3@localhost"
solo tiene privilegios sobre la  BBDD curso*/




/*11. Desconectarte como "usuario3@localhost". Volver a conectarte localmente con el usuario
"usuario1@localhost" de forma corta y comprobar el usuario con el que has entrado al
servidor.*/

	mysql> quit /*se puede usar quit o exit*/
	shell> mysql -u ususario1 -p
	mysql> SELECT USER();
	/*OJO, Después de teclear mysql -u usuario1 -p nos solicitará la contraseña*/
	


/*12. Muestra únicamente los privilegios o permisos que tiene asignado el usuario
usuario1@localhost".*/

	mysql> SHOW GRANTS FOR usuario1@localhost;
	/*Recordemos que SHOW GRANTS FOR usuario1@host saca por pantalla los permisos del usuario1*/
	+-------------------------------------------------------+
	| Grants for usuario1@localhost                         |
	+-------------------------------------------------------+
	| GRANT ALL PRIVILEGES ON *.* TO 'usuario1'@'localhost' |
	+-------------------------------------------------------+



/*13. Desde "usuario1@localhost" crea una nueva BBDD llamada "instituto". Si no es posible
explica por qué.*/

	mysql> CREATE DATABASE instituto;
	/*Efectivamente el usuario1 tiene concedidos:
	    - Todos los permisos
	    - Sobre todas las tablas
	    - De todas las bases de datos
	  Por lo tanto si puede crear la nueva base de datos*/




/*14. Desconectarte como "usuario1@localhost". Volver a conectarte localmente con el usuario
"usuario3@localhost" de forma corta y comprobar el usuario con el que has entrado al
servidor.*/

	mysql> quit
	shell> mysql -u ususario3 -p
	mysql> SELECT USER();
	/*OJO, Después de teclear mysql -u usuario1 -p nos solicitará la contraseña*/




/*15. Desde "usuario3@localhost" crea una tabla llamada "alumasir2" en la BBDD "curso". Si no
es posible explica por qué.

	CAMPO 					TIPO 					NULO 						VALOR POR DEFECTO
	nlista 			entero de longitud 2,
						autoincremental				no, clave primaria -
	nombre 				cadena longitud 40 			no 									-
	notaiaweb 		entero de longitud 2 			no 									-
	notaasgbd 		entero de longitud 2 			no 								    -
	*/

	USE curso;
	CREATE TABLE alumasir2
		(nlista INT(2) AUTO_INCREMENT PRIMARY KEY,
		nombre VARCHAR(40) NOT NULL,
		notaiaweb INT(2) NOT NULL,
		notaasgbd INT (2) NOT NULL
		)ENGINE = InnoDB CHARSET=utf8;
	/*Si se puede crear la tabla ya que estamos creando la tabla en la base de datos curso y 
	el "usuario3@localhost" tiene todos los  privilegios sobre la  BBDD curso*/




/*16. Inserta los siguientes datos en la tabla "alumasir2". Si no es posible explica por qué.

	nlista      nombre                  notaiaweb      notaasgbd
	1           Carlos Casas Cuerda         4               5
	2           orge Iglesias Vela          6               8
	*/
	
	INSERT INTO alumasir2 (nombre,notaiaweb, notaasgbd)
	VALUES ('Carlos Casas Cuerda',4,5);
		
	INSERT INTO alumasir2 (nombre,notaiaweb, notaasgbd)
	VALUES ('Jorge Iglesias Vela',6,8);
	/*Si se pueden insertar los datos ya que el "usuario3@localhost" tiene todos los 
	privilegios sobre la  BBDD curso y alumasir2 es una tabla de dicha base de datos*/




/*17. Desconectarte como usuario "usuario3".Volver a conectarte localmente con el usuario
"usuario4" de forma corta y comprobar el usuario con el que has entrado al servidor.*/
	
	mysql> quit
	shell> mysql -u ususario4 -p
	mysql> SELECT USER();
	/* Atropellame o algo por favor, es la tercera vez que hacemos esta mierda */




/*18. Muestra únicamente los privilegios o permisos que tiene asignado el usuario
"usuario4@localhost". Si no es posible explica por qué.*/

	/*Estamos como usuario4*/
	mysql> SOHW GRANTS FOR usuario4@localhost;
	+-------------------------------------------------------------+
	| Grants for usuario4@localhost                               |
	+-------------------------------------------------------------+
	| GRANT USAGE ON *.* TO 'usuario4'@'localhost'                |
	| GRANT SELECT, INSERT ON `curso`.* TO 'usuario4'@'localhost' |
	+-------------------------------------------------------------+




/*18.1 Muestra únicamente los privilegios o permisos que tiene asignado el usuario
"usuario1@localhost". Si no es posible explica por qué.*/

	/*Estamos como usuario4*/
	mysql> SOHW GRANTS FOR usuario1@localhost;
	/*ERROR 1044 (42000): Access denied for user 'usuario4'@'localhost' to database 'mysql'
	El usuario4 solo tiene permisos de select e insert en la base de datos curso, no puede
	visualizar los permisos de otro usuario*/




/*19. Muestra todos los datos de la tabla "alumasir2". Si no es posible explica por qué.*/

	/*Estamos como usuario4*/
	mysql> use curso;
	mysql> SELECT * FROM alumasir2;

	o

	mysql> SELECT * FROM curso.alumasir2;
	/*Si podemos por que el usuario4 tiene permiso de select e insert en toda la base de 
	datos curso*/




/*20. Inserta los siguientes datos. Si no es posible explica por qué.*/

	/*Estamos como usuario4*/
	mysql> use curso;
	mysql> INSERT INTO alumasir2 (nombre,notaiaweb, notaasgbd)
		   VALUES ('Carlos Rosas Madrid', 6, 8);

	/*Si podemos por que el usuario4 tiene permiso de select e insert en toda la base de 
	datos curso*/




/*21. Modifica la nota del módulo de IAWEB a todos los alumnos, subiéndoles 1 punto. Si no es
posible explica por qué.*/

	/*Estamos como usuario4*/
	mysql> UPDATE alumnoasir2
	       SET notaiaweb = notaiaweb + 1;
	/* ERROR 1142 (42000): UPDATE command denied to user 'usuario4'@'localhost' for table 'alumnoasir2' 
	el usuario4@localhost" no tiene asignado el privilegio UPDATE sobre la base de datos curso y la 
	tabla "alumasir2" pertenece a dicha base de datos. Recordemos que solo tiene permiso de select e
	insert.*/
	


/*22. Borra a los alumnos cuya nota es un 5 en el módulo de ASGBD. Si no es posible explica por
qué.*/

	/*Estamos como usuario4*/
	mysql> DELETE FROM alumasir2
		   WHERE notaasgbd = 5;
	/*ERROR 1142 (42000): DELETE command denied to user 'usuario4'@'localhost' for table 'alumasir2'
	el usuario4@localhost" no tiene asignado el privilegio DELETE sobre la base de datos curso y la 
	tabla "alumasir2" pertenece a dicha base de datos. Recordemos que solo tiene permiso de select e
	insert.*/










/*######################################################################
########################################################################
####																####
####								ASGBD							####
####					PRÁCTICA 3    -    TEMA 13					####
####																####
########################################################################
######################################################################*/




/*1. Conectarte localmente con el usuario "root" de forma corta y comprueba el usuario con el
que has entrado al servidor.*/

	mysql> exit
	shell> mysql -u root -p
	mysql> SELECT USER();

	/*Como root podemos hacerlo todo*/



/*2. Borra la BBDD "instituto".*/

	mysql> DROP DATABASE instituto;




/*3. Borra la tabla "alumasir2" de la BBDD "curso".*/

	mysql> DROP TABLE curso.alumasir2;




/*4. Crea una nueva BBDD llamada "instituto". Si no es posible explica por qué.*/

	mysql> CREATE DATABASE instituto;




/*5. Crea una tabla llamada "alumasir2" en la BBDD "instituto" con la siguiente estructura. Si no
es posible explica por qué.*/

	mysql> USE instituto; 
	mysql> CREATE TABLE alumasir2
		   (nlista INT(2) AUTO_INCREMENT PRIMARY KEY,
		   nombre VARCHAR (40) NOT NULL,
		   notaiaweb INT(2)NOT NULL,
		   notaasgbd INT (2) NOT NULL   
		   )ENGINE= InnoDB CHARSET=utf8;




/*6. Inserta los siguientes datos en la tabla "alumasir2". Si no es posible explica por qué.*/ 

	mysql> INSERT INTO alumasir2 (nombre, notaiaweb, notaasgbd)
		   VALUES ('Carlos Casas Cuerda', 4, 5);

	mysql> INSERT INTO alumasir2 (nombre, notaiaweb, notaasgbd)
		   VALUES ('Jorge Iglesias Vela', 6, 8);

	mysql> INSERT INTO alumasir2 (nombre, notaiaweb, notaasgbd)
		   VALUES ('Irene Rosas Madrid', 6, 8);




/*7. Crea una tabla llamada "alumasir1" en la BBDD "instituto" con la siguiente estructura. Si no
es posible explica por qué.*/

	mysql> USE instituto; 
	mysql> CREATE TABLE alumasir1
		   (nlista INT(2) AUTO_INCREMENT PRIMARY KEY,
		   nombre VARCHAR (40) NOT NULL,
		   notaiaweb INT(2)NOT NULL,
		   notaasgbd INT (2) NOT NULL   
		   )ENGINE= InnoDB CHARSET=utf8;
 



/*8. Inserta los siguientes datos en la tabla "alumasir1". Si no es posible explica por qué. */

	mysql> INSERT INTO alumasir1 (nombre, notaiaweb, notaasgbd)
		   VALUES ('Pablo Casas casas', 7, 8);

	mysql> INSERT INTO alumasir1 (nombre, notaiaweb, notaasgbd)
		   VALUES ('David Luz Vela', 5, 4);

	mysql> INSERT INTO alumasir1 (nombre, notaiaweb, notaasgbd)
		   VALUES ('Ana Maria Luengo', 6, 5);




/*9. Muestra el contenido de la tabla "alumasir2" y el de la tabla "alumasir1".*/

	mysql> SELECT * FROM alumasir2;
	mysql> SELECT * FROM alumasir1;




/*10. Crear una cuenta de usuario llamada "usuario5@localhost" y contraseña "user5" para
acceder en modo local con los permisos SELECT, INSERT, UPDATE y DELETE sobre la
tabla "alumasir2" de la BBDD "instituto". Si no es posible explica por qué.*/

	mysql> GRANT SELECT, INSERT, UPDATE, DELETE
		   ON instituto.alumasir2
		   TO usuario5@localhost
		   IDENTIFIED BY 'user5';

	/*TEORIA
	los privilegios que se pueden especificar para una tabla son 
	SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, GRANT OPTION, INDEX, ALTER.)*/




/*11. Desconectarte como usuario "root".Volver a conectarte localmente con el usuario
"usuario5@localhost" de forma corta y comprueba el usuario con el que has entrado al
servidor. */

	mysql> quit
	shell> mysql -u usuario5 -p 
	mysql> SELECT USER ();




/*12. Pon en uso la BBDD "instituto". Si no es posible explica por qué.*/ 

	mysql> USE instituto;




/*13. Inserta los siguientes datos en la tabla "alumasir1". Si no es posible explica por qué. */

	mysql> INSERT INTO alumasir1 (nombre, notaiaweb, notaasgbd)
		   VALUES('Pilar Sol Luna', 8, 9);

	/* No es posible insertar por que el ususario " usuario5@localhost"
	no tiene ningun privilegio sobre la tabla "alumasir1" solo tiene permisos para "alumasir2" */




/*14. Muestra los privilegios o permisos que tiene asignado el usuario "usuario5@localhost" */

	mysql> SHOW GRANTS FOR usuario5@localhost;
	+-------------------------------------------------------------------------------------------+
	| Grants for usuario5@localhost                                                             |
	+-------------------------------------------------------------------------------------------+
	| GRANT USAGE ON *.* TO 'usuario5'@'localhost'                                              |
	| GRANT SELECT, INSERT, UPDATE, DELETE ON `instituto`.`alumasir2` TO 'usuario5'@'localhost' |
	+-------------------------------------------------------------------------------------------+




/*15. Quita los privilegios UPDATE y DELETE al usuario "usuario5@localhost". Si no es posible
explica por qué.*/

	mysql> REVOKE UPDATE, DELETE
		   ON instituto.alumasir2
		   FROM usuario5@localhost;
	/* ERROR 1142 (42000): GRANT command denied to user 'usuario5'@'localhost' for table 'alumasir2'
	La clausula REVOKE se utiliza para revocar (eliminar) permisos de los usuarios pero
	en este caso no es posible ya que un usuario5 no tiene permiso para dar o quitar privilegios */




/*16. ¿Qué usuario puede quitarle los privilegios UPDATE y DELETE al usuario
"usuario5@localhost". ¿cómo lo haces?. Explica por que si o por que no y  
comprueba si se han eliminado los privilegios.*/

	/*==  Estamos con "usuario5@localhost"  ==*/
	mysql> quit
	/*Vamos a probar con el usuario1*/
	shell> mysql -u usuario1 -p
	mysql> SELECT USER ();
	mysql> REVOKE UPDATE, DELETE
		   ON instituto.alumasir2
		   FROM usuario5@localhost;

	/* La clausula REVOKE se utiliza para revocar (eliminar) permisos de los usuarios pero
	en este caso no es posible ya que el 'usuario1'@'localhost' no tiene el privilegio específico para 
	otorgar o revocar permisos a otros usuarios, a pesar de tener "ALL PRIVILEGES".

	Para resolver este problema, necesitas agregar el privilegio "WITH GRANT OPTION" al usuario 'usuario1. 
	Para agregar este privilegio, un usuario con permisos de administrador (como root) debe ejecutar el 
	siguiente comando:

	GRANT ALL PRIVILEGES 
	ON *.* 
	TO 'usuario1'@'localhost' 
	WITH GRANT OPTION;

	Una vez ejecutado este comando, 'usuario1'@'localhost' podrá otorgar y revocar permisos a otros usuarios*/


	/*==  Usuario root  ==*/
	mysql> quit
	shell> mysql -u root -p
	mysql> SELECT USER ();
	mysql> REVOKE UPDATE, DELETE
		   ON instituto.alumasir2
		   FROM usuario5@localhost;
	/* Si es posible por que es el administrador y tiene todos los privilegios*/

	/*Comprobacion */
	mysql> SHOW GRANTS FOR usuario5@localhost;
	+---------------------------------------------------------------------------+
	| Grants for usuario5@localhost                                             |
	+---------------------------------------------------------------------------+
	| GRANT USAGE ON *.* TO 'usuario5'@'localhost'                              |
	| GRANT SELECT, INSERT ON `instituto`.`alumasir2` TO 'usuario5'@'localhost' |
	+---------------------------------------------------------------------------+
	/*Ya no aparecen los poermisos de update ni delete*/




/*17. Estando conectado como usuario "root". Vuelve a añadirle los privilegios UPDATE y
DELETE al usuario "usuario5@localhost". Si no es posible explica por qué. Si ha sido
posible debes comprobar que se han añadido los privilegios.*/

	mysql> GRANT UPDATE, DELETE
		   ON instituto.alumasir2
		   TO usuario5@localhost;
	/*OJO, Una vez que el usuario ya está creado de antes no hace flata especificar la linea
	"IDENTIFIED BY" para añadir nuevos permisos */

	/*Comprobacion */
	mysql> SHOW GRANTS FOR usuario5@localhost;		   
	+-------------------------------------------------------------------------------------------+
	| Grants for usuario5@localhost                                                             |
	+-------------------------------------------------------------------------------------------+
	| GRANT USAGE ON *.* TO 'usuario5'@'localhost'                                              |
	| GRANT SELECT, INSERT, UPDATE, DELETE ON `instituto`.`alumasir2` TO 'usuario5'@'localhost' |
	+-------------------------------------------------------------------------------------------+




/*18. Muestra la información de las tablas user, db y tables_priv relacionada con el usuario
"usuario5".*/

	/*Seguimos conectados como root*/
	mysql> SELECT *
		   FROM mysql.user
		   WHERE user='usuario5' \G
		
	mysql> SELECT *
		   FROM mysql.db
		   WHERE user='usuario5' \G
		
	mysql> SELECT *
		   FROM mysql.tables_priv
		   WHERE user='usuario5' \G
		

	/* Siempre que queramos visualizar las tablas de permisos usaremos \G para poder visualizarlo bien
	OJO: Recordemos que después de \G no hace falta finalizar la consulta con ;  

	IMPORTANTE: Dentro de la base de datos "mysql":
	- La tabla user muestra los privilegios a nivel global (Corresponde con *.*)
	- La tabla db muestra los privilegios a nivel bases de datos completa (Corresponde con curso.*)
	- La tabla tables_priv muestra los privilegios a nivel de tabla (Corresponde con curso.clientes)

	OJO2: si un usuario tiene permisos del estilo:
		GRANT SELECT, INSERT
		ON curso.clientes
		TO pepito@localhost;
		
	Este NO aparecerá en la tabla db ya que no tiene permisos a nivel base de datos completa, sin 
	embargo si aparecera en la tabla de tables_priv ya que tiene privilegios sobre una tabla en 
	concreto.
	En cambio si aparecerá en la tabla user con los privilegios globales en (N) ya que user muestra
	todos los usuarios del servidor con sus permisos globales en (Y) o en (N).
	*/













/*######################################################################
########################################################################
####																####
####								ASGBD							####
####					PRÁCTICA 4    -    TEMA 13					####
####																####
########################################################################
######################################################################*/




/*1. Conectarte localmente con el usuario "root" de forma corta y comprueba el usuario con el
que has entrado al servidor.*/

	shell> mysql -u root -p 
	mysql> SELECT USER ();
	



/*2. Crear una cuenta de usuario llamada "usuario6@localhost" y contraseña "user6" para
acceder en modo local a las columnas "nombre" y "notalm" con el permiso SELECT y a la
columna "notaasgbd" con el permiso UPDATE de la tabla "alumasir1" de la BBDD
"instituto". Si no es posible explica por qué.*/

	msql> GRANT SELECT(nombre,notalm), UPDATE (notaasgbd)
		  ON instituto.alumasir1
		  TO usuario6@localhost
		  IDENTIFIED BY 'user6';


	/*TEORIA
	los privilegios que se pueden especificar para una tabla son 
	SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, GRANT OPTION, INDEX, ALTER.)

	Cuando asignamos permisos por ejemplo de SELECT podemos especificar que columnas permitiremos 
	que consulte añadiendo sus nombres a continuación y dentro de un paréntesis. Por ejemplo:
	SELECT (nombre, apellido) -> Asigna el permiso de consultar sobre las columnas nombre y apellido.

	Y lo mismo sucede con el permiso de UPDATE. Por ejemplo:
	UPDATE (telefono, direccion) -> Asigna permiso para actualizar las columnas telefono y direccion.

	Sin embargo no podemos especificar columnas para los permisos de DELETE o INSERT, ¿Por queee?
	*/

	/*La tabla alumasir1 no tiene la columna notalm, lo hacemos con la columna notaiaweb*/
	msql> GRANT SELECT(nombre,notaiaweb), UPDATE (notaasgbd)
		  ON instituto.alumasir1
		  TO usuario6@localhost
		  IDENTIFIED BY 'user6';




/*3. Mostrar los campos user,host y password de la tabla user de la BBDD mysql.*/

	mysql> SELECT user, host, authentication_string
		   FROM mysql.user;

 
/*4. Muestra la información de las tablas user, db, tables_priv y columns_priv relacionada con el
usuario "usuario6".*/

	mysql> SELECT *
		   FROM mysql.user
		   WHERE user='usuario6' \G
	/*Aparece el usuario6 pero sus permisos "GLOBALES" figuran como (N) */

	mysql> SELECT *
		   FROM mysql.db
		   WHERE user='usuario6' \G
	/*No aparece el usuario6 por que no tienen permisos sobre una base de datos AL COMPLETO */	

	mysql> SELECT *
		   FROM mysql.tables_priv
		   WHERE user='usuario6' \G
	/*No aparece el usuario6 por que no tienen permisos sobre una tabla AL COMPLETO */	

	mysql> SELECT *
		   FROM mysql.columns_priv
		   WHERE user='usuario6' \G
	/*Aparece el usuario6 con las columnas específicas para las cuales tiene permisos */
	+-----------+-----------+----------+------------+-------------+---------------------+-------------+
	| Host      | Db        | User     | Table_name | Column_name | Timestamp           | Column_priv |
	+-----------+-----------+----------+------------+-------------+---------------------+-------------+
	| localhost | instituto | usuario6 | alumasir1  | nombre      | 0000-00-00 00:00:00 | Select      |
	| localhost | instituto | usuario6 | alumasir1  | notaiaweb   | 0000-00-00 00:00:00 | Select      |
	| localhost | instituto | usuario6 | alumasir1  | notaasgbd   | 0000-00-00 00:00:00 | Update      |
	+-----------+-----------+----------+------------+-------------+---------------------+-------------+
	
	


/*5. Desconectarte como usuario "root".Volver a conectarte localmente con el usuario
"usuario6@ localhost" de forma corta y comprueba el usuario con el que has entrado al
servidor.*/

	mysql> quit 				/*Podemos usar quit o exit*/
	shell> mysql -u usuario6 -p
	mysql> SELECT USER();




/*6. Pon en uso la BBDD "instituto". Si no es posible explica por qué.*/

	mysql> USE instituto;




/*7. Muestra el contenido de la tabla "alumasir1". Si no es posible explica por qué.*/
 
	/*Estamos como usuario6*/
	mysql> SELECT * FROM alumasir1;
 
	/*NO es posible, por que el usuario  "usuario6" solo tiene permiso de select sobre
	las columnas nombre y notaiaweb, no sobre todas las columnas (*)  */
 

 
 
/*8. Muestra el "nombre" y "notalm" de la tabla "alumasir1". Si no es posible explica por qué.*/

	mysql> SELECT nombre, notalm FROM alumasir1;
	/*La tabla alumasir1 no tiene la columna notalm, por lo tanto la SELECT falla.
	Lo podemos haccer con la columna notaiaweb*/
	mysql> SELECT nombre, notaiaweb FROM alumasir1;




/*9. Incrementa en 1 la nota de GBD de todos los alumnos de la tabla "alumasir1". Si no es
posible explica por qué.*/

	mysql> UPDATE alumasir1
		   SET notaasgbd = notaasgbd + 1;

/* No es posible, porque el usuario "usuario6" no tiene acceso de lectura (SELECT) a la 
columna "notagbd" de la tabla "alumasir1". Para poder actualizar la columna no solo debemos
tener permiso de uptade si no también de select*/ 




/*10. Desconectarte como usuario "usuario6@localhost".Volver a conectarte localmente con el
usuario "root" de forma corta y comprueba el usuario con el que has entrado al servidor.*/

	mysql> quit
	shell> mysql -uroot -p
	mysql> SELECT USER ();




/*11. Muestra los privilegios o permisos que tiene asignado el usuario "usuario6@localhost"*/ 

	mysql> SHOW GRANTS FOR usuario6@localhost;




/*12. Elimina todos los permisos o privilegios del usuario "usuario6@localhost".
¿Sigue existiendo en la tabla "user"? 
¿Sigue existiendo en la tabla "db"?
¿Sigue existiendo en la tabla "tables_priv"?
¿Sigue existiendo en la tabla "columns_priv"? 
Elimine definitivamente el usuario "cuenta6@localhost".*/
 
	mysl> REVOKE SELECT(nombre,notaiaweb), UPDATE (notaasgbd)
		  ON instituto.alumasir1 FROM usuario6@localhost;
	o
	mysl> REVOKE ALL PRIVILEGES 
		  ON instituto.alumasir1 FROM usuario6@localhost;
		
	mysql> SELECT * FROM mysql.user WHERE user='usuario6' \G
	/*Si aparece por que en la tabla user estan todos los usuarios del servidor
	independientemente de los privilegios que tengan.*/

	mysql> SELECT * FROM mysql.db WHERE user='usuario6' \G
	/*No aparece el usuario6 por que no tienen permisos sobre una base de datos AL COMPLETO
	de hecho ahora no tiene ningun permiso */	

	mysql> SELECT * FROM mysql.tables_priv WHERE user='usuario6' \G
	/*No aparece el usuario6 por que no tienen permisos sobre una tabla AL COMPLETO
	de hecho ahora no tiene ningun permiso */	

	mysql> SELECT * FROM mysql.columns_priv WHERE user='usuario6' \G
	/*No aparece el usuario6 por que no tienen permisos sobre ninguna columna, de hecho
	ahora no tiene ningun permiso */	
	
 
 

/*13. Muestra los privilegios o permisos que tiene asignado el usuario "usuario6@localhost".*/
  
	msql> SHOW GRANTS FOR usuario6@localhost;
 
 
 
 
/*14. Estando conectado como usuario "root". Añade los privilegios SELECT, INSERT y
DELETE al usuario "usuario6@localhost" en la tabla "alumasir2" de la BBDD "instituto".
Si no es posible explica por qué. Si ha sido posible debes comprobar que se han añadido los
privilegios.*/

	mysql> GRANT SELECT,INSERT,DELETE
		   ON instituto.alumasir2 TO usuario6@localhost;
	/*Si es posible ya que el usuario root tiene todos los permisos incluído el GRANT OPTIONS*/

	mysql> SHOW GRANTS FOR usuario6@localhost;




/*15. Renombra al usuario "usuario6@localhost" como "cuenta6@localhost".*/

	mysql> RENAME USER usuario6@localhost TO cuenta6@localhost;
	/*Utilizamos la cláusulas RENAME USER para cambiar el nombre a un usuario, la sintaxis es:
			RENAME USER antiguoUsuario@host TO nuevoUsuario@host;  */



/*16. Mostrar los campos user,host y password de la tabla user de la BBDD mysql.*/

	mysql> SELECT user, host,authentication_string 
		   FROM mysql.user;




/*17. ¿Tiene algún privilegio asignado el usuario "cuenta6@localhost"? ¿Cómo lo compruebas?.
Elimina definitivamente al usuario "cuenta6@localhost". ¿Sigue existiendo en la tabla
"user"? ¿Cómo lo compruebas*/

	/*Comprobamos los permisos asignados*/
	mysql> SHOW GRANTS FOR cuenta6@localhost;

	/*Eliminamos definitivamente al usuario cuenta6*/
	mysql> DROP USER cuenta6@localhost;

	/*Combrobamos que no aparece por que ya no existe como usuario en el servidor*/
	mysql> SELECT user, host,authentication_string 
		   FROM mysql.user
	       WHERE user='cuenta6';










/*######################################################################
########################################################################
####																####
####								ASGBD							####
####					PRÁCTICA 5    -    TEMA 13					####
####																####
########################################################################
######################################################################*/



/* 1. Conectarte localmente con el usuario "root" de forma corta y comprueba el usuario con el
que has entrado al servidor. */

	Shell> mysql -u root -p 
		   SELECT USER();



/* 2. Crear una cuenta de usuario llamada "usuario7@localhost" con contraseña "user7"
utilizando la sentencia CREATE USER. */

	mysql> CREATE USER 'usuario7'@'localhost' IDENTIFIED BY 'user7';
	/*Esta es una forma alternativa de crear usuarios introducida en MySQL a partir de la 
	versión 8.0. Cabe destacar que en dicha versión y superiores solo se pueden crear usuarios
	de esta forma, es decir, no podemos crear usuarios nuevos con la clausula GRANT
	
	Cabe destacar que hemos creado el usuario sin asignarle ningun permiso de momento, aun así
	todos los usuarios tienen por defecto desde el momento de su creación el permiso USAGE
	Recordemos que con este permiso básico solo podemos conectarnos al servidor y ejecutar 
	comandos informativos como: SELECT USER(), SHOW DATABASES o SHOW GRANTS FOR usuario7@localhost*/




/* 3. Mostrar los campos user, host y password de la tabla user de la BBDD mysql. */

	mysql> SELECT user, host, authentication_string 
		   FROM mysql.user;
	/*Comprobamos que aparece el usuario7 con su contraseña cifrada en la tabla*/



/* 4. Muestra la información de las tablas user, db, tables_priv y columns_priv relacionada con el
usuario "usuario7@localhost". */

	mysql> SELECT * FROM mysql.user WHERE user='usuario7' \G
	/*Comprobamos que aprece el usuario7 en la tabla user con los permisos globales en (N)*/

	mysql> SELECT * FROM mysql.db WHERE user='usuario7' \G
	/*Comprobamos que NO aprece el usuario7 en la tabla db por no tener permisos concedidos
	a nivel base de datos completa, de hecho no tiene ningun permiso concedido mas alla de USAGE*/

	mysql> SELECT * FROM mysql.tables_priv WHERE user='usuario7' \G
	/*Comprobamos que NO aprece el usuario7 en la tabla tables_priv por no tener permisos concedidos
	a nivel btabla completa, de hecho no tiene ningun permiso concedido mas alla de USAGE*/

	mysql> SELECT * FROM mysql.columns_priv WHERE user='usuario7' \G
	/*Comprobamos que NO aprece el usuario7 en la tabla columns_priv por no tener permisos concedidos
	a nivel columna, de hecho no tiene ningun permiso concedido mas alla de USAGE*/

	/*Como se nos pide mostrar todos los campos (*) debemos utilizar el modificador \G sin ; al final*/




/* 5. Muestra los privilegios o permisos que tiene asignado el usuario "usuario7@localhost". */

	mysql> SHOW GRANTS FOR usuario7@localhost;
	+----------------------------------------------+
	| Grants for usuario7@localhost                |
	+----------------------------------------------+
	| GRANT USAGE ON *.* TO 'usuario7'@'localhost' |
	+----------------------------------------------+
	/*Podemos comprobar que usuario7 solo tienen los permisos de USAGE que vienen asignados por
	defecto cuando creamos el usuario.
	Recordemos que con este permiso básico solo podemos conectarnos al servidor y ejecutar comandos 
	informativos como: SELECT USER(), SHOW DATABASES o SHOW GRANTS FOR usuario7@localhost*/




/* 6. ¿Qué sentencias puedes ejecutar en el servidor con el usuario "usuario7@localhost"?. */

/* Hemos creado al usuario "usuario7@localhost" sin asignarle ningun tipo de permisos por lo que
no podrá realizar ninguna operación en ninguna base de datos. Por defecto, todos los usuarios
tienen el permiso USAGE que les permite conectarse al servidor y ejecutar comandos informativos como:
SELECT USER(), SHOW DATABASES o SHOW GRANTS FOR usuario7@localhost */




/* 7. Estando conectado como usuario "root". Añade al usuario "usuario7@localhost" los
siguientes privilegios:*/

	/* a) SELECT a nivel global.*/
	mysql> GRANT SELECT ON *.* TO usuario7@localhost;

	/* b) INSERT a todas las tablas de la BBDD "instituto".*/
	mysql> GRANT INSERT ON instituto.* TO usuario7@localhost;

	/* c) DELETE a la tabla "alumasir2" de la BBDD "instituto".*/
	mysql> GRANT DELETE ON instituto.alumasir2 TO usuario7@localhost;

	/* d) UPDATE a la columna "nombre" de la tabla "alumasir1" de la BBDD "instituto". */
	mysql> GRANT UPDATE(nombre) ON instituto.alumasir1 TO usuario7@localhost;




/* 8. Muestra los privilegios o permisos que tiene asignado el usuario "usuario7@localhost" */

	mysql> SHOW GRANTS FOR usuario7@localhost;
	+----------------------------------------------------------------------------+
	| Grants for usuario7@localhost                                              |
	+----------------------------------------------------------------------------+
	| GRANT SELECT ON *.* TO 'usuario7'@'localhost'                              |
	| GRANT INSERT ON `instituto`.* TO 'usuario7'@'localhost'                    |
	| GRANT DELETE ON `instituto`.`alumasir2` TO 'usuario7'@'localhost'          |
	| GRANT UPDATE (nombre) ON `instituto`.`alumasir1` TO 'usuario7'@'localhost' |
	+----------------------------------------------------------------------------+



/* 9. Muestra la información de las tablas user, db, tables_priv y columns_priv relacionada con el
usuario "usuario7@localhost". */

	mysql> SELECT * FROM mysql.user WHERE user='usuario7' \G
	/*	        Host: localhost
                User: usuario7
           	Select_priv: Y
           	Insert_priv: N
           	Update_priv: N
           	Delete_priv: N
			...
			Observamos que solo tiene permisos globales para hacer SELECT */


	mysql> SELECT * FROM mysql.db WHERE user='usuario7' \G
	/*          Host: localhost
                Db: instituto
                User: usuario7
         	Select_priv: N
          	Insert_priv: Y
          	Update_priv: N
			...
			Observamos que solo tiene permisos de INSERT en la base de datos instituto*/


	mysql> SELECT * FROM mysql.tables_priv WHERE user='usuario7' \G
	/*		*************************** 1. row ***************************
				Host: localhost
				Db: instituto
				User: usuario7
			Table_name: alumasir2
			Grantor: root@localhost
			Timestamp: 0000-00-00 00:00:00
			Table_priv: Delete
			Column_priv:
			*************************** 2. row ***************************
				Host: localhost
				Db: instituto
				User: usuario7
			Table_name: alumasir1
			Grantor: root@localhost
			Timestamp: 0000-00-00 00:00:00
			Table_priv:
			Column_priv: Update
			...
			Observamos que nos muestra el permiso de DELETE a nivel de tabla
			y el permiso de UPDATE a nivel de columna*/


	mysql> SELECT * FROM mysql.columns_priv WHERE user='usuario7' \G
	/*			Host: localhost
				Db: instituto
				User: usuario7
			Table_name: alumasir1
			Column_name: nombre
			Timestamp: 0000-00-00 00:00:00
			Column_priv: Update
			...
			Observamos que nos muestra el permiso de UPDATE a nivel columna    */




/* 10. Elimina todos los permisos o privilegios del usuario "usuario7@localhost" que no tenga
asignados a nivel global. */

	mysql> REVOKE INSERT ON instituto.* FROM usuario7@localhost;

	mysql> REVOKE DELETE ON instituto.alumasir2 FROM usuario7@localhost;

	mysql> REVOKE UPDATE (nombre) ON instituto.alumasir1 FROM usuario7@localhost;



/* 11. Renombra al usuario "usuario7@localhost" y llamalo "cuenta7@localhost". */

	mysql> RENAME USER usuario7@localhost TO cuenta7@localhost;
	/*Utilizamos la cláusulas RENAME USER para cambiar el nombre a un usuario, la sintaxis es:
			RENAME USER antiguoUsuario@host TO nuevoUsuario@host;  */


/* 12. ¿Tiene algún privilegio asignado el usuario "cuenta7@localhost"? ¿Cómo lo compruebas?.
Elimina definitivamente al usuario "cuenta7@localhost". 
¿Sigue existiendo en la tabla "user"? ¿Cómo lo compruebas? */

	mysql> SHOW GRANTS FOR cuenta7@localhost;   
	+-----------------------------------------------+
	| Grants for usuario7@localhost                 |
	+-----------------------------------------------+
	| GRANT SELECT ON *.* TO 'usuario7'@'localhost' |
	+-----------------------------------------------+
	/* Comprobamos los permisos que le quedan con SHOW GRANTS FOR... y vemos que le quedan los
	globales ya que estos son los únicos que no hemos eliminado. */

	mysql> DROP USER cuenta7@localhost;
	/*Los usuarios son considerados como "objetos" dentro del servidor al igual que las tablas o las
	porpias bases de datos, por lo tanto eliminamos el usuario con DROP como cualquier otro objeto*/

	/*El usuario cuenta7 no aparece en la tabla user por que al borrarlo ya no existe en el servidor.
	Podemos comprobarlo haciendo un SELECT a la tabla user con la condición de 'cuenta7' o simplemente 
	hacer un SELECT sin condición y comprobar que el usuario ya no está*/
	mysql> SELECT * FROM mysql.user WHERE user='cuenta7' \G
	mysql> SELECT user, host authentication_string FROM mysql.user;




/* 13. Crear una cuenta de usuario llamada "usuario8localhost" y contraseña "user8" para acceder
en modo local con todos los privilegios o permisos sobre todas las tablas de todas las
BBDD, usando la sentencia GRANT. */

	mysql> GRANT ALL PRIVILEGES ON *.* TO usuario8@localhost 
	       IDENTIFIED BY 'user8';




/* 14. Conéctate como usuario "usuario8localhost" y crea un usuario nuevo llamado
"usuario9localhost" y contraseña "user9" con los mismos privilegios que el usuario
"usuario8localhost", usando la sentencia GRANT. Si no es posible explica por qué. */

	mysql> quit
	shell> mysql -u usuario8 -p
	mysql> SELECT USER();

	mysql> GRANT ALL PRIVILEGES ON *.* TO usuario9@localhost
		   IDENTIFIED by 'user9';  

	/* NO es posible porque el usuario "usuario8" no tiene permisos de GRANT OPTIONS
	GRANT OPTIONS otorga permiso al usuario para otorgar permisos a otros usuarios
	Recordemos que este es un permiso especial que no está incluído en ALL PRIVILEGES, si no que
	tiene que ser concedido específicamente añadiendo la línea WITH GRANT OPTIONS*/




/*15. Renombra al usuario "usuario8@localhost" como "cuenta8@localhost". Elimina al usuario
"cuenta8@localhost" y compruébalo. */

	/*Estamos como usuario8*/
	mysql> RENAME USER usuario8@localhost TO cuenta8@localhost;
	mysql> DROP USER cuenta8@localhost;
	mysql> SELECT user, host authentication_string FROM mysql.user;
	/*Como tenemos todos los privilegios podemos renombrarnos a nosotros mismos e incluso eliminar
	nuestra cuenta. Al comprobar la tabla user veremos que ya no existe y cuando hagamos exit ya
	no podremos acceder. */




/* 16. Conéctate como usuario "root" y crea una cuenta de usuario llamada "usuario8localhost" y
contraseña "user8" para acceder en modo local con todos los privilegios o permisos sobre
todas las tablas de todas las BBDD y con el permiso administrativo CREATE USER, usando
la sentencia GRANT. */

	mysql> quit
	shell> mysql -u root -p 
	mysql> SELECT USER();

	mysql> GRANT ALL PRIVILEGES ON *.* TO usuario8@localhost
		   IDENTIFIED BY'user8';

	mysql> GRANT CREATE USER ON *.* TO usuario8@localhost;

	/* CREATE USER es un "permiso administrativo" y los permisos administrativos siempre se 
	asignan a nivel global (*.*). CREATE USER ESTÁ diseñado específicmanete para permitir a los
	usuarios que lo poseen usar comandos de administración como: 
		CREATE USER, DROP USER, RENAME USER y REVOKE ALL PRIVILEGES
	Cabe destacar que si bien permite utilizar el comando REVOKE, sigue sin permitir usar GRANT*/



>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
OJO NO ESTÁN LOS EJERCICIOS 17 Y 18
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


/*Para resumir, primero elimina como root al usuario8 y ahora sigue en el ejercicio 19*/
/* 19. Conéctate como usuario "root" y crea una cuenta de usuario llamada "usuario8localhost" y
contraseña "user8" para acceder en modo local con todos los privilegios o permisos sobre
todas las tablas de todas las BBDD, con el permiso administrativo CREATE USER y de
manera que pueda transmitir eso privilegios a otros usuarios, usando la sentencia GRANT. */
	
	mysql> DROP USER usuario8@localhost;
	mysql> quit
	shell> mysql -u root -p 
	mysql> SELECT USER();

	mysql> GRANT ALL PRIVILEGES ON *.* TO usuario8@localhost
		   IDENTIFIED BY 'user8'
		   WITH GRANT OPTION;

	/* El enunciado nos pide que debemos crear usuario8 de manera que pueda transmitir permisos
	a otros usuarios por lo que debemos crearlo añadiendo la linea WITH GRANT OPTIONS. De esta
	manera no haría falta ejecutar también la liena de GRANT CREATE USER:
			GRANT CREATE USER ON *.* TO usuario8@localhost;
	Por que WITH GRANT OPTIONS ya incluye los permisos administrativos de CREATE USER */

	/* Comprobación */
	mysql> SHOW GRANTS FOR usuario8@localhost;
	+-------------------------------------------------------------------------+
	| Grants for usuario8@localhost                                           |
	+-------------------------------------------------------------------------+
	| GRANT ALL PRIVILEGES ON *.* TO 'usuario8'@'localhost' WITH GRANT OPTION |
	+-------------------------------------------------------------------------+




/* 20. Conéctate como usuario "usuario8localhost" y crea un usuario nuevo llamado
"usuario9localhost" y contraseña "user9" con los mismos privilegios que el usuario
"usuario8localhost", usando la sentencia GRANT. Si no es posible explica por qué.*/

	mysql> quit
	shell> mysql -u root -p 
	mysql> SELECT USER();

	mysql > GRANT ALL PRIVILEGES ON *.* TO usuario9@localhost
		    IDENTIFIED BY 'user9'
		    WITH GRANT OPTION;
	/*Si es posible por que el usuario8 tiene permisos de GRANT OPTION */




/* 21. Conéctate como usuario "root" y eliminale a los usuarios "usuario8localhost" y
"usuario9localhost" los privilegios INSERT,UPDATE y DELETE a nivel global.*/

	mysql> quit
	shell> mysql -u root -p 
	mysql> SELECT USER();
	mysql> REVOKE INSERT, UPDATE, DELETE ON *.* FROM usuario8@localhost;
	mysql> REVOKE INSERT, UPDATE, DELETE ON *.* FROM usuario9@localhost;




/* 22. Conéctate como usuario "usuario8localhost" y añadele al usuario "usuario9localhost" el
privilegio DELETE a nivel global. Si no es posible explica por qué.*/

	mysql> quit
	shell> mysql -u usuario8 -p
	mysql> SELECT USER();
	mysql> GRANT DELETE ON *.* TO usuario9@localhost;

	/*No es posible porque el usuario "usuario8@localhost" no tiene el privilegio DELETE, por tanto 
	no lo puede transmitir o asignar a otro usuario, es decir:
	GRANT OPTION habilita al usuario para otorgar permisos pero solo aquellos que el ya posee, NO 
	puede otorgar un permiso que el no tenga */




/*23. Conéctate como usuario "root" y añadele al usuario "usuario9localhost" el privilegio
DELETE a nivel global. Si no es posible explica por qué.*/

	mysql> quit
	shell> mysql -u usuario8 -p     /* Si */
	mysql> SELECT USER();
	mysql> GRANT DELETE ON *.* TO usuario9@localhost;
	/*Si es posible por que root tiene todos los permisos*/




/*24. Renombra a los usuarios "usuario8localhost" y "usuario9localhost", borralos y
compruébalo.*/

	mysql> RENAME USER usuario8@localhost TO cuenta8@localhost;
	mysql> RENAME USER usuario9@localhost TO cuenta9@localhost;
	mysql> SELECT user FROM mysql.user;
	+---------------+
	| user          |
	+---------------+
	| cuenta8       |
	| cuenta9       |
	| mysql.session |
	| mysql.sys     |
	| root          |
	| usuario1      |
	| usuario3      |
	| usuario4      |
	| usuario5      |
	+---------------+

	mysql> DROP USER cuenta8@localhost;
	mysql> DROP USER cuenta9@localhost;
	mysql> SELECT user FROM mysql.user;
	+---------------+
	| user          |
	+---------------+
	| mysql.session |
	| mysql.sys     |
	| root          |
	| usuario1      |
	| usuario3      |
	| usuario4      |
	| usuario5      |
	+---------------+






/*
DUDITAS
============================================================================================================

1. Hasta que versión va a preguntar??? 5.7.40???? 8.0????
2.
3.



LISTADO DE COMANDOS UTILIZADOS:
============================================================================================================

exit o quit
mysql -u root -p
SELECT user();
CREATE DATABASE curso;
use curso;

¿Cómo se llama la tabla qué almacena las cuentas de usuario?
	USER

¿A qué base de datos pertenece esa tabla?
	MYSQL

SELECT user, host, authentication_string FROM mysql.user;
SELECT * FROM mysql.user \G
SELECT * FROM mysql.db \G
SELECT * FROM mysql.tables_priv \G
SELECT * FROM mysql.columns_priv \G

INSERT INTO alumasir2 (nombre, notaiaweb, notaasgbd) VALUES ('Carlos Casas', 4, 5);
UPDATE alumnoasir2 SET notaiaweb = notaiaweb + 1;
DELETE FROM alumasir2 WHERE notaasgbd = 5;

DROP USER cuenta6@localhost;
DROP TABLE alumnos;
DROP DATABASE curso;

GRANT ALL PRIVILEGES ON *.* TO usuario8@localhost IDENTIFIED BY 'user8' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO usuario1@localhost IDENTIFIED BY 'usuario1';
GRANT CREATE USER ON *.* TO usuario8@localhost IDENTIFIED BY 'user8';

GRANT ALL PRIVILEGES ON curso.* TO usuario1@localhost IDENTIFIED BY 'usuario1';
GRANT ALL PRIVILEGES ON curso.alumnos TO usuario1@localhost IDENTIFIED BY 'usuario1';
GRANT SELECT ON *.* TO usuario2@localhost IDENTIFIED BY 'usuario2'; 
GRANT SELECT(nombre,apellido) ON curso.alumnos TO usuario2@localhost IDENTIFIED BY 'usuario2'; 
GRANT SELECT, UPDATE ON *.* TO usuario2@localhost IDENTIFIED BY 'usuario2'; 
GRANT SELECT(nombre,notalm), UPDATE (notaasgbd) ON instituto.alumasir1 TO usuario6@localhost IDENTIFIED BY 'user6';

	los privilegios que se pueden especificar para una tabla son 
	SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, GRANT OPTION, INDEX, ALTER.)

SHOW GRANTS FOR usuario1@localhost;

REVOKE UPDATE, DELETE ON instituto.alumasir2 FROM usuario5@localhost;
REVOKE SELECT(nombre,notaiaweb), UPDATE (notaasgbd) ON instituto.alumasir1 FROM usuario6@localhost;
REVOKE ALL PRIVILEGES ON instituto.alumasir1 FROM usuario6@localhost;

RENAME USER usuario6@localhost TO cuenta6@localhost;



*/

