/*1. Conectarse localmente con el usuario "root" de forma corta y después comprobar el usuario
con el que has entrado al servidor.*/

shell>mysql -u root
mysql>SELECT USER();




/*2. Contesta:
a) ¿Cómo se llama la tabla qué almacena las cuentas de usuario?*/

USER
/*b) ¿A qué base de datos pertenece esa tabla?*/

MYSQL


/*3. Mostrar usuario, host y password de todas las cuentas de ususario.*/

mysql>select user, host, authentication_string
      from mysql.user;



/*4. Crear una cuenta de usuario llamada "usuario1" y contraseña "usuario1" para acceder en
modo local con todos los privilegios o permisos sobre todas las tablas de todas las BBDD.*/

mysql> GRANT ALL PRIVILEGESON 
       ON *.*
       TO usuario1@localhost IDENTIFIED BY 'usuario';


/*5. Crear una cuenta de usuario llamada "usuario2" sin contraseña para acceder en modo local
con el permiso SELECT sobre todas las tablas de todas las BBDD.*/

        mysql> GRANT SELECT
				ON *.*
				TO usuario2@localhost;  /*  NO ES PSIBLE /*
				
	/*a partir de la version 5.7.40 con la instruccion GRAN NO se puede crear usuarios con contraseña */
				
					
				
		mysql>GRANT ALL PRIVILEGESON 
				ON *.*
				TO usuario2@localhost IDENTIFIED BY 'usuario'; /* LO CREAMOS CON CONTRASEÑA/*


/*6. Cuando se hace una conexión al servidor MySQL la identifica por el hostname. ¿Qué partes
tiene el hostname?*/


			-El host desde el cual se hace la conexion 
			es decir el nombre de maquina cliente  (o IP)
			desde donde nos conectamos 
			-El nombre de usuario.	




/*7. Mostrar usuario, host y password de todas las cuentas de ususario.*/



mysql>select user, host, authentication_string
      from mysql.user;

    (Versiones anterirores)
mysql>select user, host, password from mysql.user;


/*8. Investigar algún campo más de la tabla user de la BBDD mysql. Explica que información
muestran los siguientes campos: 
       A. select_priv: permte (Y), o no (N) consultar infirmacion de todas
						las tablas de todas las BBDD.
	   B. insert_priv:permte (Y), o no (N) insertar nuevos registros 
						en todas las tablas de todas las BBDD.
       c. delete_priv:permte (Y), o no (N)borrar egistros de todas 
					 en todas las tablas de todas las BBDD.*/



mysql>SELECT USER, host,
	select_privi, insert_privi, delete_privi
	FROM mysql.user;


mysql> SELECT * FROM mysql.user \G


/*9. Investigar los campos de la tabla db de la BBDD mysql. Explica que información muestran
los siguietes campos: select_priv, insert_priv y c. delete_priv.*/

     /* A. select_priv: permte (Y), o no (N) consultar infirmacion de todas
						las tablas de todas las BBDD.
	   B. insert_priv:permte (Y), o no (N) insertar nuevos registros 
						en todas las tablas de todas las BBDD.
       c. delete_priv:permte (Y), o no (N)borrar egistros de todas 
					 en todas las tablas de todas las BBDD.*/


mysql>select user, host, db,
	authentication_string, insert_privi, delete_privi
    from mysql.db;
	  
	  
	  
mysql> SELECT * FROM mysql.db \G



/*10. Muestra únicamente los privilegios o permisos que tiene asignado el usuario
"usuario2@localhost" */



mysql> SHOW GRANTS FOR  usuario1@localhost ;


mysql> SHOW GRANTS FOR  usuario2@localhost ;










