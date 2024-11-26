/* 1. */
SELECT apellido, salario, comision 
FROM empleados 
WHERE comision IS null;

+----------+---------+----------+
| apellido | salario | comision |
+----------+---------+----------+
| LOPEZ    | 1350.50 |     NULL |
| GARRIDO  | 3850.12 |     NULL |
| MARTINEZ | 2450.00 |     NULL |
| REY      | 6000.00 |     NULL |
| GIL      | 3350.00 |     NULL |
| JIMENEZ  | 1400.00 |     NULL |
+----------+---------+----------+
6 rows in set (0.00 sec)

/* 2. */ 
SELECT apellido, oficio, salario
FROM empleados
WHERE salario BETWEEN 1500 AND 3000;

+----------+----------+---------+
| apellido | oficio   | salario |
+----------+----------+---------+
| MARTIN   | VENDEDOR | 1500.00 |
| MARTINEZ | DIRECTOR | 2450.00 |
| CALVO    | VENDEDOR | 1800.00 |
+----------+----------+---------+
3 rows in set (0.00 sec)

/* 3. */ 
SELECT emp_no, apellido, oficio
FROM empleados
WHERE apellido LIKE "G%";

+--------+----------+----------+
| emp_no | apellido | oficio   |
+--------+----------+----------+
|   7698 | GARRIDO  | DIRECTOR |
|   7876 | GIL      | ANALISTA |
+--------+----------+----------+
2 rows in set (0.00 sec)

/* 4. */ 
SELECT * 
FROM pedidos
WHERE unidades IN (2,4,6);

+-----------+-------------+------------+----------+--------------+
| PEDIDO_NO | PRODUCTO_NO | CLIENTE_NO | UNIDADES | FECHA_PEDIDO |
+-----------+-------------+------------+----------+--------------+
|      1001 |          50 |        106 |        2 | 1999-10-06   |
|      1002 |          10 |        101 |        4 | 1999-10-07   |
|      1003 |          20 |        105 |        4 | 1999-10-16   |
|      1005 |          30 |        105 |        2 | 1999-10-20   |
|      1007 |          50 |        101 |        2 | 1999-11-06   |
|      1008 |          10 |        106 |        6 | 1999-11-16   |
|      1009 |          20 |        105 |        2 | 1999-11-26   |
|      1011 |          30 |        106 |        2 | 1999-12-15   |
|      1013 |          30 |        106 |        2 | 1999-12-06   |
|      1014 |          20 |        101 |        4 | 2000-01-07   |
|      1015 |          70 |        105 |        4 | 2000-01-16   |
|      1017 |          20 |        105 |        6 | 2000-01-20   |
+-----------+-------------+------------+----------+--------------+
12 rows in set (0.00 sec)

/* 5. */ 
SELECT apellido
FROM empleados
WHERE apellido LIKE "_R%";

Empty set (0.00 sec)

/* 6. */ 
SELECT descripcion, precio_actual
FROM productos
WHERE precio_actual NOT BETWEEN 300 AND 500;

+-----------------------------+---------------+
| descripcion                 | precio_actual |
+-----------------------------+---------------+
| MESA DESPACHO MOD. GAVIOTA  |        550.00 |
| SILLA DIRECTOR MOD. BUFALO  |        670.00 |
| ARCHIVADOR CEREZO           |       1050.00 |
| CAJA SEGURIDAD MOD B222     |        280.00 |
| MODULO ORDENADOR MOD. ERGOS |        550.00 |
+-----------------------------+---------------+
5 rows in set (0.00 sec)

/* 7. */ 
SELECT descripcion
FROM productos
WHERE stock_disponible NOT IN (15,25);

+----------------------------+
| descripcion                |
+----------------------------+
| MESA DESPACHO MOD. GAVIOTA |
| ARMARIO NOGAL DOS PUERTAS  |
| ARCHIVADOR CEREZO          |
+----------------------------+
3 rows in set (0.00 sec)

/* 8. */ 
SELECT apellido, salario, comision 
FROM empleados
WHERE comision = 0;

+----------+---------+----------+
| apellido | salario | comision |
+----------+---------+----------+
| CALVO    | 1800.00 |     0.00 |
+----------+---------+----------+
1 row in set (0.00 sec)

/* 9. */ 
SELECT apellido, salario, comision
FROM empleados
WHERE comision != 0;
/* WHERE comision IS NOT NULL OR IS NULL; */ 

/* LA EXCLAMACION QUIERE DECIR NO PERO EL != ES DISTINTO DE: */

+----------+---------+----------+
| apellido | salario | comision |
+----------+---------+----------+
| ALONSO   | 1400.00 |   400.00 |
| MARTIN   | 1500.00 |  1600.00 |
+----------+---------+----------+
2 rows in set (0.02 sec)

/* 10. */ 
SELECT descripcion
FROM productos
WHERE descripcion LIKE "A%T%";
/* tambien puedes usar el siguiente: WHERE descripcion LIKE "AT%" AND descripcion LIKE "A%T" AND descripcion LIKE "A%T%"" */ 
/* Si usas _ en el comando es la siguiente letra, pero si usas el comando & son digitos indeterminados */ 
+---------------------------+
| descripcion               |
+---------------------------+
| ARMARIO NOGAL DOS PUERTAS |
+---------------------------+
1 row in set (0.00 sec)

/* 11. */ 
SELECT apellido 
FROM empleados
WHERE apellido LIKE "__L";

+----------+
| apellido |
+----------+
| GIL      |
+----------+
1 row in set (0.00 sec)

/* 12. */ 
SELECT descripcion
FROM productos
WHERE descripcion LIKE "%MOD%";

+-----------------------------+
| descripcion                 |
+-----------------------------+
| MESA DESPACHO MOD. GAVIOTA  |
| SILLA DIRECTOR MOD. BUFALO  |
| MESA MODELO UNI´?¢N         |
| CAJA SEGURIDAD MOD B222     |
| MODULO ORDENADOR MOD. ERGOS |
+-----------------------------+
5 rows in set (0.00 sec)

/* 13. */ 
SELECT apellido, oficio 
FROM empleados
WHERE oficio = "director";
/* cadena de texto o fechas siempre con "" o '' */
/* cuando ponemos = es exacto a director por ejemplo, pero si tenemos directores tenenos que usar LIKE */

+----------+----------+
| apellido | oficio   |
+----------+----------+
| GARRIDO  | DIRECTOR |
| MARTINEZ | DIRECTOR |
+----------+----------+
2 rows in set (0.00 sec)

/* 14. */ 
SELECT *
FROM pedidos
WHERE fecha_pedido BETWEEN '1999-10-05' AND '1999-11-03';
/* los numeros solitarios agregar el 0 delante */  
/* BETWEEN entre 2 al 9, con todos los digitos y no puedes elegir numeros separados
IN (2,5,8) que puedes elegir numeros separados   */ 

+-----------+-------------+------------+----------+--------------+
| PEDIDO_NO | PRODUCTO_NO | CLIENTE_NO | UNIDADES | FECHA_PEDIDO |
+-----------+-------------+------------+----------+--------------+
|      1000 |          20 |        103 |        3 | 1999-10-06   |
|      1001 |          50 |        106 |        2 | 1999-10-06   |
|      1002 |          10 |        101 |        4 | 1999-10-07   |
|      1003 |          20 |        105 |        4 | 1999-10-16   |
|      1004 |          40 |        106 |        8 | 1999-10-20   |
|      1005 |          30 |        105 |        2 | 1999-10-20   |
|      1006 |          70 |        103 |        3 | 1999-11-03   |
+-----------+-------------+------------+----------+--------------+
7 rows in set (0.00 sec)

/* 15 */ 
SELECT apellido, oficio, fecha_alta, salario
FROM empleados
WHERE fecha_alta BETWEEN '1981-01-01' AND '1981-12-31';

+----------+------------+------------+---------+
| apellido | oficio     | fecha_alta | salario |
+----------+------------+------------+---------+
| ALONSO   | VENDEDOR   | 1981-02-23 | 1400.00 |
| LOPEZ    | EMPLEADO   | 1981-05-08 | 1350.50 |
| MARTIN   | VENDEDOR   | 1981-09-28 | 1500.00 |
| GARRIDO  | DIRECTOR   | 1981-05-01 | 3850.12 |
| MARTINEZ | DIRECTOR   | 1981-06-09 | 2450.00 |
| REY      | PRESIDENTE | 1981-11-17 | 6000.00 |
| CALVO    | VENDEDOR   | 1981-09-08 | 1800.00 |
+----------+------------+------------+---------+
7 rows in set (0.00 sec)

/* 16. */
SELECT apellido, oficio, fecha_alta, salario
FROM empleados
WHERE fecha_alta NOT BETWEEN '1981-05-01' AND '1981-05-31';
/* NOT BETWEEN es que de X fecha a X fecha no me lo muestre en la interfaz */ 

+----------+------------+------------+---------+
| apellido | oficio     | fecha_alta | salario |
+----------+------------+------------+---------+
| ALONSO   | VENDEDOR   | 1981-02-23 | 1400.00 |
| MARTIN   | VENDEDOR   | 1981-09-28 | 1500.00 |
| MARTINEZ | DIRECTOR   | 1981-06-09 | 2450.00 |
| REY      | PRESIDENTE | 1981-11-17 | 6000.00 |
| CALVO    | VENDEDOR   | 1981-09-08 | 1800.00 |
| GIL      | ANALISTA   | 1982-05-06 | 3350.00 |
| JIMENEZ  | EMPLEADO   | 1983-03-24 | 1400.00 |
+----------+------------+------------+---------+
7 rows in set (0.00 sec)

/* 17. */
EXIT