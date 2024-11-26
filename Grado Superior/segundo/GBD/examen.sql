
/*   Ejercicio 3  
Conectarse localmente con el usuario "root" y a la vez lanzar el script "archivo_batch.sql"
desde el cliente en modo consola mysql y guardar la salida en el fichero
"C:\salida_script_ejer3.txt". ¿Es posible? Si has contestado que no explica por qué.
*/

/* Suponemos que estamos en el directorio donde se encuentra mysql.exe */
shell> mysql -u root -p < C:\archivo_batch.sql > C:\salida_script_ejer3.txt

/*OJO: Utilizamos el símbolo menor "<" para ejecutar el script desde la consola y el símbolo mayor ">"
para redirigir la salida del script al fichero con el nombre elegido.*/



/*5. Conectarse como usuario root y acceder directamente a la BBDD "curso", desde la línea de
comandos.*/

shell> mysql -u root curso 
mysql> select * from empleados;

/* Carmen escribe despues de root la tabla curso, cuando entra en el servidor, ya entras en la base de datos curso  */



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






/* 16. Incrementa en 100 euros el salario de todos los empleados cuyo salario es inferior a 1500
euros. Obligatoriamente debes trabajar a prueba de fallos, y cuando ya te hayas asegurado
que la operación que deseas realizar es correcta, debes ejecutar el comando COMMIT y
activar de nuevo el COMMIT. */

/*Ejecutamos la sentencia para trabajar a prueba de fallos*/
mysql> SET AUTOCOMMIT = 0;

/*Hacemos el update*/
mysql> UPDATE EMPLEADOS
mysql> SET salario = salario+100
mysql> WHERE salario < 1500;

/*Una vez comprobado persistimos los cambios en la base de datos*/
mysql> COMMIT;
/*Si hubiera salido mal, hubiéramos podido ejecutar ROLLBACK por estar trabajando a prueba de fallos */

/*Restablecemos el autocommit para dejar de trabajar a prueba de fallos*/
mysql> SET AUTOCOMMIT = 1;




/* 13. Crear una vista llamada EMPLEADOS_NO_DEP_20_40 que almacene todos los campos de
la tabla EMPLEADOS y los campos DNOMBRE y LOCALIDAD de la tabla
DEPARTAMENTOS, únicamente de aquellos empleados que no pertenezcan al
departamento 20 ni 40. Ordenada descendentemente por SALARIO. */

CREATE VIEW EMPLEADOS_NO_DEP_20_40 AS
    SELECT e.EMP_NO, e.APELLIDO, e.OFICIO, d.DNOMBRE, d.LOCALIDAD
    FROM empleados e, departamentos d
    WHERE e.DEP_NO = d.DEP_NO AND localidad = "MADRID"
    ORDER BY e.APELLIDO;


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




/* 12. Lanzar el script “cargartablas.sql” desde mysql> */

SOURCE C:\cargatablas.sql
/* sustituír "C:/" por el directorio local en el que se encuentre el script en cada caso */

/*Forma corta o abreviada*/
\. C:\cargatablas.sql


 
/*Ejecutamos el delete*/
mysql> DELETE FROM empleados
    -> WHERE oficio IN ("vendedor", "empleado", "analista");
Query OK, 6 rows affected (0.03 sec)




/*   Ejercicio 5  */
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

