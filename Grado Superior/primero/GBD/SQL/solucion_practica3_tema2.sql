/* 1. */
SELECT apellido, salario, dep_no
FROM empleados
WHERE salario < 2000 AND dep_no IN (10,30);
/* SOLO VAN ENTRE COMILLAS LAS FECHAS O CADENAS DE TEXTO O LETRAS. */

+----------+---------+--------+
| apellido | salario | dep_no |
+----------+---------+--------+
| ALONSO   | 1400.00 |     30 |
| LOPEZ    | 1350.50 |     10 |
| MARTIN   | 1500.00 |     30 |
| CALVO    | 1800.00 |     30 |
+----------+---------+--------+
4 rows in set (0.00 sec)

/* 2. */ 
SELECT apellido, oficio, salario, comision 
FROM empleados
WHERE oficio IN ('VENDEDOR','ANALISTA','EMPLEADO') AND comision IS null;

+----------+----------+---------+----------+
| apellido | oficio   | salario | comision |
+----------+----------+---------+----------+
| LOPEZ    | EMPLEADO | 1350.50 |     NULL |
| GIL      | ANALISTA | 3350.00 |     NULL |
| JIMENEZ  | EMPLEADO | 1400.00 |     NULL |
+----------+----------+---------+----------+
3 rows in set (0.00 sec)

/* 3. */
SELECT apellido, oficio, director, fecha_alta
FROM empleados
WHERE director IS NOT null AND fecha_alta BETWEEN '1981-11-15' AND '1982-05-25';
/* && es igual que el AND 
y el OR es igual que ||  */
/* si pones BETWEEN tienes que poner AND, van juntos y no puedes poner &&, por que son operadores logicos */

+----------+----------+----------+------------+
| apellido | oficio   | director | fecha_alta |
+----------+----------+----------+------------+
| GIL      | ANALISTA |     7782 | 1982-05-06 |
+----------+----------+----------+------------+
1 row in set (0.00 sec)

/* 4. */
SELECT apellido, oficio, director, fecha_alta, dep_no
FROM empleados
WHERE director IS null && fecha_alta BETWEEN '1981-01-01' AND '1981-12-31' OR dep_no = 20;
/* && es igual que el AND 
y el OR es igual que ||  */

+----------+------------+----------+------------+--------+
| apellido | oficio     | director | fecha_alta | dep_no |
+----------+------------+----------+------------+--------+
| REY      | PRESIDENTE |     NULL | 1981-11-17 |     10 |
| GIL      | ANALISTA   |     7782 | 1982-05-06 |     20 |
| JIMENEZ  | EMPLEADO   |     7782 | 1983-03-24 |     20 |
+----------+------------+----------+------------+--------+
3 rows in set (0.00 sec)

/* 5. */ 
SELECT apellido, dep_no, director
FROM empleados
WHERE apellido LIKE "%O%" OR dep_no = 30 AND director = 7698;

+----------+--------+----------+
| apellido | dep_no | director |
+----------+--------+----------+
| ALONSO   |     30 |     7698 |
| LOPEZ    |     10 |     7782 |
| MARTIN   |     30 |     7698 |
| GARRIDO  |     30 |     7839 |
| CALVO    |     30 |     7698 |
+----------+--------+----------+
5 rows in set (0.00 sec)

/* 6.  */ 
SELECT apellido AS empleado, dep_no AS Codigo_departamento
FROM empleados
WHERE apellido LIKE "%EZ" AND dep_no != 30;
/* cuando hablamos de numeros se ponen !=  */ 
/* AS es igual que un alias */
/* si no ponemos AS y lo ponemos entre comillas es mas lioso pero funciona */

+----------+---------------------+
| empleado | Codigo_departamento |
+----------+---------------------+
| LOPEZ    |                  10 |
| MARTINEZ |                  10 |
| JIMENEZ  |                  20 |
+----------+---------------------+
3 rows in set (0.00 sec)

/* 7. */
SELECT descripcion, precio_actual, precio_actual*0.95 AS Rebajado, stock_disponible
FROM productos
WHERE stock_disponible < 25 OR precio_actual > 500;
/* rebajado 5% se crea un nuevo select con el campo de la tabla precio_actual y le metemos un operador aritmetico de 0.95 que es el 5% */

+-----------------------------+---------------+----------+------------------+
| descripcion                 | precio_actual | Rebajado | stock_disponible |
+-----------------------------+---------------+----------+------------------+
| MESA DESPACHO MOD. GAVIOTA  |        550.00 |   522.50 |               50 |
| SILLA DIRECTOR MOD. BUFALO  |        670.00 |   636.50 |               25 |
| ARMARIO NOGAL DOS PUERTAS   |        460.00 |   437.00 |               20 |
| MESA MODELO UNI´?¢N         |        340.00 |   323.00 |               15 |
| ARCHIVADOR CEREZO           |       1050.00 |   997.50 |               20 |
| CAJA SEGURIDAD MOD B222     |        280.00 |   266.00 |               15 |
| MODULO ORDENADOR MOD. ERGOS |        550.00 |   522.50 |               25 |
+-----------------------------+---------------+----------+------------------+
7 rows in set (0.00 sec)

/* 8. */ 
SELECT apellido, fecha_alta, salario, comision, salario+IFNULL(comision, 0)  AS precio_total
FROM empleados
WHERE dep_no != 10 OR fecha_alta >= '1981-09-22'; 
/* EL NULL SE PROPAGA = 1000 + NULL = NULL */  
/* IFNULL(COMISION, 0) significa que si es NULL se pone 0 o si tiene valor se pone el valor de la comision */ 

+----------+------------+---------+----------+--------------+
| apellido | fecha_alta | salario | comision | precio_total |
+----------+------------+---------+----------+--------------+
| ALONSO   | 1981-02-23 | 1400.00 |   400.00 |      1800.00 |
| MARTIN   | 1981-09-28 | 1500.00 |  1600.00 |      3100.00 |
| GARRIDO  | 1981-05-01 | 3850.12 |     NULL |      3850.12 |
| REY      | 1981-11-17 | 6000.00 |     NULL |      6000.00 |
| CALVO    | 1981-09-08 | 1800.00 |     0.00 |      1800.00 |
| GIL      | 1982-05-06 | 3350.00 |     NULL |      3350.00 |
| JIMENEZ  | 1983-03-24 | 1400.00 |     NULL |      1400.00 |
+----------+------------+---------+----------+--------------+
7 rows in set (0.00 sec)
