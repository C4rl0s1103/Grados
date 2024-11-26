/* 1. Obtener todos los empleados de la tabla empleados con todos sus datos */ 
SELECT * 
FROM EMPLEADOS;

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

/* 2. Obtener los números de empleados, los apellidos y el número de departamento de todos losempleados de la tabla empleados */
SELECT EMP_NO, APELLIDO, DEP_NO
FROM EMPLEADOS;

+--------+----------+--------+
| EMP_NO | APELLIDO | DEP_NO |
+--------+----------+--------+
|   7499 | ALONSO   |     30 |
|   7521 | LOPEZ    |     10 |
|   7654 | MARTIN   |     30 |
|   7698 | GARRIDO  |     30 |
|   7782 | MARTINEZ |     10 |
|   7839 | REY      |     10 |
|   7844 | CALVO    |     30 |
|   7876 | GIL      |     20 |
|   7900 | JIMENEZ  |     20 |
+--------+----------+--------+
9 rows in set (0.00 sec)

/* 3. Obtener los departamentos diferentes que hay en la tabla empleados */
SELECT DISTINCT DEP_NO
FROM EMPLEADOS;

+--------+
| DEP_NO |
+--------+
|     10 |
|     20 |
|     30 |
+--------+
3 rows in set (0.00 sec)

/* 4. Obtener los diferentes oficios que hay en cada departamento de la tabla empleados */
SELECT DISTINCT OFICIO, DEP_NO
FROM EMPLEADOS;

+------------+--------+
| OFICIO     | DEP_NO |
+------------+--------+
| VENDEDOR   |     30 |
| EMPLEADO   |     10 |
| DIRECTOR   |     30 |
| DIRECTOR   |     10 |
| PRESIDENTE |     10 |
| ANALISTA   |     20 |
| EMPLEADO   |     20 |
+------------+--------+
7 rows in set (0.00 sec)

/* 5. Obtener el salario total anual (14 pagas) de los empleados de la empresa mostrando el mensaje Salario total */ 
SELECT salario*14 "salario total"
FROM empleados; 

+---------------+
| salario total |
+---------------+
|      19600.00 |
|      18907.00 |
|      21000.00 |
|      53901.68 |
|      34300.00 |
|      84000.00 |
|      25200.00 |
|      46900.00 |
|      19600.00 |
+---------------+
9 rows in set (0.00 sec)

/* 6. Seleccionar aquellos empleados cuyo apellido empiece por 'M'
 y tengan un salario entre 1000 y 2000 euros. */ 
SELECT *
FROM EMPLEADOS
WHERE APELLIDO LIKE "M%" AND SALARIO BETWEEN 1000 AND 2000;

+--------+----------+----------+----------+------------+---------+----------+--------+
| EMP_NO | APELLIDO | OFICIO   | DIRECTOR | FECHA_ALTA | SALARIO | COMISION | DEP_NO |
+--------+----------+----------+----------+------------+---------+----------+--------+
|   7654 | MARTIN   | VENDEDOR |     7698 | 1981-09-28 | 1500.00 |  1600.00 |     30 |
+--------+----------+----------+----------+------------+---------+----------+--------+
1 row in set (0.00 sec)

/* 7. Seleccionar aquellos empleados cuyo apellido incluya una ‘A’ en el segundo carácter */ 
SELECT * 
FROM EMPLEADOS
WHERE APELLIDO LIKE "_A%";

+--------+----------+----------+----------+------------+---------+----------+--------+
| EMP_NO | APELLIDO | OFICIO   | DIRECTOR | FECHA_ALTA | SALARIO | COMISION | DEP_NO |
+--------+----------+----------+----------+------------+---------+----------+--------+
|   7654 | MARTIN   | VENDEDOR |     7698 | 1981-09-28 | 1500.00 |  1600.00 |     30 |
|   7698 | GARRIDO  | DIRECTOR |     7839 | 1981-05-01 | 3850.12 |     NULL |     30 |
|   7782 | MARTINEZ | DIRECTOR |     7839 | 1981-06-09 | 2450.00 |     NULL |     10 |
|   7844 | CALVO    | VENDEDOR |     7698 | 1981-09-08 | 1800.00 |     0.00 |     30 |
+--------+----------+----------+----------+------------+---------+----------+--------+
4 rows in set (0.00 sec)

/* 8. Seleccionar los empleados existentes en los departamentos 10 y 30 */ 
SELECT * 
FROM EMPLEADOS 
WHERE DEP_NO IN(10,30);

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
+--------+----------+------------+----------+------------+---------+----------+--------+
7 rows in set (0.00 sec)

/* 9. Seleccionar los empleados que tienen de oficio ANALISTA */ 
SELECT * 
FROM EMPLEADOS 
WHERE OFICIO = "ANALISTA";

+--------+----------+----------+----------+------------+---------+----------+--------+
| EMP_NO | APELLIDO | OFICIO   | DIRECTOR | FECHA_ALTA | SALARIO | COMISION | DEP_NO |
+--------+----------+----------+----------+------------+---------+----------+--------+
|   7876 | GIL      | ANALISTA |     7782 | 1982-05-06 | 3350.00 |     NULL |     20 |
+--------+----------+----------+----------+------------+---------+----------+--------+
1 row in set (0.00 sec)

/* 10. Obtener relación alfabética de todos los empleados con todos sus datos */ 
SELECT *
FROM empleados
ORDER BY apellido ASC;
/* ASCENDENTE ES POR DEFECTO, Y NO HARIA FALTA */

+--------+----------+------------+----------+------------+---------+----------+--------+
| EMP_NO | APELLIDO | OFICIO     | DIRECTOR | FECHA_ALTA | SALARIO | COMISION | DEP_NO |
+--------+----------+------------+----------+------------+---------+----------+--------+
|   7499 | ALONSO   | VENDEDOR   |     7698 | 1981-02-23 | 1400.00 |   400.00 |     30 |
|   7844 | CALVO    | VENDEDOR   |     7698 | 1981-09-08 | 1800.00 |     0.00 |     30 |
|   7698 | GARRIDO  | DIRECTOR   |     7839 | 1981-05-01 | 3850.12 |     NULL |     30 |
|   7876 | GIL      | ANALISTA   |     7782 | 1982-05-06 | 3350.00 |     NULL |     20 |
|   7900 | JIMENEZ  | EMPLEADO   |     7782 | 1983-03-24 | 1400.00 |     NULL |     20 |
|   7521 | LOPEZ    | EMPLEADO   |     7782 | 1981-05-08 | 1350.50 |     NULL |     10 |
|   7654 | MARTIN   | VENDEDOR   |     7698 | 1981-09-28 | 1500.00 |  1600.00 |     30 |
|   7782 | MARTINEZ | DIRECTOR   |     7839 | 1981-06-09 | 2450.00 |     NULL |     10 |
|   7839 | REY      | PRESIDENTE |     NULL | 1981-11-17 | 6000.00 |     NULL |     10 |
+--------+----------+------------+----------+------------+---------+----------+--------+
9 rows in set (0.01 sec)

/* 11. Obtener clasificación alfabética de empleados por departamentos */
SELECT * 
FROM empleados
ORDER BY dep_no, apellido;

+--------+----------+------------+----------+------------+---------+----------+--------+
| EMP_NO | APELLIDO | OFICIO     | DIRECTOR | FECHA_ALTA | SALARIO | COMISION | DEP_NO |
+--------+----------+------------+----------+------------+---------+----------+--------+
|   7521 | LOPEZ    | EMPLEADO   |     7782 | 1981-05-08 | 1350.50 |     NULL |     10 |
|   7782 | MARTINEZ | DIRECTOR   |     7839 | 1981-06-09 | 2450.00 |     NULL |     10 |
|   7839 | REY      | PRESIDENTE |     NULL | 1981-11-17 | 6000.00 |     NULL |     10 |
|   7876 | GIL      | ANALISTA   |     7782 | 1982-05-06 | 3350.00 |     NULL |     20 |
|   7900 | JIMENEZ  | EMPLEADO   |     7782 | 1983-03-24 | 1400.00 |     NULL |     20 |
|   7499 | ALONSO   | VENDEDOR   |     7698 | 1981-02-23 | 1400.00 |   400.00 |     30 |
|   7654 | MARTIN   | VENDEDOR   |     7698 | 1981-09-28 | 1500.00 |  1600.00 |     30 |
|   7698 | GARRIDO  | DIRECTOR   |     7839 | 1981-05-01 | 3850.12 |     NULL |     30 |
|   7844 | CALVO    | VENDEDOR   |     7698 | 1981-09-08 | 1800.00 |     0.00 |     30 |
+--------+----------+------------+----------+------------+---------+----------+--------+
9 rows in set (0.00 sec)

/* 12. Obtener los datos de los empleados clasificados por oficios y en orden descendente desalarios */
SELECT * 
FROM empleados
ORDER BY oficio, salario DESC;

+--------+----------+------------+----------+------------+---------+----------+--------+
| EMP_NO | APELLIDO | OFICIO     | DIRECTOR | FECHA_ALTA | SALARIO | COMISION | DEP_NO |
+--------+----------+------------+----------+------------+---------+----------+--------+
|   7876 | GIL      | ANALISTA   |     7782 | 1982-05-06 | 3350.00 |     NULL |     20 |
|   7698 | GARRIDO  | DIRECTOR   |     7839 | 1981-05-01 | 3850.12 |     NULL |     30 |
|   7782 | MARTINEZ | DIRECTOR   |     7839 | 1981-06-09 | 2450.00 |     NULL |     10 |
|   7900 | JIMENEZ  | EMPLEADO   |     7782 | 1983-03-24 | 1400.00 |     NULL |     20 |
|   7521 | LOPEZ    | EMPLEADO   |     7782 | 1981-05-08 | 1350.50 |     NULL |     10 |
|   7839 | REY      | PRESIDENTE |     NULL | 1981-11-17 | 6000.00 |     NULL |     10 |
|   7844 | CALVO    | VENDEDOR   |     7698 | 1981-09-08 | 1800.00 |     0.00 |     30 |
|   7654 | MARTIN   | VENDEDOR   |     7698 | 1981-09-28 | 1500.00 |  1600.00 |     30 |
|   7499 | ALONSO   | VENDEDOR   |     7698 | 1981-02-23 | 1400.00 |   400.00 |     30 |
+--------+----------+------------+----------+------------+---------+----------+--------+
9 rows in set (0.00 sec)

/* 13. Obtener los apellidos de los empleados junto con su salario anual (salario + comision en 14pagas)
 ordenado de mayor a menor por este salario total. */ 
SELECT apellido, salario, comision, (salario + IFNULL(comision,0))*14 AS salario_anual
FROM empleados
ORDER BY salario_anual DESC;

+----------+---------+----------+---------------+
| apellido | salario | comision | salario_anual |
+----------+---------+----------+---------------+
| REY      | 6000.00 |     NULL |      84000.00 |
| GARRIDO  | 3850.12 |     NULL |      53901.68 |
| GIL      | 3350.00 |     NULL |      46900.00 |
| MARTIN   | 1500.00 |  1600.00 |      43400.00 |
| MARTINEZ | 2450.00 |     NULL |      34300.00 |
| ALONSO   | 1400.00 |   400.00 |      25200.00 |
| CALVO    | 1800.00 |     0.00 |      25200.00 |
| JIMENEZ  | 1400.00 |     NULL |      19600.00 |
| LOPEZ    | 1350.50 |     NULL |      18907.00 |
+----------+---------+----------+---------------+
9 rows in set (0.00 sec)

/* 14. Obtener los datos de los 5 empleados con menos salario */ 
SELECT * 
FROM empleados
ORDER BY salario ASC
LIMIT 5;

+--------+----------+----------+----------+------------+---------+----------+--------+
| EMP_NO | APELLIDO | OFICIO   | DIRECTOR | FECHA_ALTA | SALARIO | COMISION | DEP_NO |
+--------+----------+----------+----------+------------+---------+----------+--------+
|   7521 | LOPEZ    | EMPLEADO |     7782 | 1981-05-08 | 1350.50 |     NULL |     10 |
|   7499 | ALONSO   | VENDEDOR |     7698 | 1981-02-23 | 1400.00 |   400.00 |     30 |
|   7900 | JIMENEZ  | EMPLEADO |     7782 | 1983-03-24 | 1400.00 |     NULL |     20 |
|   7654 | MARTIN   | VENDEDOR |     7698 | 1981-09-28 | 1500.00 |  1600.00 |     30 |
|   7844 | CALVO    | VENDEDOR |     7698 | 1981-09-08 | 1800.00 |     0.00 |     30 |
+--------+----------+----------+----------+------------+---------+----------+--------+
5 rows in set (0.00 sec)

/* 15. Obtener clasificación alfabética de empleados según su apellido y 
mostrar desde el 5º hasta el 7º de la lista */ 
SELECT * 
FROM empleados
ORDER BY apellido
LIMIT 4,3;
/* empezamos la lista por el 0 */  

+--------+----------+----------+----------+------------+---------+----------+--------+
| EMP_NO | APELLIDO | OFICIO   | DIRECTOR | FECHA_ALTA | SALARIO | COMISION | DEP_NO |
+--------+----------+----------+----------+------------+---------+----------+--------+
|   7900 | JIMENEZ  | EMPLEADO |     7782 | 1983-03-24 | 1400.00 |     NULL |     20 |
|   7521 | LOPEZ    | EMPLEADO |     7782 | 1981-05-08 | 1350.50 |     NULL |     10 |
|   7654 | MARTIN   | VENDEDOR |     7698 | 1981-09-28 | 1500.00 |  1600.00 |     30 |
+--------+----------+----------+----------+------------+---------+----------+--------+
3 rows in set (0.00 sec)

/* 16. Obten el sumatorio de los salarios para todos los empleados agrupados por oficio y nombra al campo
'sumatorio_salarios'. */ 
SELECT oficio, sum(salario) AS sumatorio_salarios 
FROM empleados 
GROUP BY oficio
ORDER BY salario DESC;

+------------+--------------------+
| oficio     | sumatorio_salarios |
+------------+--------------------+
| PRESIDENTE |            6000.00 |
| DIRECTOR   |            6300.12 |
| ANALISTA   |            3350.00 |
| VENDEDOR   |            4700.00 |
| EMPLEADO   |            2750.50 |
+------------+--------------------+
5 rows in set (0.00 sec)
