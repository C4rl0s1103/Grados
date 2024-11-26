
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
    FROM empleados e, departamentos d
    WHERE e.DEP_NO = d.DEP_NO
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
    FROM empleados e, departamentos d
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

CREATE view EMPLEADOS_NO_DEP_20_40 AS
	SELECT emp_no, apellido, oficio, director, fecha_alta, salario, comision, e.dep_no, dnombre, localidad
	FROM EMPLEADOS e
	JOIN DEPARTAMENTOS d ON e.dep_no = d.dep_no
	WHERE e.dep_no NOT IN (20, 40)
	ORDER BY salario DESC;
/*En lugar de escribir todos los campos de la tabla empleados, podríamos poner (e.*) */

CREATE VIEW EMPLEADOS_NO_DEP_20_40 AS
    SELECT e.EMP_NO, e.APELLIDO, e.OFICIO, d.DNOMBRE, d.LOCALIDAD
    FROM empleados e, departamentos d
    WHERE e.DEP_NO = d.DEP_NO AND e.dep_no NOT IN (20, 40)
    ORDER BY e.APELLIDO;


/* Otra forma */
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


