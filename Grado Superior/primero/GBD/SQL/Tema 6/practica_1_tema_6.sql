/* 1. */ 
SELECT SUM(SALARIO) "Masa salarial"
FROM EMPLEADOS;

+---------------+      
| Masa salarial |      
+---------------+      
|      23100.62 |      
+---------------+      
1 row in set (0.00 sec)

/* 2. */ 
SELECT MAX(salario) AS "Sueldo maximo",
MIN(salario) AS "Sueldo minimo",
MAX(salario)-MIN(salario) AS "Sueldo diferencial" 
FROM empleados;
/* En estos campos tenemos que poner comas por que son funciones */ 

+---------------+---------------+--------------------+
| Sueldo maximo | Sueldo minimo | Sueldo diferencial |
+---------------+---------------+--------------------+
|       6000.00 |       1350.50 |            4649.50 |
+---------------+---------------+--------------------+
1 row in set (0.00 sec)

/* 3. */ 
SELECT MAX(fecha_alta) AS "Fecha de alta mas reciente"
FROM empleados;

+----------------------------+
| Fecha de alta mas reciente |
+----------------------------+
| 1983-03-24                 |
+----------------------------+
1 row in set (0.00 sec)

/* 4. */ 
SELECT MIN(fecha_alta) AS "Fecha de alta mas antigua"
FROM empleados;

+---------------------------+
| Fecha de alta mas antigua |
+---------------------------+
| 1981-02-23                |
+---------------------------+
1 row in set (0.00 sec)

/* 5. */ 
SELECT AVG(salario) AS "Salario medio"
FROM empleados;

+---------------+
| Salario medio |
+---------------+
|   2566.735569 |
+---------------+
1 row in set (0.00 sec)

/* 6. */
SELECT dep_no, AVG(Salario) AS "Salario medio por departamento"
FROM empleados
GROUP BY dep_no;

+--------+--------------------------------+
| dep_no | Salario medio por departamento |
+--------+--------------------------------+
|     10 |                    3266.833333 |
|     20 |                    2375.000000 |
|     30 |                    2137.530029 |
+--------+--------------------------------+
3 rows in set (0.00 sec)

/* 7. */ 
SELECT oficio, COUNT(*) AS "Numero de empleados"
FROM empleados
GROUP BY oficio;

/*
SELECT oficio, COUNT(dep_no) AS "Numero de empleados"
FROM empleados
GROUP BY oficio;
*/

+------------+---------------------+
| oficio     | Numero de empleados |
+------------+---------------------+
| ANALISTA   |                   1 |
| DIRECTOR   |                   2 |
| EMPLEADO   |                   2 |
| PRESIDENTE |                   1 |
| VENDEDOR   |                   3 |
+------------+---------------------+
5 rows in set (0.00 sec)

/* 8. */
SELECT dep_no AS "Departamento", 
MAX(salario) AS "Salario mas alto", 
MIN(salario) AS "Salario mas bajo"
FROM empleados
GROUP BY dep_no;

+--------------+------------------+------------------+
| Departamento | Salario mas alto | Salario mas bajo |
+--------------+------------------+------------------+
|           10 |          6000.00 |          1350.50 |
|           20 |          3350.00 |          1400.00 |
|           30 |          3850.12 |          1400.00 |
+--------------+------------------+------------------+
3 rows in set (0.00 sec)
