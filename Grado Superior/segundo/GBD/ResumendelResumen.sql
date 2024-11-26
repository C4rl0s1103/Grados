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

/*Resultado*/

mysql> SELECT * FROM VISTA_EMPLEADOS;
+--------+----------+----------+---------+--------+
| emp_no | apellido | oficio   | salario | dep_NO |
+--------+----------+----------+---------+--------+
|   7654 | MARTIN   | VENDEDOR | 1500.00 |     30 |
+--------+----------+----------+---------+--------+
1 row in set (0.24 sec)


/* 5. Crear una vista llamada EMPLEADOS_MADRID que almacene los campos EMP_NO,
APELLIDO y OFICIO de la tabla EMPLEADOS y los campos DNOMBRE y
LOCALIDAD de la tabla DEPARTAMENTOS, únicamente de aquellos empleados que son
de MADRID. Ordenada alfabeticamente por APELLIDO. */


CREATE VIEW EMPLEADOS_TODOS AS
    SELECT e.EMP_NO, e.APELLIDO, e.OFICIO, d.DNOMBRE, d.LOCALIDAD
    FROM empleados e, departamentos d
    WHERE e.DEP_NO = d.DEP_NO AND localidad = "MADRID"
    ORDER BY e.APELLIDO;

/*Resultado*/

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

/* 9. Borra de la tabla EMPLEADOS a todos aquellos empleados cuyo oficio sea vendedor,
empleado o analista. Obligatoriamente debes trabajar a prueba de fallos, y cuando ya te
hayas asegurado que la operación que deseas realizar es correcta, debes ejecutar el comando
COMMIT y activar de nuevo el AUTOCOMMIT. */

/*Ejecutamos la sentencia para trabajar a prueba de fallos*/
mysql> SET AUTOCOMMIT = 0;

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

/*Volvemos a establecer el autocommit para dejar de trabajar a prueba de fallos*/
mysql> SET AUTOCOMMIT = 1;


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

INSERT INTO DEPARTAMENTOS (dep_no, dnombre, localidad)
VALUES  (50, "INFORMATICA", "MADRID");

INSERT INTO EMPLEADOS (emp_no, apellido, oficio, director, fecha_alta, salario, comision, dep_no)
VALUES  (7922, "CASAS", "ANALISTA", 7782, "18/11/15", 2600, NULL, 50);

mysql> COMMIT;

mysql> SET AUTOCOMMIT = 1;

/* 16. Incrementa en 100 euros el salario de todos los empleados cuyo salario es inferior a 1500
euros. Obligatoriamente debes trabajar a prueba de fallos, y cuando ya te hayas asegurado
que la operación que deseas realizar es correcta, debes ejecutar el comando COMMIT y
activar de nuevo el COMMIT. */

/*Ejecutamos la sentencia para trabajar a prueba de fallos*/
mysql> SET AUTOCOMMIT = 0;

UPDATE EMPLEADOS
SET salario = salario+100
WHERE salario < 1500;

mysql> COMMIT;

mysql> SET AUTOCOMMIT = 1;


/*3. Conectarse localmente con el usuario "root" de varias formas:*/

    /*a) Forma larga sin incluir la opción de contraseña*/
        cd C:\Wamp\bin\mysql\mysql5.7.40\bin\mysql -u root -p
        SELECT USER();
        EXIT

    /*b) Forma larga incluyendo la opción de contraseña*/
        cd C:\Wamp\bin\mysql\mysql5.7.40\bin\mysql -u root -p P@ssw0rd
        SELECT USER();
        EXIT

    /*c) Forma corta sin incluir la opción de contraseña*/
        mysql -u root -p
        SELECT USER();
        EXIT

    /*d) Forma corta incluyendo la opción de contraseña*/
        mysql -u root -p P@ssw0rd
        SELECT USER();
        EXIT


 /*4. Mostrar las tablas de la BBDD "curso" del usuario root, desde la línea de comandos.*/

mysql -u root -p -e "use curso; show tables;"

/*7. Conectarse como usuario root y acceder directamente a la BBDD "test", desde la línea de
comandos. A continuación desde el servidor muestra los datos de los empleados cuyo oficio es
vendedor de la tabla empleados de la BBDD "curso" (recuerda que la BBDD que está en uso es
"test" y no lo debes cambiar). Finalmente debes desconectarte del servidor.*/

/*1Forma*/
mysql -u root -p -e "use test;"
SELECT * FROM curso.empleados WHERE oficio = "vendedor"; 
exit
/*2Forma*/
mysql -u root -p -e "use test; SELECT * FROM curso.empleados WHERE oficio='vendedor'; exit"


/*2. Conectarse localmente con el usuario "root" y a la vez lanzar el script "archivo_batch.sql"
desde el cliente en modo consola mysql. ¿Es posible? Si has contestado que no explica por qué.*/

/* Suponemos que estamos en el directorio donde se encuentra mysql.exe */
mysql -u root -p -e "source C:\archivo_batch.sql"

/*Como opción alternativa podemos ejecutar el script con el símbolo < desde la consola*/
mysql -u root -p < C:\archivo_batch.sql

/* 3. Conectarse localmente con el usuario "root" y a la vez lanzar el script "archivo_batch.sql"
desde el cliente en modo consola mysql y guardar la salida en el fichero
"C:\salida_script_ejer3.txt". ¿Es posible? Si has contestado que no explica por qué.*/ 

/* Suponemos que estamos en el directorio donde se encuentra mysql.exe */
/*-f Se utiliza para forzar la ejecucion aunque de fallo*/
mysql -u root -p -f < C:\archivo_batch.sql > C:\salida_script_ejer3.txt


/* 14. Escribe en forma de árbol las carpetas y ficheros que se crean en el directorio de datos al
crear una nueva base de datos con tablas de tipo MyISAM.*/
C:\wamp\bin\mysql\mysql15.7.26\data
                                mi_club
                                    cuotas.frm 
                                    cuotas.MYD 
                                    cuotas.MYI 
                                    db.opt
                                    socios.frm
                                    socios.MYD
                                    socios.MYI

/*9. Escribe en forma de árbol las carpetas y ficheros que se crean en el directorio de datos al
crear una nueva base de datos con tablas de tipo InnoDB.*/
C:\wamp\bin\mysql\mysql15.7.26\data
                                mi_club
                                    cuotas.frm
                                    db.opt
                                    socios.frm
                                ib_logfile()
                                ib_logfile1
                                ibdata1