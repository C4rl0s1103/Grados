/* 1. */ 
CREATE VIEW VISTA_EMPLEADOS AS
    SELECT EMP_NO, APELLIDO, OFICIO, SALARIO, DEP_NO
    FROM EMPLEADOS 
    WHERE APELLIDO LIKE 'MA%' AND SALARIO BETWEEN 1000 AND 1500;

/* 2. */
SELECT * FROM VISTA_EMPLEADOS;

+--------+----------+----------+---------+--------+
| EMP_NO | APELLIDO | OFICIO   | SALARIO | DEP_NO |
+--------+----------+----------+---------+--------+
|   7654 | MARTIN   | VENDEDOR | 1500.00 |     30 |
+--------+----------+----------+---------+--------+
1 row in set (0.00 sec)

/* 3. */ 
CREATE VIEW EMPLEADOS_TODOS AS
    SELECT emp_no, apellido, oficio, dnombre, localidad
    FROM empleados e
    JOIN DEPARTAMENTOS d ON e.dep_no = d.dep_no
    ORDER BY apellido;

/* 4. */
SELECT * FROM EMPLEADOS_TODOS;

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

/* 5. */
CREATE VIEW EMPLEADOS_MADRID AS 
    SELECT EMP_NO, APELLIDO, OFICIO, DNOMBRE, LOCALIDAD
    FROM EMPLEADOS e
    JOIN DEPARTAMENTOS d ON e.dep_no = d.dep_no
    WHERE localidad = "MADRID"
    ORDER BY apellido;

/* 6. */
SELECT * FROM EMPLEADOS_MADRID;

+--------+----------+----------+---------+-----------+
| EMP_NO | APELLIDO | OFICIO   | DNOMBRE | LOCALIDAD |
+--------+----------+----------+---------+-----------+
|   7499 | ALONSO   | VENDEDOR | VENTAS  | MADRID    |
|   7844 | CALVO    | VENDEDOR | VENTAS  | MADRID    |
|   7698 | GARRIDO  | DIRECTOR | VENTAS  | MADRID    |
|   7654 | MARTIN   | VENDEDOR | VENTAS  | MADRID    |
+--------+----------+----------+---------+-----------+
4 rows in set (0.00 sec)

/* 9. */
SET AUTOCOMMIT = 0;

DELETE FROM EMPLEADOS
    WHERE oficio IN ('VENDEDOR' , 'EMPLEADO' , 'ANALISTA');

        COMMIT;
        /* si hemos fallado en algo podremos ejecutar rollback */ 
        ROLLBACK;

SET AUTOCOMMIT = 1;

/* 10. */ 
/* NO, por que hemos eliminado en el anterior ejercicio varios oficios */
SELECT * FROM EMPLEADOS_TODOS;

+--------+----------+------------+--------------+-----------+
| emp_no | apellido | oficio     | dnombre      | localidad |
+--------+----------+------------+--------------+-----------+
|   7698 | GARRIDO  | DIRECTOR   | VENTAS       | MADRID    |
|   7782 | MARTINEZ | DIRECTOR   | CONTABILIDAD | BARCELONA |
|   7839 | REY      | PRESIDENTE | CONTABILIDAD | BARCELONA |
+--------+----------+------------+--------------+-----------+
3 rows in set (0.00 sec)

/* 11. */
/* NO, por que hemso eliminado varios oficios */
SELECT * FROM EMPLEADOS_MADRID;

+--------+----------+----------+---------+-----------+
| EMP_NO | APELLIDO | OFICIO   | DNOMBRE | LOCALIDAD |
+--------+----------+----------+---------+-----------+
|   7698 | GARRIDO  | DIRECTOR | VENTAS  | MADRID    |
+--------+----------+----------+---------+-----------+
1 row in set (0.00 sec)

/* 12. */ 
source h:\Grado Superior\segundo\GBD\_cargar_tablas\cargartablas.sql

/* 13. */ 
CREATE VIEW EMPLEADOS_NO_DEP_20_40 AS
    SELECT emp_no, apellido, oficio, director, fecha_alta, salario, comision, e.dep_no, dnombre, localidad 
    FROM EMPLEADOS e 
    JOIN DEPARTAMENTOS d ON d.dep_no = e.dep_no
    WHERE e.dep_no NOT IN (20, 40)
    ORDER BY SALARIO DESC ;

/* 14. */
SELECT * FROM EMPLEADOS_NO_DEP_20_40;

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

/* 15. */
SET AUTOCOMMIT = 0;

INSERT INTO DEPARTAMENTOS (dep_no, dnombre, localidad)
VALUES (50, "INFORMATICA", "MADRID");

INSERT INTO EMPLEADOS (emp_no, apellido, oficio, director, fecha_alta, salario, comision, dep_no)
VALUES (7922, "CASAS", "ANALISTA", 7782, "18/11/15", 2600, NULL, 50);

COMMIT;

SET AUTOCOMMIT = 1;

mysql> SELECT * FROM DEPARTAMENTOS;
+--------+---------------+-----------+
| DEP_NO | DNOMBRE       | LOCALIDAD |
+--------+---------------+-----------+
|     10 | CONTABILIDAD  | BARCELONA |
|     20 | INVESTIGACION | VALENCIA  |
|     30 | VENTAS        | MADRID    |
|     40 | PRODUCCION    | SEVILLA   |
|     50 | INFORMATICA   | MADRID    |
+--------+---------------+-----------+
5 rows in set (0.00 sec)

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
|   7922 | CASAS    | ANALISTA   |     7782 | 2018-11-15 | 2600.00 |     NULL |     50 |
+--------+----------+------------+----------+------------+---------+----------+--------+
10 rows in set (0.00 sec)

/* 16. */ 
SET AUTOCOMMIT = 0;

UPDATE empleados 
SET salario = salario+100
WHERE salario < 1500;

COMMIT;

SET AUTOCOMMIT = 1;

mysql> select * from empleados;
+--------+----------+------------+----------+------------+---------+----------+--------+
| EMP_NO | APELLIDO | OFICIO     | DIRECTOR | FECHA_ALTA | SALARIO | COMISION | DEP_NO |
+--------+----------+------------+----------+------------+---------+----------+--------+
|   7499 | ALONSO   | VENDEDOR   |     7698 | 1981-02-23 | 1500.00 |   400.00 |     30 |
|   7521 | LOPEZ    | EMPLEADO   |     7782 | 1981-05-08 | 1450.50 |     NULL |     10 |
|   7654 | MARTIN   | VENDEDOR   |     7698 | 1981-09-28 | 1500.00 |  1600.00 |     30 |
|   7698 | GARRIDO  | DIRECTOR   |     7839 | 1981-05-01 | 3850.12 |     NULL |     30 |
|   7782 | MARTINEZ | DIRECTOR   |     7839 | 1981-06-09 | 2450.00 |     NULL |     10 |
|   7839 | REY      | PRESIDENTE |     NULL | 1981-11-17 | 6000.00 |     NULL |     10 |
|   7844 | CALVO    | VENDEDOR   |     7698 | 1981-09-08 | 1800.00 |     0.00 |     30 |
|   7876 | GIL      | ANALISTA   |     7782 | 1982-05-06 | 3350.00 |     NULL |     20 |
|   7900 | JIMENEZ  | EMPLEADO   |     7782 | 1983-03-24 | 1500.00 |     NULL |     20 |
|   7922 | CASAS    | ANALISTA   |     7782 | 2018-11-15 | 2600.00 |     NULL |     50 |
+--------+----------+------------+----------+------------+---------+----------+--------+
10 rows in set (0.00 sec)

/* 17. */ 
/* no coincide por que hemos añadido una nueva fila */ 
SELECT * FROM EMPLEADOS_NO_DEP_20_40;

+--------+----------+------------+----------+------------+---------+----------+--------+--------------+-----------+
| emp_no | apellido | oficio     | director | fecha_alta | salario | comision | dep_no | dnombre      | localidad |
+--------+----------+------------+----------+------------+---------+----------+--------+--------------+-----------+
|   7839 | REY      | PRESIDENTE |     NULL | 1981-11-17 | 6000.00 |     NULL |     10 | CONTABILIDAD | BARCELONA |
|   7698 | GARRIDO  | DIRECTOR   |     7839 | 1981-05-01 | 3850.12 |     NULL |     30 | VENTAS       | MADRID    |
|   7922 | CASAS    | ANALISTA   |     7782 | 2018-11-15 | 2600.00 |     NULL |     50 | INFORMATICA  | MADRID    |
|   7782 | MARTINEZ | DIRECTOR   |     7839 | 1981-06-09 | 2450.00 |     NULL |     10 | CONTABILIDAD | BARCELONA |
|   7844 | CALVO    | VENDEDOR   |     7698 | 1981-09-08 | 1800.00 |     0.00 |     30 | VENTAS       | MADRID    |
|   7499 | ALONSO   | VENDEDOR   |     7698 | 1981-02-23 | 1500.00 |   400.00 |     30 | VENTAS       | MADRID    |
|   7654 | MARTIN   | VENDEDOR   |     7698 | 1981-09-28 | 1500.00 |  1600.00 |     30 | VENTAS       | MADRID    |
|   7521 | LOPEZ    | EMPLEADO   |     7782 | 1981-05-08 | 1450.50 |     NULL |     10 | CONTABILIDAD | BARCELONA |
+--------+----------+------------+----------+------------+---------+----------+--------+--------------+-----------+
8 rows in set (0.00 sec)

/* 18. */
DROP TABLE pedidos;
DROP TABLE clientes;
DROP TABLE empleados;
/* no, por que estas tablas van asociadas a otras tablas con las foreign key */ 

mysql> DROP TABLE pedidos;
Query OK, 0 rows affected (0.01 sec)

mysql> DROP TABLE clientes;
Query OK, 0 rows affected (0.01 sec)

mysql> DROP TABLE empleados;
Query OK, 0 rows affected (0.00 sec)

/* 19 */
SHOW TABLES;

+------------------------+
| Tables_in_curso        |
+------------------------+
| departamentos          |
| empleados_no_dep_20_40 |
| productos              |
+------------------------+
3 rows in set (0.00 sec)

/* 20. */
SELECT * FROM EMPLEADOS_NO_DEP_20_40;
/* ERROR 1356 (HY000): View 'curso.empleados_no_dep_20_40' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them */ 
/* no podremos ejecutar la sentencia ya que la tabla empleados raiz no la tenemos */
/* con el comando truncate podremos ver mas detenidamente una tabla */

/* 21. */
DROP VIEW EMPLEADOS_NO_DEP_20_40;

+-----------------+
| Tables_in_curso |
+-----------------+
| departamentos   |
| productos       |
+-----------------+
2 rows in set (0.00 sec)

/* 22. */
source h:\Grado Superior\segundo\GBD\_cargar_tablas\cargartablas.sql

+-----------------+
| Tables_in_curso |
+-----------------+
| clientes        |
| departamentos   |
| empleados       |
| pedidos         |
| productos       |
+-----------------+
5 rows in set (0.00 sec)