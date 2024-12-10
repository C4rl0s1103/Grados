
                                    /*==================================================================================*/
                                    /*==================================================================================*/
                                    /*=================================  PRACTICA 1 TEMA 9  ===========================*/
                                    /*==================================================================================*/
                                    /*==================================================================================*/




/* 1. Crear una vista llamada VISTA_EMPLEADOS que guarde los empleados cuyo apellido
empieza por 'MA' y su sueldo esté comprendido entre 1000 y 1500 euros. La vista debe
incluir los siguientes campos de la tabla empleados: EMP_NO, APELLIDO, OFICIO,
SALARIO y DEP_NO. */

/*Las vistas se crean siempre a partir de la salida de un SELECT precedido de la linea:
                CREATE VIEW "nombre_de_la_vista" AS    */

CREATE VIEW VISTA_EMPLEADOS AS
	SELECT emp_no, apellido, oficio, salario, dep_NO
	FROM empleados
	WHERE apellido LIKE "MA%" AND salario BETWEEN 1000 AND 1500;
	
/* los SELECT que entran son los del Tema 2 (condiciones básicas) y Tema 8 (joins básicas) */






/* 2. ¿Cuál es el resultado de la ejecución de esta sentencia SELECT * FROM
VISTA_EMPLEADOS? */

mysql> SELECT * FROM VISTA_EMPLEADOS;
+--------+----------+----------+---------+--------+
| emp_no | apellido | oficio   | salario | dep_NO |
+--------+----------+----------+---------+--------+
|   7654 | MARTIN   | VENDEDOR | 1500.00 |     30 |
+--------+----------+----------+---------+--------+
1 row in set (0.24 sec)







/* 3. Crear una vista llamada EMPLEADOS_TODOS que almacene los campos EMP_NO,
APELLIDO y OFICIO de la tabla EMPLEADOS y los campos DNOMBRE y
LOCALIDAD de la tabla DEPARTAMENTOS. Ordenada alfabeticamente por APELLIDO. */

/*Las vistas se crean siempre a partir de la salida de un SELECT precedido de la linea:
                CREATE VIEW "nombre_de_la_vista" AS    */


/*  OPCIÓN 1  */
CREATE view EMPLEADOS_TODOS AS
	SELECT emp_no, apellido, oficio, dnombre, localidad
	FROM EMPLEADOS e
	JOIN DEPARTAMENTOS d ON e.dep_no = d.dep_no
	ORDER BY apellido;


            Ó


/*  OPCIÓN 2  */
CREATE VIEW EMPLEADOS_TODOS AS
    SELECT e.EMP_NO, e.APELLIDO, e.OFICIO, d.DNOMBRE, d.LOCALIDAD
    FROM empleados e, departamentos d WHERE e.DEP_NO = d.DEP_NO
    ORDER BY e.APELLIDO;






/* 4. ¿Cuál es el resultado de la ejecución de esta sentencia SELECT * FROM
EMPLEADOS_TODOS? */

mysql> SELECT *
    -> FROM EMPLEADOS_TODOS;
+--------+----------+------------+---------------+-----------+
| emp_no | apellido | oficio     | dnombre       | localidad |
+--------+----------+------------+---------------+-----------+
|   7499 | ALONSO   | VENDEDOR   | VENTAS        | MADRID    |
|   7844 | CALVO    | VENDEDOR   | VENTAS        | MADRID    |
|   7698 | GARRIDO  | DIRECTOR   | VENTAS        | MADRID    |
|   7876 | GIL      | ANALISTA   | INVESTIGACION | VALENCIA  |
|   7900 | JIMENEZ  | EMPLEADO   | INVESTIGACION | VALENCIA  |
|   7521 | LOPEZ    | EMPLEADO   | CONTABILIDAD  | BARCELONA |
|   7654 | MARTIN   | VENDEDOR   | VENTAS        | MADRID    |
|   7782 | MARTINEZ | DIRECTOR   | CONTABILIDAD  | BARCELONA |
|   7839 | REY      | PRESIDENTE | CONTABILIDAD  | BARCELONA |
+--------+----------+------------+---------------+-----------+
9 rows in set (0.00 sec)








/* 5. Crear una vista llamada EMPLEADOS_MADRID que almacene los campos EMP_NO,
APELLIDO y OFICIO de la tabla EMPLEADOS y los campos DNOMBRE y
LOCALIDAD de la tabla DEPARTAMENTOS, únicamente de aquellos empleados que son
de MADRID. Ordenada alfabeticamente por APELLIDO. */


/*Las vistas se crean siempre a partir de la salida de un SELECT precedido de la linea:
                CREATE VIEW "nombre_de_la_vista" AS    */

/*  OPCIÓN 1  */
CREATE view EMPLEADOS_MADRID AS

	SELECT emp_no, apellido, oficio, dnombre, localidad
	FROM EMPLEADOS e
	JOIN DEPARTAMENTOS d ON e.dep_no = d.dep_no
	WHERE localidad = "MADRID"
	ORDER BY apellido; 


            ó


/*  OPCIÓN 2  */
CREATE VIEW EMPLEADOS_TODOS AS
    SELECT e.EMP_NO, e.APELLIDO, e.OFICIO, d.DNOMBRE, d.LOCALIDAD
    FROM empleados e, departamentos 
    WHERE e.DEP_NO = d.DEP_NO AND localidad = "MADRID"
    ORDER BY e.APELLIDO;









/* 6. ¿Cuál es el resultado de la ejecución de esta sentencia SELECT * FROM
EMPLEADOS_MADRID? */

mysql> SELECT *
    -> FROM EMPLEADOS_MADRID;
+--------+----------+----------+---------+-----------+
| emp_no | apellido | oficio   | dnombre | localidad |
+--------+----------+----------+---------+-----------+
|   7499 | ALONSO   | VENDEDOR | VENTAS  | MADRID    |
|   7844 | CALVO    | VENDEDOR | VENTAS  | MADRID    |
|   7698 | GARRIDO  | DIRECTOR | VENTAS  | MADRID    |
|   7654 | MARTIN   | VENDEDOR | VENTAS  | MADRID    |
+--------+----------+----------+---------+-----------+
4 rows in set (0.00 sec)








/* 7. Crear una vista llamada EMPLEADOS_TODOS_NULL que almacene los campos
EMP_NO, APELLIDO y OFICIO de la tabla EMPLEADOS y los campos DNOMBRE y
LOCALIDAD de la tabla DEPARTAMENTOS. Incluyendo los departamentos que no tienen
ningún empleado. Ordenada alfabeticamente por APELLIDO. */


/*   NO ENTRA   */






/* 8. ¿Cuál es el resultado de la ejecución de esta sentencia SELECT * FROM
EMPLEADOS_TODOS_NULL? */


/*   NO ENTRA   */






/* 9. Borra de la tabla EMPLEADOS a todos aquellos empleados cuyo oficio sea vendedor,
empleado o analista. Obligatoriamente debes trabajar a prueba de fallos, y cuando ya te
hayas asegurado que la operación que deseas realizar es correcta, debes ejecutar el comando
COMMIT y activar de nuevo el AUTOCOMMIT. */

/*Ejecutamos la sentencia para trabajar a prueba de fallos*/
mysql> SET AUTOCOMMIT = 0;

/*Consultamos el estado de la tabla antes de borrar*/
mysql> SELECT * FROM EMPLEADOS;
+--------+----------+------------+----------+------------+---------+----------+--------+
| EMP_NO | APELLIDO | OFICIO     | DIRECTOR | FECHA_ALTA | SALARIO | COMISION | DEP_NO |
+--------+----------+------------+----------+------------+---------+----------+--------+
|   7499 | ALONSO   | VENDEDOR   |     7698 | 1981-02-23 | 1400.00 |   400.00 |     30 |
|   7521 | LOPEZ    | EMPLEADO   |     7782 | 1981-05-08 | 1350.50 |     NULL |     10 |
|   7654 | MARTIN   | VENDEDOR   |     7698 | 1981-09-28 | 1500.00 |  1600.00 |     30 |
|   7698 | GARRIDO  | DIRECTOR   |     7839 | 1981-05-01 | 3850.12 |     NULL |     30 |
|   7782 | MARTINEZ | DIRECTOR   |     7839 | 1981-06-09 | 2450.00 |     NULL |     10 |
|   7839 | REY      | PRESIDENTE |     NULL | 1981-11-17 | 6000.00 |     NULL |     10 |
|   7844 | CALVO    | VENDEDOR   |     7698 | 1981-09-08 | 1800.00 |     0.00 |     30 |
|   7876 | GIL      | ANALISTA   |     7782 | 1982-05-06 | 3350.00 |     NULL |     20 |
|   7900 | JIMENEZ  | EMPLEADO   |     7782 | 1983-03-24 | 1400.00 |     NULL |     20 |
+--------+----------+------------+----------+------------+---------+----------+--------+
9 rows in set (0.00 sec)

/*Ejecutamos el delete*/
mysql> DELETE FROM empleados
    -> WHERE oficio IN ("vendedor", "empleado", "analista");
Query OK, 6 rows affected (0.03 sec)

/*Comprobamos que el resultado es el deseado*/
mysql> SELECT * FROM EMPLEADOS;
+--------+----------+------------+----------+------------+---------+----------+--------+
| EMP_NO | APELLIDO | OFICIO     | DIRECTOR | FECHA_ALTA | SALARIO | COMISION | DEP_NO |
+--------+----------+------------+----------+------------+---------+----------+--------+
|   7698 | GARRIDO  | DIRECTOR   |     7839 | 1981-05-01 | 3850.12 |     NULL |     30 |
|   7782 | MARTINEZ | DIRECTOR   |     7839 | 1981-06-09 | 2450.00 |     NULL |     10 |
|   7839 | REY      | PRESIDENTE |     NULL | 1981-11-17 | 6000.00 |     NULL |     10 |
+--------+----------+------------+----------+------------+---------+----------+--------+
3 rows in set (0.00 sec)

/*Una vez comprobado persistimos los cambios en la base de datos*/
mysql> COMMIT;
/*Si hubiera salido mal, hubiéramos podido ejecutar ROLLBACK por estar trabajando a prueba 
de fallos */

/*Volvemos a establecer el autocommit para dejar de trabajar a prueba de fallos*/
mysql> SET AUTOCOMMIT = 1;









/* 10. ¿Cuál es el resultado de la ejecución de esta sentencia SELECT * FROM
EMPLEADOS_TODOS? Coincide el resultado de este ejercicio con el resultado del
ejercicio 4. Si has contestado que no, explica por qué. */

============================================================================;
/* No es el mismo resultado ya que en el ejercicio anterior hemos eliminado de la tabla
EMPLEADOS todos los registros que tengan en el campo OFICIO los siguientes valores:
"vendedor", "empleado" y "analista". Por tanto la vista EMPLEADOS_TODOS se actualizará
con los datos actuales de la tabla mostrando los valores que resten  */
============================================================================;









/* 11. ¿Cuál es el resultado de la ejecución de esta sentencia SELECT * FROM
EMPLEADOS_MADRID? Coincide el resultado de este ejercicio con el resultado del
ejercicio 6. Si has contestado que no, explica por qué. */

============================================================================;
/* No es el mismo resultado ya que en el ejercicio anterior hemos eliminado de la tabla
EMPLEADOS todos los registros que tengan en el campo OFICIO los siguientes valores:
"vendedor", "empleado" y "analista". Por tanto la vista EMPLEADOS_TODOS se actualizará
con los datos actuales de la tabla mostrando los valores que resten, en este caso solo 
el director */
============================================================================;








/* 12. Lanzar el script “cargartablas.sql” desde mysql> */

SOURCE C:\cargatablas.sql
/* sustituír "C:/" por el directorio local en el que se encuentre el script en cada caso */

/*Forma corta o abreviada*/
\. C:\cargatablas.sql







/* 13. Crear una vista llamada EMPLEADOS_NO_DEP_20_40 que almacene todos los campos de
la tabla EMPLEADOS y los campos DNOMBRE y LOCALIDAD de la tabla
DEPARTAMENTOS, únicamente de aquellos empleados que no pertenezcan al
departamento 20 ni 40. Ordenada descendentemente por SALARIO. */

/*OPCIÓN 1*/
CREATE view EMPLEADOS_NO_DEP_20_40 AS
	SELECT emp_no, apellido, oficio, director, fecha_alta, salario, comision, e.dep_no, dnombre, localidad
	FROM EMPLEADOS e
	JOIN DEPARTAMENTOS d ON e.dep_no = d.dep_no
	WHERE e.dep_no NOT IN (20, 40)
	ORDER BY salario DESC;

/*OPCIÓN 2*/
CREATE VIEW EMPLEADOS_NO_DEP_20_40 AS
    SELECT e.EMP_NO, e.APELLIDO, e.OFICIO, d.DNOMBRE, d.LOCALIDAD
    FROM empleados e, departamentos d
    WHERE e.DEP_NO = d.DEP_NO AND e.dep_no NOT IN (20, 40)
    ORDER BY e.APELLIDO;


/* OPCIÓN 3
En lugar de escribir todos los campos de la tabla empleados, podríamos poner (e.*) */
	SELECT e.*, dnombre, localidad
	FROM EMPLEADOS e
	JOIN DEPARTAMENTOS d ON e.dep_no = d.dep_no
	WHERE e.dep_no NOT IN (20, 40)
	ORDER BY salario DESC;





/* 14. ¿Cuál es el resultado de la ejecución de esta sentencia SELECT * FROM
EMPLEADOS_NO_DEP_20_40? */

mysql> SELECT *
    -> FROM EMPLEADOS_NO_DEP_20_40;
+--------+----------+------------+----------+------------+---------+----------+--------+--------------+-----------+
| emp_no | apellido | oficio     | director | fecha_alta | salario | comision | dep_no | dnombre      | localidad |
+--------+----------+------------+----------+------------+---------+----------+--------+--------------+-----------+
|   7839 | REY      | PRESIDENTE |     NULL | 1981-11-17 | 6000.00 |     NULL |     10 | CONTABILIDAD | BARCELONA |
|   7698 | GARRIDO  | DIRECTOR   |     7839 | 1981-05-01 | 3850.12 |     NULL |     30 | VENTAS       | MADRID    |
|   7782 | MARTINEZ | DIRECTOR   |     7839 | 1981-06-09 | 2450.00 |     NULL |     10 | CONTABILIDAD | BARCELONA |
|   7844 | CALVO    | VENDEDOR   |     7698 | 1981-09-08 | 1800.00 |     0.00 |     30 | VENTAS       | MADRID    |
|   7654 | MARTIN   | VENDEDOR   |     7698 | 1981-09-28 | 1500.00 |  1600.00 |     30 | VENTAS       | MADRID    |
|   7499 | ALONSO   | VENDEDOR   |     7698 | 1981-02-23 | 1400.00 |   400.00 |     30 | VENTAS       | MADRID    |
|   7521 | LOPEZ    | EMPLEADO   |     7782 | 1981-05-08 | 1350.50 |     NULL |     10 | CONTABILIDAD | BARCELONA |
+--------+----------+------------+----------+------------+---------+----------+--------+--------------+-----------+
7 rows in set (0.00 sec)








/* 15. Inserta un registro en la tabla EMPLEADOS y otro en la tabla DEPARTAMENTOS.
Obligatoriamente debes trabajar a prueba de fallos, y cuando ya te hayas asegurado que la
operación que deseas realizar es correcta, debes ejecutar el comando COMMIT y activar de
nuevo el COMMIT. Los datos a insertar en cada una de las tablas son:

EMPLEADOS
EMP_NO 		APELLIDO 	OFICIO 		DIRECTOR 		FECHA_ALTA 		SALARIO 	COMISION 	DEP_NO
7922 		CASAS 		ANALISTA 	7782 			18/11/15 		2600 		NULL 		50

DEPARTAMENTOS
DEP_NO 		DNOMBRE 		LOCALIDAD
50 			INFORMATICA 	MADRID
*/

mysql> SET AUTOCOMMIT = 0;

/* Primero debemos ejecutar la inserción en la tabla departamentos para mantener la integridad referencial:
En la tabla empleados se hace referencia al número de departamento de la tabla departamentos por lo que no
se podría hacer referencia al departamento número 50 si este no existe primero en su tabla corespondiente */
/*OJO: los campos de tipo char, varchar y fecha van entre comillas. El formato de la fecha es: AAAA/MM/DD*/

INSERT INTO DEPARTAMENTOS (dep_no, dnombre, localidad)
VALUES  (50, "INFORMATICA", "MADRID");

INSERT INTO EMPLEADOS (emp_no, apellido, oficio, director, fecha_alta, salario, comision, dep_no)
VALUES  (7922, "CASAS", "ANALISTA", 7782, "18/11/15", 2600, NULL, 50);

/* Cabe destacar que podríamos haber omitido nombrar todos los campos de la tabla en la sentencia de
inserción de datos ya que si dicha sentencia va a insertar un valor en cada uno de los campos sin excepción
no hace falta nombrarlos todos pero si seguir el orden en la declaración de los valores, es decir, las 
instrucciones podrían haber sido simplificadas así:

INSERT INTO DEPARTAMENTOS 
VALUES  (50, "INFORMATICA", "MADRID");

INSERT INTO EMPLEADOS 
VALUES  (7922, "CASAS", "ANALISTA", 7782, "18/11/15", 2600, NULL, 50);

*/

/*Comprobamos que el resultado sea el deseado y persistimos la informacón en la base dedatos con commit*/
mysql> COMMIT;
/*Si hubiera salido mal, hubiéramos podido ejecutar ROLLBACK por estar trabajando a prueba de fallos*/

/*Restablecemos el autocommit para dejar de trabajar a prueba de fallos */
mysql> SET AUTOCOMMIT = 1;








/* 16. Incrementa en 100 euros el salario de todos los empleados cuyo salario es inferior a 1500
euros. Obligatoriamente debes trabajar a prueba de fallos, y cuando ya te hayas asegurado
que la operación que deseas realizar es correcta, debes ejecutar el comando COMMIT y
activar de nuevo el COMMIT. */

/*Ejecutamos la sentencia para trabajar a prueba de fallos*/
mysql> SET AUTOCOMMIT = 0;

/*Hacemos el update*/
UPDATE EMPLEADOS
SET salario = salario+100
WHERE salario < 1500;

/*Una vez comprobado persistimos los cambios en la base de datos*/
mysql> COMMIT;
/*Si hubiera salido mal, hubiéramos podido ejecutar ROLLBACK por estar trabajando a prueba de fallos */

/*Restablecemos el autocommit para dejar de trabajar a prueba de fallos*/
mysql> SET AUTOCOMMIT = 1;







/* 17. ¿Cuál es el resultado de la ejecución de esta sentencia SELECT * FROM
EMPLEADOS_NO_DEP_20_40? Coincide el resultado de este ejercicio con el resultado
del ejercicio 14. Si has contestado que no, explica por qué. */

============================================================================;
/* No es el mismo resultado ya que en el ejercicio anterior hemos incluído un registro nuevo
con departamento 50 y en el siguiente hemos modificado los salarios incrementando algunos de
ellos en 100€". Por tanto la vista EMPLEADOS_NO_DEP_20_40 se actualizará
con los datos nuevos de la tabla mostrando los valores mas recientes */
============================================================================;








/* 18. Borra de forma permanente la tabla EMPLEADOS. ¿Es posible? Si has constestado que no
explica por qué y borra otra u otras tablas (las mínimas posibles), si es neceario, hasta que
consigas borrar de forma permanente la tabla EMPLEADOS. No debes borrar ninguna vista. */

mysql> show create table empleados \G
*************************** 1. row ***************************
       Table: empleados
Create Table: CREATE TABLE `empleados` (
  `EMP_NO` int(4) NOT NULL,
  `APELLIDO` varchar(8) DEFAULT NULL,
  `OFICIO` varchar(10) DEFAULT NULL,
  `DIRECTOR` int(4) DEFAULT NULL,
  `FECHA_ALTA` date DEFAULT NULL,
  `SALARIO` float(6,2) DEFAULT NULL,
  `COMISION` float(6,2) DEFAULT NULL,
  `DEP_NO` int(2) DEFAULT NULL,
  PRIMARY KEY (`EMP_NO`),
  KEY `FK_EMP_DIRECTOR` (`DIRECTOR`),
  KEY `FK_EMP_DEP_NO` (`DEP_NO`),
  CONSTRAINT `FK_EMP_DEP_NO` FOREIGN KEY (`DEP_NO`) REFERENCES `departamentos` (`DEP_NO`),
  CONSTRAINT `FK_EMP_DIRECTOR` FOREIGN KEY (`DIRECTOR`) REFERENCES `empleados` (`EMP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
1 row in set (0.00 sec)

DROP TABLE pedidos;
DROP TABLE clientes;
DROP TABLE empleados;

/*       --------------------------    */








/* 19. Después de realizar el ejercicio 18 muestra las tablas de la Base de Datos (BD) “curso”, a
través del comando SQL correspondiente. Escribe el nombre de cada una de las tablas que
han quedado en la BD “curso”. */

mysql> SHOW TABLES;
+------------------------+
| Tables_in_curso        |
+------------------------+
| departamentos          |
| empleados_madrid       |
| empleados_no_dep_20_40 |
| empleados_todos        |
| productos              |
| vista_empleados        |
+------------------------+
6 rows in set (0.00 sec)








/* 20. ¿Cuál es el resultado de la ejecución de esta sentencia SELECT * FROM
EMPLEADOS_NO_DEP_20_40? Coincide el resultado de este ejercicio con el resultado
del ejercicio 17. Si has contestado que no, explica por qué. */

SELECT * FROM EMPLEADOS_NO_DEP_20_40;
/* Ya no se puede consultar ya que la tabla a la que referenciaba no existe*/





/* 21. Borra de forma permanente la vista EMPLEADOS_NO_DEP_20_40. ¿Es posible? Si has
constestado que no explica por qué. */

DROP VIEW EMPLEADOS_NO_DEP_20_40;





/* 22. Lanzar el script “cargartablas.sql” desde mysql> */

SOURCE C:/cargatablas.sql
/* sustituír "C:/" por el directorio local en el que se encuentre el script en cada caso */








                                                    /*==================================================================================*/
                                                    /*==================================================================================*/
                                                    /*=================================  PRACTICA 1 TEMA 10  ===========================*/
                                                    /*==================================================================================*/
                                                    /*==================================================================================*/
                                                                            /* Apuntes bloque III páginas 17 y 18 */



/*1. Conectarse localmente con el usuario invitado.*/

/* NO ENTRA "CONECTARSE CON EL USUARIO INVITADO */


/*2. Comprobar el usuario con el que has entrado al servidor y desconectarte del servidor.*/

    mysql> SELECT USER();
    mysql> EXIT
    shell>


/*3. Conectarse localmente con el usuario "root" de varias formas:*/

/* En nuestro caso el directorio de instalación en el que se encuentra el fichero ejecutable mysql.exe es:  
                             C:\Wamp\bin\mysql\mysql5.7.40\bin 
Desde CMD nos situamos en dicho directorio y a partir de aquí podemos comenzar*/

    /*a) Forma larga sin incluir la opción de contraseña*/
        shell> cd C:\Wamp\bin\mysql\mysql5.7.40\bin\mysql -u root -p
        mysql> SELECT USER();
        mysql> EXIT
        shell> 

    /*b) Forma larga incluyendo la opción de contraseña*/
        shell> cd C:\Wamp\bin\mysql\mysql5.7.40\bin\mysql -u root -p P@ssw0rd
        mysql> SELECT USER();
        mysql> EXIT
        shell> 

    /*c) Forma corta sin incluir la opción de contraseña*/
        shell> mysql -u root -p
        mysql> SELECT USER();
        mysql> EXIT
        shell> 

    /*d) Forma corta incluyendo la opción de contraseña*/
        shell> mysql -u root -p P@ssw0rd
        mysql> SELECT USER();
        mysql> EXIT
        shell>

    /*e) Otra forma corta sin incluir la opción de contraseña*/

    /*f) Otra forma corta incluyendo la opción de contraseña*/


/*En cada apartado debes comprobar el usuario con el que has entrado al servidor y
desconectarte.*/








                                            /*==================================================================================*/
                                            /*==================================================================================*/
                                            /*=================================  PRACTICA 2 TEMA 10  ===========================*/
                                            /*==================================================================================*/
                                            /*==================================================================================*/
                    /* uso de la opción [-e] durante el comando de conexión a la base de datos descrito en los apuntes bloque III páginas 17 y 18 */
                                                /*Utilizamos la opción [-e] durante el comando de conexión a la base de datos
                                                para pasarle entre comillas la sentencia que queremos ejecutar justo después
                                                de conectarnos. No olvides el punto y coma, si queremos ejecutar dos sentencias
                                                simplemente las separamos con un espacio, cada una terminada con su ";"  */



/*1. Mostrar las BBDD del usuario invitado, desde la línea de comandos o el modo consola.*/

/* NO ENTRA "CONECTARSE CON EL USUARIO INVITADO */





/*2. Mostrar las BBDD del usurario "root", desde la línea de comandos o el modo consola.*/

shell> mysql -u root -p -e "show databases;"
shell>
/*Utilizamos la opción -e para pasarle entre comillas la sentencia que queremos ejecutar
una vez que nos hemos conectado. No olvides el punto y coma, si queremos ejecutar dos sentencias
simplemente las separamos con un espacio, cada una terminada con su ";"  */






/*3. Mostrar las tablas de la BBDD "information_schema", desde la línea de comandos o el
modo consola.*/

shell> mysql -u root -p -e "use information_schema; show tables;"
shell> 
/*Utilizamos la opción -e para pasarle entre comillas la sentencia que queremos ejecutar
una vez que nos hemos conectado. No olvides el punto y coma, si queremos ejecutar dos sentencias
simplemente las separamos con un espacio, cada una terminada con su ";"  */

/*Otras opciones son:*/
/*1*/
    shell> mysql -u root -p information_schema -e "show tables;"
    shell> 
/*2*/
    shell> mysql -u root information_schema -e "show tables;"
    shell> 





/*4. Mostrar las tablas de la BBDD "curso" del usuario root, desde la línea de comandos.*/

shell> mysql -u root -p -e "use curso; show tables;"
shell> 
/*Utilizamos la opción -e para pasarle entre comillas la sentencia que queremos ejecutar
una vez que nos hemos conectado. No olvides el punto y coma, si queremos ejecutar dos sentencias
simplemente las separamos con un espacio, cada una terminada con su ";"  */

/*Otras opciones son:*/
/*1*/
    shell> mysql -u root -p curso -e "show tables;"
    shell> 
/*2*/
    shell> mysql -u root curso -e "show tables;"
    shell> 








/*5. Conectarse como usuario root y acceder directamente a la BBDD "curso", desde la línea de
comandos.*/

shell> mysql -u root -p curso
mysql>
/*Utilizamos la opción -e para pasarle entre comillas la sentencia que queremos ejecutar
una vez que nos hemos conectado. No olvides el punto y coma, si queremos ejecutar dos sentencias
simplemente las separamos con un espacio, cada una terminada con su ";"  */

/*Otra opcion es:*/
    shell> mysql -u root curso
    mysql> 









/*6. Conectarse como usuario root y mostrar las tablas de la BBDD curso, desde la línea de
comandos.*/

shell> mysql -u root -p -e "use curso; show tables;"
/*Utilizamos la opción -e para pasarle entre comillas la sentencia que queremos ejecutar
una vez que nos hemos conectado. No olvides el punto y coma, si queremos ejecutar dos sentencias
simplemente las separamos con un espacio, cada una terminada con su ";"  */

/*Otras opciones son:*/
/*1*/
    shell> mysql -u root -p curso -e "show tables;"
    shell> 
/*2*/
    shell> mysql -u root curso -e "show tables;"
    shell> 








/*7. Conectarse como usuario root y acceder directamente a la BBDD "test", desde la línea de
comandos. A continuación desde el servidor muestra los datos de los empleados cuyo oficio es
vendedor de la tabla empleados de la BBDD "curso" (recuerda que la BBDD que está en uso es
"test" y no lo debes cambiar). Finalmente debes desconectarte del servidor.*/

/* Nos conectamos como root */
shell> mysql -u root -p 


/* Antes de nada, creamos la base de datos "test" */
mysql> DROP DATABASE IF EXIST;
mysql> CREATE DATABASE test;
mysql> SHOW DATABASES;

/* Ahora salimos para realizar el ejercicio desde el principio */
shell> exit

/*hacemos el ejercicio*/
shell> mysql -u root -p test   /*shell> mysql -u root test*/
mysql> SELECT * FROM curso.empleados WHERE oficio = "vendedor"; 
mysql> exit
shell>

/* OJO: Consultamos la tabla curso desde la tabla test, por eso especificamos "curso.empleados" */






/*8. Realizar todo el ejercicio anterior desde la línea de comandos o el modo consola.*/


/* Ahora salimos para realizar el ejercicio desde el principio */
shell> mysql -u root -p -e "use test; SELECT * FROM curso.empleados WHERE oficio='vendedor'; exit"
shell> 


/* OJO: Utilizamos la opción -e para pasarle entre comillas la sentencia que queremos ejecutar
una vez que nos hemos conectado. No olvides el punto y coma, si queremos ejecutar dos sentencias
simplemente las separamos con un espacio, cada una terminada con su ";"  */

/* OJO 2: Consultamos la tabla curso desde la tabla test, por eso especificamos "curso.empleados" */

/* OJO 3: en la condición WHERE de la consulta, tenemos que usar comillas simples ya que la consulta
completa ya está dentro de comillas dobles. */

/*Otras opciones son:*/
/*1*/
    shell> mysql -u root -p curso -e "SELECT * FROM curso.empleados WHERE oficio='vendedor'; exit"
    shell> 
/*2*/
    shell> mysql -u root curso -e "SELECT * FROM curso.empleados WHERE oficio='vendedor'; exit"
    shell>




                                            /*==================================================================================*/
                                            /*==================================================================================*/
                                            /*=================================  PRACTICA 3 TEMA 10  ===========================*/
                                            /*==================================================================================*/
                                            /*==================================================================================*/
                                                                        /* Apuntes bloque III página 29 */




/*   Ejercicio 1  
Conectarse localmente con el usuario "invitado" y a la vez lanzar el script
"archivo_batch.sql" desde el cliente en modo consola mysql. ¿Es posible? Si has contestado
que no explica por qué. */


/* NO ENTRA "CONECTARSE CON EL USUARIO INVITADO" */










/*   Ejercicio 2  
Conectarse localmente con el usuario "root" y a la vez lanzar el script "archivo_batch.sql"
desde el cliente en modo consola mysql. ¿Es posible? Si has contestado que no explica por
qué.
 */

/* Suponemos que estamos en cmd y situados en el directorio donde se encuentra mysql.exe */
shell> mysql -u root -p -e "source C:\archivo_batch.sql"
shell> 

/* OJO: Utilizamos la opción -e para pasarle entre comillas la sentencia que queremos ejecutar
una vez que nos hemos conectado. El comando source sirve para ejecutar un script desde dentro
del servidor y no necesita el símbolo ; al final. La alternativa a source es \. */

/*Como opción alternativa podemos ejecutar el script con el símbolo < desde la consola*/

shell> mysql -u root -p < C:\archivo_batch.sql
shell> 

/*Obviamente en este caso, sobra la opción -e, las comillas que acompañaban a la sentencia y el
comando source que solo es necesario para ejecutar el script "desde dentro del servidor" pero no
desde consola ya que es sustituído por el símbolo "<" */









/*   Ejercicio 3  
Conectarse localmente con el usuario "root" y a la vez lanzar el script "archivo_batch.sql"
desde el cliente en modo consola mysql y guardar la salida en el fichero
"C:\salida_script_ejer3.txt". ¿Es posible? Si has contestado que no explica por qué.
*/

/* Suponemos que estamos en el directorio donde se encuentra mysql.exe */
shell> mysql -u root -p < C:\archivo_batch.sql > C:\salida_script_ejer3.txt
shell> 

/*OJO: Utilizamos el símbolo menor "<" para ejecutar el script desde la consola y el símbolo mayor ">"
para redirigir la salida del script al fichero con el nombre elegido.*/










/*   Ejercicio 4  
Conectarse localmente con el usuario "invitado" y a la vez lanzar el script
"archivo_batch_con_error.sql" desde el cliente en modo consola mysql. ¿Es posible? Si has
contestado que no explica por qué.
*/

/* NO ENTRA "CONECTARSE CON EL USUARIO INVITADO" */











/*   Ejercicio 5  
Conectarse localmente con el usuario "root" y a la vez lanzar el script
"archivo_batch_con_error.sql" desde el cliente en modo consola mysql. ¿Es posible? Si has
contestado que no explica por qué.
*/

shell> mysql -u root -p < C:/archivo_batch_con_error.sql
shell> 
/* No es posible porque alguna sentencia del script tiene algun error 
deberíamos ejecutar el script con la opción --force para que lo ignore */










/*   Ejercicio 6
Es posible lanzar el script "archivo_batch_con_error.sql"desde el cliente en modo consola
mysql sin que se pare la ejecución del script? Si es posible indica el comando completo.
*/

/*Opción 1*/
shell> mysql -u root -p --force < C:/archivo_batch_con_error.sql
shell> 

o

/*Opción 2*/
shell> mysql -uroot -p -f < C:/archivo_batch_con_error.sql
shell> 

/*La opción --force o -f continúa la ejecución del script aunque surjan fallos durante la misma*/








/*   Ejercicio 7  
Conectarse localmente con el usuario "invitado". Comprobar el usuario con el que has
entrado. Lanzar el script "archivo_batch.sql" desde el servidor. ¿Es posible? Si has
contestado que no explica por qué. desconectarte del servidor.
*/

/* NO ENTRA "CONECTARSE CON EL USUARIO INVITADO" */








/*   Ejercicio 8  
Conectarse localmente con el usuario "root". Comprobar el usuario con el que has entrado.
Lanzar el script "archivo_batch_con_error.sql" desde el servidor. ¿Es posible? Si has contestado que no
explica por qué. Desconectarte del servidor. Conectarse localmente con el usuario invitado.
*/

shell> mysql -u root -p 
mysql> select user();
mysql> source C:/archivo_batch_con_error.sql /* Forma tradicional */

o

mysql> \. C:/archivo_batch_con_error.sql /* Forma abreviada */
mysql> exit

/* Si se puede ejecutar. Al haber errores de sintaxis, el servidor nos avisa con el mensje:

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds 
to your MySQL server version for the right syntax to use near 'DE departamentos' at line 1

pero continúa con la ejecución de la misma forma que si hubiéramos ejecutado el script desde 
consola con la opción --force o -f
*/






                                                    /*==================================================================================*/
                                                    /*==================================================================================*/
                                                    /*=================================  PRACTICA 1 TEMA 11  ===========================*/
                                                    /*==================================================================================*/
                                                    /*==================================================================================*/


/*   Ejercicio 1  
accede a el servidor MySQL en el panel de wamp. A continuación desde una consola de MSDOS conéctate 
como usuario “root” y comprueba que has entrado como usuario “root”.
*/

shell> mysql -u root -p 
mysql> select user();









/*   Ejercicio 2  
Crea una BBDD llamada “mi_club”. Dentro de la BBDD “mi_club”, crea dos tablas:
“cuotas” y “socios”. La estructura y los datos de cada una de las tablas son:
 */

/*Resuelto en el script de carmen con nombre:
    Script_Carmen_solucion_practica1_tema_11.sql
*/








/*   Ejercicio 3  
Crea un script llamado “ejercicio2_practica1_tema11_mysql.sql”. Dicho script lo debes
almacenar en C:\tema11.
*/

/*El fichero está almacenado en C:\ pero se llama  Script_Carmen_solucion_practica1_tema_11.sql */





/*   Ejercicio 4  
Desconéctate del servidor. Conéctate localmente con el usuario "root" y a la vez lanza el
script "C:\tema11\ejercicio2_practica1_tema11_mysql .sql" desde el cliente en modo
consola mysql, sin que se para la ejecución del script, aunque hubiese algún error . ¿Es
posible? Si has contestado que no explica por qué.
*/

exit
/* Abrimos CMD desde la ubicación de mysql.exe y nos conectamos al servidor ejecutando el 
script con "<" ignorando fallos con --force o -f*/
shell> mysql -u root -p --force < C:/Script_Carmen_solucion_practica1_tema_11.sql
shell> 








/*   Ejercicio 5  
Conéctate como usuario “root” y comprueba que has entrado como usuario “root”. A
continuación lanza el script "C:\tema11\ejercicio2_practica1_tema11_mysql.sql" desde el
servidor. ¿Es posible? Si has contestado que no explica por qué. 
*/

shell> mysql -u root -p
mysql> select user()
mysql> source ruta_del_script.sql

O

mysql> \. ruta_del_script.sql

/* Para lanzar el script desde el servidor mysql utilizamos el comando "source" o su forma
abreviada "\."   */









/*   Ejercicio 6
¿De qué tipo son las tablas de la BBDD “mi_club”? ¿Qué caracteres entienden?
Obligatoriamente debes incluir los comandos que permiten mostrar la información anterior
*/

/*Para conseguir esta información debemos consultar como fueron creadas las tablas con los
siguientes comandos*/

/*en caso de tener la base de datos mi_club en uso*/
show create table cuotas \G
show create table socios \G

/*en caso de NO tener la base de datos mi_club en uso*/
show create table mi_club.cuotas \G
show create table mi_club.socios \G

/*El resultado de la ejecución del comando para la tabla cuotas es el siguiente: */
mysql> show create table cuotas \G
*************************** 1. row ***************************
       Table: cuotas
Create Table: CREATE TABLE `cuotas` (
  `codigo_actividad` char(4) NOT NULL,
  `pago` enum('mensual','anual') NOT NULL DEFAULT 'mensual',
  `actividad` varchar(20) NOT NULL,
  `precio` float(7,2) NOT NULL,
  PRIMARY KEY (`codigo_actividad`,`pago`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1
1 row in set (0.00 sec)


/*El resultado de la ejecución del comando para la tabla socios es el siguiente: */
mysql> show create table socios \G
*************************** 1. row ***************************
       Table: socios
Create Table: CREATE TABLE `socios` (
  `num_socio` int(4) NOT NULL AUTO_INCREMENT,
  `codigo_actividad` char(4) NOT NULL,
  `pago` enum('mensual','anual') NOT NULL DEFAULT 'mensual',
  `nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`num_socio`,`codigo_actividad`),
  KEY `FK_SOCIOS_CUOTAS` (`codigo_actividad`)
) ENGINE=MyISAM AUTO_INCREMENT=1003 DEFAULT CHARSET=latin1
1 row in set (0.00 sec)


/*
Como podemos observar, el comando show create table nombre_tabla nos muestra información 
detallada sobre la estructura de la tabla seleccionada como:
    - El tipo de dato para sus campos,
    - El tipo de tabla (referido con la palabra ENGINE)
    - El tipo de caracteres que entiende (referido con la palabra CHARSET)
En este caso figura ENGINE=MyISAM y CHARSET=latin1 por lo que concluímos que las tablas de la
base de datos "mi_club" son de tipo "MyISAM" y los caracteres que entiende son "latin1"

OJO: POR DEFECTO el tipo de tablas en esta versión de mysql es MyISAM y los datos que estas
pueden reconocer son "latin1"
*/







                                                                                            /*==================================================================================*/
                                                                                            /*==================================================================================*/
                                                                                            /*=================================  PRACTICA 1 TEMA 12  ===========================*/
                                                                                            /*==================================================================================*/
                                                                                            /*==================================================================================*/
                                                                                                        /*Apuntes bloque III desde la página 32 a la página 39.*/





/*
1. Arranca el servidor MySQL en el panel de wamp. A continuación desde una consola de MSDOS
conéctate como usuario “root” y comprueba que has entrado como usuario “root”.
*/

/*Nos situamos en el directorio deonde tenemos el .exe de mysql*/
shell> mysql -u root -p
mysql> SELECT USER();

/*El resultado de la ejecución de la sentencia select user() es el siguiente: */
+----------------+
| user()         |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.00 sec)
/* Nos informa de cual es el usuario con el cual estamos conectados al servidor mysql */










/*
2. Ejecuta o lanza el script "C:\tema11\ejercicio2_practica1_tema11_mysql.sql" desde el
servidor. ¿Es posible? Si has contestado que no explica por qué.
*/

/*El fichero está almacenado en C:\ pero se llama  Script_Carmen_solucion_practica1_tema_11.sql */
source C:\Script_Carmen_solucion_practica1_tema_11.sql
/*Recordemos que [\.] puede sustituír a [source] */













/*
3. ¿De qué tipo son las tablas de la BBDD “mi_club”? ¿Qué caracteres entienden?
Obligatoriamente debes incluir los comandos que permiten mostrar la información anterior.
*/


/*Igual que el ejercicio 6 del tema anterior... Carmen es mas pesada que un collar de melones...*/

/*Para conseguir la información soliditada en el enunciado sobre las tablas de la base de datos 
my_club debemos consultar como fueron creadas las tablas con los siguientes comandos*/

/*en caso de tener la base de datos mi_club en uso*/
show create table cuotas \G
show create table socios \G
/*en caso de NO tener la base de datos mi_club en uso*/
show create table mi_club.cuotas \G
show create table mi_club.socios \G

/*El resultado de la ejecución del comando para la tabla cuotas es el siguiente: */
mysql> show create table cuotas \G
*************************** 1. row ***************************
       Table: cuotas
Create Table: CREATE TABLE `cuotas` (
  `codigo_actividad` char(4) NOT NULL,
  `pago` enum('mensual','anual') NOT NULL DEFAULT 'mensual',
  `actividad` varchar(20) NOT NULL,
  `precio` float(7,2) NOT NULL,
  PRIMARY KEY (`codigo_actividad`,`pago`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1
1 row in set (0.00 sec)


/*El resultado de la ejecución del comando para la tabla socios es el siguiente: */
mysql> show create table socios \G
*************************** 1. row ***************************
       Table: socios
Create Table: CREATE TABLE `socios` (
  `num_socio` int(4) NOT NULL AUTO_INCREMENT,
  `codigo_actividad` char(4) NOT NULL,
  `pago` enum('mensual','anual') NOT NULL DEFAULT 'mensual',
  `nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`num_socio`,`codigo_actividad`),
  KEY `FK_SOCIOS_CUOTAS` (`codigo_actividad`)
) ENGINE=MyISAM AUTO_INCREMENT=1003 DEFAULT CHARSET=latin1
1 row in set (0.00 sec)

/*
Como podemos observar, el comando show create table nombre_tabla nos muestra información 
detallada sobre la estructura de la tabla seleccionada como:
    - El tipo de dato para sus campos,
    - El tipo de tabla (referido con la palabra ENGINE)
    - El tipo de caracteres que entiende (referido con la palabra CHARSET)
En este caso figura ENGINE=MyISAM y CHARSET=latin1 por lo que concluímos que las tablas de la
base de datos "mi_club" son de tipo "MyISAM" y los caracteres que entiende son "latin1"

OJO: POR DEFECTO el tipo de tablas en esta versión de mysql es MyISAM y los datos que estas
pueden reconocer son "latin1"
*/











/*
4. Crea un nuevo script "C:\tema12\InnoDB_latin1_practica1_tema12_mysql.sql" y lanzalo
desde el servidor. Obligatoriamente este nuevo script debe incluir para cada una de las
tablas:el tipo de tabla (InnoDB) y el tipo de caracteres que entiende (latin1) a través de la
línea ENGINE = InnoDB CHARACTER SET 'latin1'.
*/


/*Cogemos como base el script de caremen y lo modificamos de la siguiente forma:
    - Añadimos la linea ENGINE = InnoDB CHARACTER SET 'latin1' como la última linea
        de la creacion de la tabla y cerramos con ;
    - Cambiamos el nombre al script de carmen modificado por el que nos dice el enunciado.

La linea añadida al final de la sentencia de creación de la tabla quedaría tal que así:
*/
CREATE TABLE cuotas
( codigo_actividad 	CHAR(4) NOT NULL,
  pago 		ENUM('mensual','anual') NOT NULL DEFAULT 'mensual',
  actividad VARCHAR(20) NOT NULL,
  precio	FLOAT(7,2) NOT NULL,
CONSTRAINT PK_CUOTAS PRIMARY KEY (codigo_actividad,pago))
  ENGINE = InnoDB CHARACTER SET 'latin1'; 

/* Ahora ejecutamos el script */
mysql> source C:\tema12\InnoDB_latin1_practica1_tema12_mysql.sql /*Forma normal*/
                         ó
mysql> C:\tema12\InnoDB_latin1_practica1_tema12_mysql.sql  /*Forma abreviada*/













/*
5. ¿De qué tipo son las tablas de la BBDD “mi_club”? ¿Qué caracteres entienden?
Obligatoriamente debes incluir los comandos que permiten mostrar la información anterior.
*/


/*En este caso ejecutamos de nuevo las sentencias para consultar los datos de la tabla*/

/*en caso de tener la base de datos mi_club en uso*/
show create table cuotas \G
show create table socios \G

/*en caso de NO tener la base de datos mi_club en uso*/
show create table mi_club.cuotas \G
show create table mi_club.socios \G

/*El resultado de la ejecución del comando para la tabla cuotas es el siguiente: */
mysql> show create table cuotas \G
*************************** 1. row ***************************
       Table: cuotas
Create Table: CREATE TABLE `cuotas` (
  `codigo_actividad` char(4) NOT NULL,
  `pago` enum('mensual','anual') NOT NULL DEFAULT 'mensual',
  `actividad` varchar(20) NOT NULL,
  `precio` float(7,2) NOT NULL,
  PRIMARY KEY (`codigo_actividad`,`pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
1 row in set (0.00 sec)


/*El resultado de la ejecución del comando para la tabla socios es el siguiente: */
mysql> show create table socios \G
*************************** 1. row ***************************
       Table: socios
Create Table: CREATE TABLE `socios` (
  `num_socio` int(4) NOT NULL AUTO_INCREMENT,
  `codigo_actividad` char(4) NOT NULL,
  `pago` enum('mensual','anual') NOT NULL DEFAULT 'mensual',
  `nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`num_socio`,`codigo_actividad`),
  KEY `FK_SOCIOS_CUOTAS` (`codigo_actividad`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=latin1
1 row in set (0.00 sec)

/*
Como podemos observar, el comando show create table nombre_tabla ahora nos muestra
InnoDB después de la palabra clave "ENGINE" por lo que ahora las tablas cuotas y socios
son de tipo InnoDB*/












/*
6. Crea un nuevo script "C:\tema12\InnoDB_utf8_practica1_tema12_mysql.sql" y lanzalo
desde el servidor. Obligatoriamente este nuevo script debe incluir para cada una de las
tablas:el tipo de tabla (InnoDB) y el tipo de caracteres que entiende (utf8).
*/

/*Lo mismo que en el ejercicio 4 pero modificando también el CHARSET en la linea que
añadimos al final de la sentencia de creación de la tabla para establecer que los tipos 
de caracteres que entiende la tabla sean utf8 es decir, debemos añadir la linea:
    ENGINE = InnoDB CHARACTER SET 'utf8'*/

CREATE TABLE cuotas
( codigo_actividad 	CHAR(4) NOT NULL,
  pago 		ENUM('mensual','anual') NOT NULL DEFAULT 'mensual',
  actividad VARCHAR(20) NOT NULL,
  precio	FLOAT(7,2) NOT NULL,
CONSTRAINT PK_CUOTAS PRIMARY KEY (codigo_actividad,pago))
    ENGINE = InnoDB CHARACTER SET 'utf8'; 












/*
7. ¿De qué tipo son las tablas de la BBDD “mi_club”? ¿Qué caracteres entienden?
Obligatoriamente debes incluir los comandos que permiten mostrar la información anterior.
*/

/* Lo mismo que el ejercicio 5 para comprobar que ahora ha cambiado también el CHARSET....
......... Es mas pesada que un sordo con un tambor*/











/*
8. Indica la ruta completa del directorio de datos.
*/

/*La carpeta que almacena los datos de las tablas se llama data y esta en la siguiente ruta:*/
C:\wamp\bin\mysql\mysql5.7.26\data










/*
9. Escribe en forma de árbol las carpetas y ficheros que se crean en el directorio de datos al
crear una nueva base de datos con tablas de tipo InnoDB.
*/

C:\wamp\bin\mysql\mysql15.7.26\data
                                mi_club
                                    cuotas.frm
                                    db.opt
                                    socios.frm
                                ib_logfile()
                                ib_logfile1
                                ibdata1











/*
10. Explica detalladamente qué almacenan cada uno de los ficheros que se crean en el directorio
de datos al crear una nueva base de datos con tablas de tipo InnoDB.
*/

/*IMPORTANTE: LEER PAGINAS DE LA 32 A LA 39*/
/*Resumen para contestar al enunciado:
    La carpeta correspondiente al nombre de la base de datos crea un único fichero por
    cada tabla con extensión .frm donde se describe la estructura de la tabla. Los datos
    e índices de todas las tablas. Por otro lado, todas las bases de datos se almacenan en 
    un mismo tablespace que consiste en un número reducido de ficheros del sistema operativo
    formado por: un fichero de datos llamado ibdata1 de 10MB autoextensible y dos ficheros de
    5MB cad uno llamados ib_logfile0 e ib_logfile1 
    */












/*
11. Crea un nuevo script "C:\tema12\MyISAM_utf8_practica1_tema12_mysql.sql" y lanzalo
desde el servidor. Obligatoriamente este nuevo script debe incluir para cada una de las
tablas:el tipo de tabla (MyISAM) y el tipo de caracteres que entiende (utf8).
*/

/* No puede ser... Es mas pesada que depilar a Chewaka */











/*
12. ¿De qué tipo son las tablas de la BBDD “mi_club”? ¿Qué caracteres entienden?
Obligatoriamente debes incluir los comandos que permiten mostrar la información anterior.
*/

/* No puede ser... No puedo más... Es mas inutil que un submarino descapotable  */












/*
13. Indica la ruta completa del directorio de datos.
*/

C:\wamp\bin\mysql\mysql15.7.26\data
/* Otra vez... Y dale la cabra al monte... Mas inutil que los codos de un playmobil */











/*
14. Escribe en forma de árbol las carpetas y ficheros que se crean en el directorio de datos al
crear una nueva base de datos con tablas de tipo MyISAM.
*/

C:\wamp\bin\mysql\mysql15.7.26\data
                                 mi_club
                                    cuotas.frm 
                                    cuotas.MYD 
                                    cuotas.MYI 
                                    db.opt
                                    socios.frm
                                    socios.MYD
                                    socios.MYI 
/*IMPORTANTE: LEER PAGINAS DE LA 32 A LA 39*/











/*
15. Explica detalladamente qué almacenan cada uno de los ficheros que se crean en el directorio
de datos al crear una nueva base de datos con tablas de tipo MyISAM.
*/

/*
Archivos con extensión [.frm]
Se trata de los archivos de formulario o descripción y contienen la estructura de la tabla, es decir
las columnas, el tipo de dato de cada columna, etc...

Archivos con extensión [.MYD]
Se trata de los archivos de datos y contienen las filas de la tabla, es decir, los datos.

Archivos con extensión [.MYI]
Se trata de los archivos que contienen los índices que se han creado sobre el archivo de datos.
*/










/*
16. Completa las siguientes frases:
    a) La tablas tipo MERGE no contienen datos por si mismas sino que ...
    b) Una condición indispensable para crear tablas MERGE es que …
    c) Borrar una tabla MERGE mediante drop no supone borrar las tablas …
    d) Al crear una tabla MERGE se generan dos ficheros uno de ellos con extensión …
*/

                                /*  NO ENTRA EN EL EXAMEN  */






/*
17. Completa las siguientes frases:
    a) Las tablas MEMORY se caracterizan por:
        • Almacenar...... TODOS LOS DATOS DE LA TABLA EN MEMORIA
        • Ser...... EXTREMADAMENTE RÁPIDAS PUESTO QUE NO NECESITAN NINGUN ACCESO A DISCO.
    b) Las tablas MEMORY son muy útiles para crear ....... TABLAS TEMPORALES
    c) Las tablas HEAP únicamente guardan en disco un fichero ........ CON EXTENSIÓN .FRM CON LA ESTRUCTURA
        DE LA TABLA.
*/








/*
18. Enumera los 6 tipos de tablas de MySQL o la 6 formas que tiene MySQL para el
almacenamiento interno de los datos:
*/

/*     
1. MyISAM ------------------> Importante
2. MERGE
3. MEMORY (HEAP)
4. BDB
5. ISAM
6. InnoDB ------------------> Importante

*/














                                                /*==================================================================================*/
                                                /*==================================================================================*/
                                                /*=================================  PRACTICA 1 TEMA 13  ===========================*/
                                                /*==================================================================================*/
                                                /*==================================================================================*/
                                                                /*Apuntes bloque III desde la página 44 a la página 49.*/



/*
1. Conectarse localmente con el usuario "root" de forma corta y después comprobar el usuario
con el que has entrado al servidor.
*/

mysql -u root 
    select USER();







/*
2. Contesta:
    a) ¿Cómo se llama la tabla qué almacena las cuentas de usuario?
    b) ¿A qué base de datos pertenece esa tabla?
*/

mysql.user

/* a la base de datos donde se almacena los usuarios del sistema */









/*
3. Mostrar usuario, host y password de todas las cuentas de ususario.
*/

select user, host, authetication_string from mysql.user;







/*4. Crear una cuenta de usuario llamada "usuario1" y contraseña "usuario1" para acceder en
modo local con todos los privilegios o permisos sobre todas las tablas de todas las BBDD.
*/

GRANT ALL PRIVILEGES ON *.* 
    TO usuario1@localhost IDENTIFIED BY 'usuario1';






/*
5. Crear una cuenta de usuario llamada "usuario2" sin contraseña para acceder en modo local
con el permiso SELECT sobre todas las tablas de todas las BBDD.
*/


GRANT ALL PRIVILEGES ON *.* 
    TO usuario2@localhost IDENTIFIED BY 'usuario2';





/*
6. Cuando se hace una conexión al servidor MySQL la identifica por el hostname. ¿Qué partes
tiene el hostname?
*/







/*
7. Mostrar usuario, host y password de todas las cuentas de ususario.
*/


SELECT USER, HOST, authetication_string FROM MYSQL.USER;




/*
8. Investigar algún campo más de la tabla user de la BBDD mysql. Explica que información
muestran los siguientes campos: select_priv, insert_priv y c. delete_priv.
*/






/*
9. Investigar los campos de la tabla db de la BBDD mysql. Explica que información muestran
los siguietes campos: select_priv, insert_priv y c. delete_priv.
*/














                                               /*==================================================================================*/
                                                /*==================================================================================*/
                                                /*=================================  PRACTICA 2 TEMA 13  ===========================*/
                                                /*==================================================================================*/
                                                /*==================================================================================*/
                                                                /*Apuntes bloque III desde la página 44 a la página 49.*/



/* 1. Conectarte localmente con el usuario "root" de forma corta y después comprobar el usuario con el que has entrado al servidor. */



/* 2. Crear una cuenta de usuario llamada "usuario3" y contraseña "user3" para acceder en modo local con todos los privilegios o permisos sobre todas las tablas de la BBDD “curso”. */








/* 3. Crear una cuenta de usuario llamada "usuario4" sin contraseña para acceder en modo local con el permiso SELECT,INSERT sobre todas las tablas de la BBDD “curso”. */
















/* 4. Mostrar los campos user, host y password de la tabla user de la BBDD mysql. */

















/* 5. Mostrar los campos host, db y user de la tabla db de la BBDD mysql. */
















/* 6. Como sabes el “usuario4” se ha creado sin contraseña. Deseamos asignarle la contraseña "usuario4".  ¿Cuál/es de las siguientes formas es válida?. Para la/las formas válidas debes indicar todos los pasos.
a) Conectado desde el usuario3. 
b) Conectado desde el usuario4.
c) Conectado desde el usuario1. */







/* 7. Como sabes el “usuario3” se ha creado con contraseña. Deseamos asignarle una nueva contraseña "usuario3".  ¿Cuál/es de las siguientes formas es válida?. Para la/las formas válidas debes indicar todos los pasos. 
a) Conectado desde el usuario3. 
b) Conectado desde el usuario4. */










/* 8. Desconectarte como usuario root. Volver a conectarte localmente con el usuario "usuario3" de forma corta y comprobar el usuario con el que has entrado al servidor. */




















/* 9. Muestra   únicamente   los   privilegios   o   permisos   que   tiene   asignado   el   usuario 
"usuario3@localhost". */













/* 10. Desde "usuario3@localhost" crea una nueva BBDD llamada "instituto". Si no es posible 
explica por qué.  */