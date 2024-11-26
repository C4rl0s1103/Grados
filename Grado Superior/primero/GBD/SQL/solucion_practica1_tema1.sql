-- 1. 
SELECT version();

+------------+
| version()  |
+------------+
| 5.5.24-log |
+------------+
-- 2. 
SELECT CURRENT_DATE;

+--------------+
| current_date |
+--------------+
| 2024-01-11   |
+--------------+
-- 3. 
SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| information_schema |
| curso              |
| mysql              |
| performance_schema |
| tema3_practica1    |
| tema3_practica2    |
| tema4_practica2    |
| tema4_practica3    |
| test               |
+--------------------+
-- 4. 
SELECT DATABASE();

+------------+
| DATABASE() |
+------------+
| NULL       |
+------------+
-- 5. 
USE CURSO;

Database changed

-- cargar tablas 
source H:\Grado Superior\GBD\SQL\cargartablas.sql
-- sin ; por dios!!

-- 6. 
SHOW TABLES;

+-----------------+
| Tables_in_curso |
+-----------------+
| clientes        |
| departamentos   |
| empleados       |
| pedidos         |
| productos       |
+-----------------+
-- 7. 
DESC CLIENTES;

+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| CLIENTE_NO     | int(4)      | NO   | PRI | 0       |       |
| NOMBRE         | varchar(25) | YES  |     | NULL    |       |
| LOCALIDAD      | varchar(14) | YES  |     | NULL    |       |
| VENDEDOR_NO    | int(4)      | YES  | MUL | NULL    |       |
| DEBE           | float(9,2)  | YES  |     | NULL    |       |
| HABER          | float(9,2)  | YES  |     | NULL    |       |
| LIMITE_CREDITO | float(9,2)  | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+

DESC DEPARTAMENTOS;

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| DEP_NO    | int(2)      | NO   | PRI | 0       |       |
| DNOMBRE   | varchar(14) | YES  |     | NULL    |       |
| LOCALIDAD | varchar(10) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

DESC EMPLEADOS;

+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| EMP_NO     | int(4)      | NO   | PRI | 0       |       |
| APELLIDO   | varchar(8)  | YES  |     | NULL    |       |
| OFICIO     | varchar(10) | YES  |     | NULL    |       |
| DIRECTOR   | int(4)      | YES  | MUL | NULL    |       |
| FECHA_ALTA | date        | YES  |     | NULL    |       |
| SALARIO    | float(6,2)  | YES  |     | NULL    |       |
| COMISION   | float(6,2)  | YES  |     | NULL    |       |
| DEP_NO     | int(2)      | YES  | MUL | NULL    |       |
+------------+-------------+------+-----+---------+-------+

DESC PEDIDOS;

+--------------+--------+------+-----+---------+-------+
| Field        | Type   | Null | Key | Default | Extra |
+--------------+--------+------+-----+---------+-------+
| PEDIDO_NO    | int(4) | NO   | PRI | 0       |       |
| PRODUCTO_NO  | int(4) | YES  | MUL | NULL    |       |
| CLIENTE_NO   | int(4) | YES  | MUL | NULL    |       |
| UNIDADES     | int(4) | YES  |     | NULL    |       |
| FECHA_PEDIDO | date   | YES  |     | NULL    |       |
+--------------+--------+------+-----+---------+-------+

DESC PRODUCTOS;

+------------------+-------------+------+-----+---------+-------+
| Field            | Type        | Null | Key | Default | Extra |
+------------------+-------------+------+-----+---------+-------+
| PRODUCTO_NO      | int(4)      | NO   | PRI | 0       |       |
| DESCRIPCION      | varchar(30) | YES  |     | NULL    |       |
| PRECIO_ACTUAL    | float(8,2)  | YES  |     | NULL    |       |
| STOCK_DISPONIBLE | int(9)      | YES  |     | NULL    |       |
+------------------+-------------+------+-----+---------+-------+

-- 8. 
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

-- 9.
SELECT * 
FROM DEPARTAMENTOS;

+--------+---------------+-----------+
| DEP_NO | DNOMBRE       | LOCALIDAD |
+--------+---------------+-----------+
|     10 | CONTABILIDAD  | BARCELONA |
|     20 | INVESTIGACION | VALENCIA  |
|     30 | VENTAS        | MADRID    |
|     40 | PRODUCCION    | SEVILLA   |
+--------+---------------+-----------+
-- 10.
SELECT apellido 
FROM empleados; 

+----------+
| apellido |
+----------+
| ALONSO   |
| LOPEZ    |
| MARTIN   |
| GARRIDO  |
| MARTINEZ |
| REY      |
| CALVO    |
| GIL      |
| JIMENEZ  |
+----------+
-- 11.
SELECT apellido, oficio, salario 
FROM empleados;

+----------+------------+---------+
| apellido | oficio     | salario |
+----------+------------+---------+
| ALONSO   | VENDEDOR   | 1400.00 |
| LOPEZ    | EMPLEADO   | 1350.50 |
| MARTIN   | VENDEDOR   | 1500.00 |
| GARRIDO  | DIRECTOR   | 3850.12 |
| MARTINEZ | DIRECTOR   | 2450.00 |
| REY      | PRESIDENTE | 6000.00 |
| CALVO    | VENDEDOR   | 1800.00 |
| GIL      | ANALISTA   | 3350.00 |
| JIMENEZ  | EMPLEADO   | 1400.00 |
+----------+------------+---------+
-- 12.
EXIT
QUIT

-- 13.
-- ver la tabla en modo detallado 
show create table departamentos \G;

*************************** 1. row ***************************
       Table: departamentos
Create Table: CREATE TABLE `departamentos` (
  `DEP_NO` int(2) NOT NULL DEFAULT '0',
  `DNOMBRE` varchar(14) DEFAULT NULL,
  `LOCALIDAD` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`DEP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
1 row in set (0.00 sec)

ERROR:
No query specified

-- 14. 
-- ver la tabla en modo simple 
desc departamentos;

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| DEP_NO    | int(2)      | NO   | PRI | 0       |       |
| DNOMBRE   | varchar(14) | YES  |     | NULL    |       |
| LOCALIDAD | varchar(10) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
