/* 1. */ 
SELECT cliente_no, COUNT(pedido_no) AS "Numero de pedidos" 
FROM pedidos
GROUP BY cliente_no;

+------------+-------------------+
| cliente_no | Numero de pedidos |
+------------+-------------------+
|        101 |                 3 |
|        102 |                 1 |
|        103 |                 2 |
|        105 |                 6 |
|        106 |                 5 |
+------------+-------------------+
5 rows in set (0.00 sec)

/* 2. */ 
SELECT producto_no, SUM(unidades) AS "total unidades"
FROM pedidos
GROUP BY producto_no;

+-------------+----------------+
| producto_no | total unidades |
+-------------+----------------+
|          10 |             13 |
|          20 |             19 |
|          30 |              6 |
|          40 |             11 |
|          50 |              4 |
|          70 |              7 |
+-------------+----------------+
6 rows in set (0.00 sec)

/* 3. */ 
SELECT oficio, COUNT(*) AS "Numero de empleados"
FROM empleados
GROUP BY oficio;

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

/* 4. Obtener para cada departamento cuantos vendedores tiene y cuál es su salario medio sin 
incluir comisión. */ 
SELECT dep_no AS "Nº departamento", COUNT(*) AS "Nº VENDEDORES", AVG(salario) AS "SALARIO MEDIO"
FROM empleados
WHERE oficio = "VENDEDOR"
GROUP BY dep_no;

+-----------------+---------------+---------------+
| Nº departamento | Nº VENDEDORES | SALARIO MEDIO |
+-----------------+---------------+---------------+
|              30 |             3 |   1566.666667 |
+-----------------+---------------+---------------+
1 row in set (0.00 sec)

/* 5. */
SELECT dep_no AS "Nº departamento", AVG(SALARIO) AS "salario medio"
FROM empleados
GROUP BY dep_no
ORDER BY 2 ASC
/* NO HACE FALTA PONER EL "ASC" POR QUE POR DEFECTO ES ASCENDENTE */
LIMIT 1;

+-----------------+---------------+
| Nº departamento | salario medio |
+-----------------+---------------+
|              30 |   2137.530029 |
+-----------------+---------------+
1 row in set (0.00 sec)

/* 6. */
SELECT dep_no AS "Nº departamento", COUNT(emp_no) AS "Nº empleados"
FROM empleados
GROUP BY DEP_NO
ORDER BY 2 DESC
LIMIT 1;

+-----------------+--------------+
| Nº departamento | Nº empleados |
+-----------------+--------------+
|              30 |            4 |
+-----------------+--------------+
1 row in set (0.00 sec)

/* 7. */
SELECT oficio, COUNT(*) AS "Total empleados" 
FROM empleados
GROUP BY oficio
HAVING COUNT(*)>=2;

+----------+-----------------+
| oficio   | Total empleados |
+----------+-----------------+
| DIRECTOR |               2 |
| EMPLEADO |               2 |
| VENDEDOR |               3 |
+----------+-----------------+
33 rows in set (0.02 sec)
