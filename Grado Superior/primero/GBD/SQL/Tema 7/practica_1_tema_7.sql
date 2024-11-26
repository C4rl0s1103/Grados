/* 1. */
SELECT dnombre
FROM departamentos
WHERE dep_no IN (SELECT DISTINCT dep_no
                 FROM empleados
                 WHERE fecha_alta < '1982-01-01');

+--------------+
| dnombre      |
+--------------+
| CONTABILIDAD |
| VENTAS       |
+--------------+
2 rows in set (0.00 sec)

/* 2. */
SELECT dnombre
FROM departamentos
WHERE dep_no IN (SELECT dep_no 
                  FROM empleados);

/*
SELECT dnombre
FROM departamentos
WHERE dep_no IN (SELECT DISTINT dep_no
                  FROM empleados);
*/

+---------------+
| dnombre       |
+---------------+
| CONTABILIDAD  |
| INVESTIGACION |
| VENTAS        |
+---------------+
3 rows in set (0.00 sec)

/* 3. */
SELECT dnombre
FROM departamentos
WHERE dep_no IN (SELECT dep_no
                  FROM empleados
                  WHERE comision IS NOT NULL);

/*
SELECT dnombre
FROM departamentos
WHERE dep_no IN (SELECT DISTINT dep_no
                  FROM empleados
                  WHERE comision IS NOT NULL);
*/

+---------+
| dnombre |
+---------+
| VENTAS  |
+---------+
1 row in set (0.00 sec)

/* 4. */
SELECT dep_no, dnombre
FROM departamentos
WHERE dep_no NOT IN (
    SELECT DISTINCT dep_no 
    FROM empleados
);

+--------+------------+
| dep_no | dnombre    |
+--------+------------+
|     40 | PRODUCCION |
+--------+------------+
1 row in set (0.00 sec)

/* 5. */ 
SELECT dep_no AS "Nº dpto.", localidad AS "Localidad"
FROM departamentos
WHERE dep_no IN (
    SELECT dep_no
    FROM empleados
    WHERE comision > salario*0.1
);

+----------+-----------+
| Nº dpto. | Localidad |
+----------+-----------+
|       30 | MADRID    |
+----------+-----------+
1 row in set (0.00 sec)

/* 6. */ 
SELECT apellido, oficio
FROM empleados
WHERE dep_no IN (SELECT dep_no
        FROM departamentos
        WHERE dnombre = "VENTAS")
ORDER BY apellido;

/* 
SELECT apellido, oficio
FROM empleados
WHERE dep_no = (SELECT dep_no
        FROM departamentos
        WHERE dnombre = "VENTAS")
ORDER BY apellido;
*/

+----------+----------+
| apellido | oficio   |
+----------+----------+
| ALONSO   | VENDEDOR |
| CALVO    | VENDEDOR |
| GARRIDO  | DIRECTOR |
| MARTIN   | VENDEDOR |
+----------+----------+
4 rows in set (0.00 sec)