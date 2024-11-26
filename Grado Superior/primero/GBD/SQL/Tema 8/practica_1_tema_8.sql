/* 1. */
SELECT e.apellido, e.salario, d.dnombre, d.localidad
FROM empleados e, departamentos d
WHERE e.dep_no = d.dep_no;

+----------+---------+---------------+-----------+
| apellido | salario | dnombre       | localidad |
+----------+---------+---------------+-----------+
| LOPEZ    | 1350.50 | CONTABILIDAD  | BARCELONA |
| MARTINEZ | 2450.00 | CONTABILIDAD  | BARCELONA |
| REY      | 6000.00 | CONTABILIDAD  | BARCELONA |
| GIL      | 3350.00 | INVESTIGACION | VALENCIA  |
| JIMENEZ  | 1400.00 | INVESTIGACION | VALENCIA  |
| ALONSO   | 1400.00 | VENTAS        | MADRID    |
| MARTIN   | 1500.00 | VENTAS        | MADRID    |
| GARRIDO  | 3850.12 | VENTAS        | MADRID    |
| CALVO    | 1800.00 | VENTAS        | MADRID    |
+----------+---------+---------------+-----------+
9 rows in set (0.00 sec)

/* 2. */ 
SELECT e.apellido, e.salario, d.dnombre, d.localidad
FROM empleados e, departamentos d
WHERE e.dep_no = d.dep_no AND e.salario > 2000;

+----------+---------+---------------+-----------+
| apellido | salario | dnombre       | localidad |
+----------+---------+---------------+-----------+
| MARTINEZ | 2450.00 | CONTABILIDAD  | BARCELONA |
| REY      | 6000.00 | CONTABILIDAD  | BARCELONA |
| GIL      | 3350.00 | INVESTIGACION | VALENCIA  |
| GARRIDO  | 3850.12 | VENTAS        | MADRID    |
+----------+---------+---------------+-----------+
4 rows in set (0.00 sec)

/* 3. */
SELECT e.apellido, e.salario, d.dnombre, d.localidad
FROM empleados e, departamentos d
WHERE e.dep_no = d.dep_no
    AND e.salario > 2000
ORDER BY e.apellido;

+----------+---------+---------------+-----------+
| apellido | salario | dnombre       | localidad |
+----------+---------+---------------+-----------+
| GARRIDO  | 3850.12 | VENTAS        | MADRID    |
| GIL      | 3350.00 | INVESTIGACION | VALENCIA  |
| MARTINEZ | 2450.00 | CONTABILIDAD  | BARCELONA |
| REY      | 6000.00 | CONTABILIDAD  | BARCELONA |
+----------+---------+---------------+-----------+
4 rows in set (0.00 sec)

/* 4. */ 
SELECT e.apellido, e.salario, d.dnombre, d.localidad
FROM empleados e, departamentos d
WHERE e.dep_no = d.dep_no
    AND e.salario > 2000
    AND apellido LIKE '_A%';

+----------+---------+--------------+-----------+
| apellido | salario | dnombre      | localidad |
+----------+---------+--------------+-----------+
| MARTINEZ | 2450.00 | CONTABILIDAD | BARCELONA |
| GARRIDO  | 3850.12 | VENTAS       | MADRID    |
+----------+---------+--------------+-----------+
2 rows in set (0.00 sec)

/* 5. */
SELECT c.cliente_no, c.nombre, c.limite_credito, c.vendedor_no, e.apellido, e.oficio
FROM clientes c, empleados e
WHERE c.vendedor_no = e.emp_no;

+------------+-------------------------+----------------+-------------+----------+----------+
| cliente_no | nombre                  | limite_credito | vendedor_no | apellido | oficio   |
+------------+-------------------------+----------------+-------------+----------+----------+
|        101 | DISTRIBUCIONES GOMEZ    |        5000.00 |        7499 | ALONSO   | VENDEDOR |
|        102 | LOGITRONICA S.L         |        5000.00 |        7654 | MARTIN   | VENDEDOR |
|        103 | INDUSTRIAS LACTEAS S.A. |       10000.00 |        7844 | CALVO    | VENDEDOR |
|        104 | TALLERES ESTESO S.A.    |        5000.00 |        7654 | MARTIN   | VENDEDOR |
|        105 | EDICIONES SANZ          |        5000.00 |        7499 | ALONSO   | VENDEDOR |
|        106 | SIGNOLOGIC S.A.         |        5000.00 |        7654 | MARTIN   | VENDEDOR |
|        107 | MARTIN Y ASOCIADOS S.L. |       10000.00 |        7844 | CALVO    | VENDEDOR |
|        108 | MANUFACTURAS ALI S.A.   |        5000.00 |        7654 | MARTIN   | VENDEDOR |
+------------+-------------------------+----------------+-------------+----------+----------+
8 rows in set (0.00 sec)

/* 6. */ 
SELECT c.cliente_no, c.nombre, c.limite_credito, e.emp_no, e.apellido, e.oficio, d.dnombre, d.localidad
FROM clientes c, empleados e, departamentos d
WHERE c.vendedor_no = e.emp_no AND e.dep_no = d.dep_no;

+------------+-------------------------+----------------+--------+----------+----------+---------+-----------+
| cliente_no | nombre                  | limite_credito | emp_no | apellido | oficio   | dnombre | localidad |
+------------+-------------------------+----------------+--------+----------+----------+---------+-----------+
|        101 | DISTRIBUCIONES GOMEZ    |        5000.00 |   7499 | ALONSO   | VENDEDOR | VENTAS  | MADRID    |
|        105 | EDICIONES SANZ          |        5000.00 |   7499 | ALONSO   | VENDEDOR | VENTAS  | MADRID    |
|        102 | LOGITRONICA S.L         |        5000.00 |   7654 | MARTIN   | VENDEDOR | VENTAS  | MADRID    |
|        104 | TALLERES ESTESO S.A.    |        5000.00 |   7654 | MARTIN   | VENDEDOR | VENTAS  | MADRID    |
|        106 | SIGNOLOGIC S.A.         |        5000.00 |   7654 | MARTIN   | VENDEDOR | VENTAS  | MADRID    |
|        108 | MANUFACTURAS ALI S.A.   |        5000.00 |   7654 | MARTIN   | VENDEDOR | VENTAS  | MADRID    |
|        103 | INDUSTRIAS LACTEAS S.A. |       10000.00 |   7844 | CALVO    | VENDEDOR | VENTAS  | MADRID    |
|        107 | MARTIN Y ASOCIADOS S.L. |       10000.00 |   7844 | CALVO    | VENDEDOR | VENTAS  | MADRID    |
+------------+-------------------------+----------------+--------+----------+----------+---------+-----------+
8 rows in set (0.00 sec)