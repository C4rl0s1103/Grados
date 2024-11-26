/* 1. */
SELECT * 
FROM empleados
WHERE salario < 1500;

+--------+----------+----------+----------+------------+---------+----------+--------+
| EMP_NO | APELLIDO | OFICIO   | DIRECTOR | FECHA_ALTA | SALARIO | COMISION | DEP_NO |
+--------+----------+----------+----------+------------+---------+----------+--------+
|   7499 | ALONSO   | VENDEDOR |     7698 | 1981-02-23 | 1400.00 |   400.00 |     30 |
|   7521 | LOPEZ    | EMPLEADO |     7782 | 1981-05-08 | 1350.50 |     NULL |     10 |
|   7900 | JIMENEZ  | EMPLEADO |     7782 | 1983-03-24 | 1400.00 |     NULL |     20 |
+--------+----------+----------+----------+------------+---------+----------+--------+
3 rows in set (0.02 sec)

/* 2. */
SELECT apellido, oficio, salario, dep_no
FROM empleados;

+----------+------------+---------+--------+
| apellido | oficio     | salario | DEP_NO |
+----------+------------+---------+--------+
| ALONSO   | VENDEDOR   | 1400.00 |     30 |
| LOPEZ    | EMPLEADO   | 1350.50 |     10 |
| MARTIN   | VENDEDOR   | 1500.00 |     30 |
| GARRIDO  | DIRECTOR   | 3850.12 |     30 |
| MARTINEZ | DIRECTOR   | 2450.00 |     10 |
| REY      | PRESIDENTE | 6000.00 |     10 |
| CALVO    | VENDEDOR   | 1800.00 |     30 |
| GIL      | ANALISTA   | 3350.00 |     20 |
| JIMENEZ  | EMPLEADO   | 1400.00 |     20 |
+----------+------------+---------+--------+
9 rows in set (0.00 sec)

/* 3. */
SELECT emp_no, apellido, dep_no 
FROM empleados
WHERE oficio = "VENDEDOR";

+--------+----------+--------+
| emp_no | apellido | dep_no |
+--------+----------+--------+
|   7499 | ALONSO   |     30 |
|   7654 | MARTIN   |     30 |
|   7844 | CALVO    |     30 |
+--------+----------+--------+
3 rows in set (0.00 sec)

/* 4. */
SELECT *
FROM empleados 
WHERE dep_no = 30;

+--------+----------+----------+----------+------------+---------+----------+--------+
| EMP_NO | APELLIDO | OFICIO   | DIRECTOR | FECHA_ALTA | SALARIO | COMISION | DEP_NO |
+--------+----------+----------+----------+------------+---------+----------+--------+
|   7499 | ALONSO   | VENDEDOR |     7698 | 1981-02-23 | 1400.00 |   400.00 |     30 |
|   7654 | MARTIN   | VENDEDOR |     7698 | 1981-09-28 | 1500.00 |  1600.00 |     30 |
|   7698 | GARRIDO  | DIRECTOR |     7839 | 1981-05-01 | 3850.12 |     NULL |     30 |
|   7844 | CALVO    | VENDEDOR |     7698 | 1981-09-08 | 1800.00 |     0.00 |     30 |
+--------+----------+----------+----------+------------+---------+----------+--------+
4 rows in set (0.00 sec)

/* 5. */ 
SELECT dep_no, dnombre, localidad 
FROM DEPARTAMENTOS
WHERE dep_no = 30;

+--------+---------+-----------+
| dep_no | dnombre | localidad |
+--------+---------+-----------+
|     30 | VENTAS  | MADRID    |
+--------+---------+-----------+
1 row in set (0.02 sec)

/* 6. */ 
SELECT emp_no, oficio, salario
FROM empleados
WHERE fecha_alta >= '1981-05-10';

+--------+------------+---------+
| emp_no | oficio     | salario |
+--------+------------+---------+
|   7654 | VENDEDOR   | 1500.00 |
|   7782 | DIRECTOR   | 2450.00 |
|   7839 | PRESIDENTE | 6000.00 |
|   7844 | VENDEDOR   | 1800.00 |
|   7876 | ANALISTA   | 3350.00 |
|   7900 | EMPLEADO   | 1400.00 |
+--------+------------+---------+
6 rows in set (0.00 sec)

/* 7. */ 
SELECT emp_no, apellido, oficio
FROM empleados 
WHERE director = 7698;

+--------+----------+----------+
| emp_no | apellido | oficio   |
+--------+----------+----------+
|   7499 | ALONSO   | VENDEDOR |
|   7654 | MARTIN   | VENDEDOR |
|   7844 | CALVO    | VENDEDOR |
+--------+----------+----------+
3 rows in set (0.00 sec)

/* 8. */
SELECT apellido, oficio, fecha_alta, salario, comision, dep_no 
FROM EMPLEADOS
WHERE emp_no = 7698;

+----------+----------+------------+---------+----------+--------+
| apellido | oficio   | fecha_alta | salario | comision | dep_no |
+----------+----------+------------+---------+----------+--------+
| GARRIDO  | DIRECTOR | 1981-05-01 | 3850.12 |     NULL |     30 |
+----------+----------+------------+---------+----------+--------+
1 row in set (0.00 sec)

/* 9. */ 
SELECT  cliente_no, nombre, localidad 
FROM clientes
WHERE vendedor_no = 7654;

+------------+-----------------------+-----------+
| cliente_no | nombre                | localidad |
+------------+-----------------------+-----------+
|        102 | LOGITRONICA S.L       | BARCELONA |
|        104 | TALLERES ESTESO S.A.  | SEVILLA   |
|        106 | SIGNOLOGIC S.A.       | MADRID    |
|        108 | MANUFACTURAS ALI S.A. | SEVILLA   |
+------------+-----------------------+-----------+
4 rows in set (0.00 sec)

/* 10. */ 
SELECT cliente_no, nombre, limite_credito 
FROM clientes
WHERE localidad = "sevilla";

+------------+-----------------------+----------------+
| cliente_no | nombre                | limite_credito |
+------------+-----------------------+----------------+
|        104 | TALLERES ESTESO S.A.  |        5000.00 |
|        108 | MANUFACTURAS ALI S.A. |        5000.00 |
+------------+-----------------------+----------------+
2 rows in set (0.00 sec)

/* 11. */ 
SELECT * 
FROM clientes 
WHERE limite_credito = 5000;

+------------+-----------------------+-----------+-------------+------+-------+----------------+
| CLIENTE_NO | NOMBRE                | LOCALIDAD | VENDEDOR_NO | DEBE | HABER | LIMITE_CREDITO |
+------------+-----------------------+-----------+-------------+------+-------+----------------+
|        101 | DISTRIBUCIONES GOMEZ  | MADRID    |        7499 | 0.00 |  0.00 |        5000.00 |
|        102 | LOGITRONICA S.L       | BARCELONA |        7654 | 0.00 |  0.00 |        5000.00 |
|        104 | TALLERES ESTESO S.A.  | SEVILLA   |        7654 | 0.00 |  0.00 |        5000.00 |
|        105 | EDICIONES SANZ        | BARCELONA |        7499 | 0.00 |  0.00 |        5000.00 |
|        106 | SIGNOLOGIC S.A.       | MADRID    |        7654 | 0.00 |  0.00 |        5000.00 |
|        108 | MANUFACTURAS ALI S.A. | SEVILLA   |        7654 | 0.00 |  0.00 |        5000.00 |
+------------+-----------------------+-----------+-------------+------+-------+----------------+
6 rows in set (0.00 sec)

/* 12. */ 
SELECT descripcion, precio_actual
FROM productos 
WHERE stock_disponible != 25;

+----------------------------+---------------+
| descripcion                | precio_actual |
+----------------------------+---------------+
| MESA DESPACHO MOD. GAVIOTA |        550.00 |
| ARMARIO NOGAL DOS PUERTAS  |        460.00 |
| MESA MODELO UNI´?¢N        |        340.00 |
| ARCHIVADOR CEREZO          |       1050.00 |
| CAJA SEGURIDAD MOD B222    |        280.00 |
+----------------------------+---------------+
5 rows in set (0.00 sec)

/* 13. */ 
SELECT producto_no, descripcion, precio_actual
FROM productos
WHERE precio_actual <= 500;

+-------------+---------------------------+---------------+
| producto_no | descripcion               | precio_actual |
+-------------+---------------------------+---------------+
|          30 | ARMARIO NOGAL DOS PUERTAS |        460.00 |
|          40 | MESA MODELO UNI´?¢N       |        340.00 |
|          60 | CAJA SEGURIDAD MOD B222   |        280.00 |
|          70 | DESTRUCTORA DE PAPEL A3   |        450.00 |
+-------------+---------------------------+---------------+
4 rows in set (0.00 sec)

/* 14. */ 
SELECT pedido_no 
FROM pedidos 
WHERE cliente_no = 106;

+-----------+
| pedido_no |
+-----------+
|      1001 |
|      1004 |
|      1008 |
|      1011 |
|      1013 |
+-----------+
5 rows in set (0.00 sec)

/* 15 */ 
SELECT pedido_no, unidades, fecha_pedido 
FROM pedidos
WHERE fecha_pedido <= '1999-11-28';

+-----------+----------+--------------+
| pedido_no | unidades | fecha_pedido |
+-----------+----------+--------------+
|      1000 |        3 | 1999-10-06   |
|      1001 |        2 | 1999-10-06   |
|      1002 |        4 | 1999-10-07   |
|      1003 |        4 | 1999-10-16   |
|      1004 |        8 | 1999-10-20   |
|      1005 |        2 | 1999-10-20   |
|      1006 |        3 | 1999-11-03   |
|      1007 |        2 | 1999-11-06   |
|      1008 |        6 | 1999-11-16   |
|      1009 |        2 | 1999-11-26   |
+-----------+----------+--------------+
10 rows in set (0.00 sec)

/* 16. */ 
exit 