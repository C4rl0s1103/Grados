
/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX---- CONSULTAS BÁSICAS A LA BASE DE DATOS ----XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/





/*XXXXXXXXXXXXXXXXXXX----BLOQUE DE EJERCICIOS 1.1----XXXXXXXXXXXXXXXXXXXXXXX*/


-- 1 Crea una consulta para mostrar la versión de MySQL.
    SELECT version();

-- 2 Crea una consulta para mostrar la fecha actual.
    SELECT curdate();

-- 3 Escribe la sentencia para ver cuáles son las bases de datos (BBDD) existentes en el servidor.
    SHOW databases;

-- 4 Escribe la sentencia para ver en que BBDD te encuentras situado.
    SELECT database();

-- 5 Selecciona la BBDD curso.
    USE curso;

-- 6 Muestra todas las tablas de la BBDD curso.
    SHOW TABLES;

-- 7 Muestra la descripción de cada una de las tablas de la BBDD curso.
    DESC clientes;

-- 8 Muestra los registros para todos los campos de la tabla empleados.
    SELECT * FROM empleados;

-- 9 Muestra los datos de la tabla departamentos.
    SELECT * FROM departamentos;

-- 10 Muestra el apellido de los empleados.
    SELECT apellidos FROM empleados;

-- 11 Muestra el apellido, el oficio y el salario de los empleados.
    SELECT apellidos, oficio, salario FROM empleados;

-- 13 Mostrar el esquema de una tabla (MODO SIMPLE)
    desc departamentos;

-- 14 Mostrar el esquema de una tabla (MODO DETALLADO)
    show create table departamentos \G

-- 12 Desconectarse o salir del servidor de MySQL.
    EXIT


-- JOIN para consultar los nombres localidad y limite de credito de los clientes junto al nombre, salario y departamento de su 
-- vendedor asignado.
    SELECT c.nombre AS cliente, c.localidad, c.limite_credito, e.apellido AS vendedor, e.salario, e.dep_no 
    FROM clientes AS c join empleados AS e 
    ON c.vendedor_no=e.emp_no 
    ORDER BY c.nombre DESC;








/*XXXXXXXXXXXXXXXXXXX----BLOQUE DE EJERCICIOS 2.1 ----XXXXXXXXXXXXXXXXXXXXXXX*/


-- 1. Crea una consulta para mostrar los empleados que cobran menos de 1500 euros.

    SELECT *
    FROM empleados
    WHERE salario < 1500;

-- 2. Consultar  apellido, oficio, salario y codigo de departamento de los empleados que tienen un 
-- sueldo mayor o igual que 2000 euros.

    SELECT apellido, oficio, salario, dep_no
    FROM empleados
    WHERE salario >= 2000;

-- 3. Visualiza el codigo, apellido y codigo de departamento de los empleados que son 
-- vendedores.

    SELECT emp_no, apellido, dep_no
    FROM empleados
    WHERE oficio = "vendedor";

-- 4. Visualizar empleados que pertenecen al departamento 30.

    SELECT nombre, apellidos
    FROM empleados
    WHERE dep_no = 30;

-- 5. Muestra el codigo, nombre y localidad del departamento 30.

    SELECT dep_no, dnombre, localidad
    FROM departamentos
    WHERE dep_no = 30;

-- 6. Consultar codigo, oficio y salario de los empleados que entraron en la empresa a partir del 
-- 10 de Mayo de 1981.

    SELECT emp_no, oficio, salario, fecha_alta
    FROM empleados
    WHERE fecha_alta >= "1981-05-10";

-- 7. Mostrar codigo, apellido y oficio de los empleados cuyo director es 7698.

    SELECT emp_no, apellido, oficio
    FROM empleados
    wHERE director = 7698;

-- 8. Muestra el apellido, oficio, fecha de alta, salario, comision y codigo de departamento del 
-- empleado 7698.

    SELECT apellido, oficio, fecha_alta, salario, comision, dep_no
    FROM empleados 
    WHERE emp_no = 7698;

-- 9. Obtener codigo, nombre y localidad de los clientes con los que trabaja el vendedor 7654.

    SELECT cliente_no, nombre, localidad
    FROM clientes
    WHERE vendedor_no = 7654;

-- 10. Crea una consulta para visualizar el codigo, nombre y límite de crédito de los clientes que 
-- son de Sevilla. 

    SELECT cliente_no, nombre, limite_credito, 
    FROM clientes
    WHERE localidad = "sevilla";

-- 11. Muestra a los clientes cuyo límite de crédito es igual a 5000 euros.

    SELECT *
    FROM clientes
    WHERE limite_credito = 5000;

-- 12. Muestra la descripcion y el precio actual de los productos cuya cantidad en stock es distinta 
-- a 25.

    SELECT descripcion, precio_actual
    FROM productos
    WHERE stock_disponible != 25;

-- 13. Crea una consulta para mostrar el codigo, descripcion y precio de los productos cuyo precio 
-- es inferior o igual a 500 euros.

    SELECT producto_no, descripcion, precio_actual
    FROM productos
    WHERE PRECIO <= 500;

-- 14. Visualiza los pedidos que se han realizado al cliente 106.

    SELECT *
    FROM pedidos
    WHERE cliente_no = 106;

-- 15. Visualiza codigo de pedido, unidades y fecha de los pedidos que se han realizado con 
-- anterioridad al 28 de de Noviembre de 1999.

    SELECT pedido_no, unidades, fecha_pedido
    FROM pedidos
    WHERE fecha_pedido < "1999-10-28";

-- 16. Desconectarse o salir del servidor de MySQL.

EXIT








/*XXXXXXXXXXXXXXXXXXX----BLOQUE DE EJERCICIOS 2.2 ----XXXXXXXXXXXXXXXXXXXXXXX*/


--1. Consultar apellidos, salario y comisión de los empleados que su comisión es NULL.

    SELECT apellido, salario, comision 
    FROM empleados
    WHERE comision IS NULL;

--2. Crea una consulta para mostrar apellido, oficio y salario de los empleados que tienen un
--sueldo entre 1500 y 3000 euros.

    SELECT apellido, oficio, salario
    FROM empleados
    WHERE salario BETWEEN 1500 AND 3000;

--3. Visualiza el código, apellido y oficio de los empleados cuyo apellido empieza por ‘G’.

    SELECT emp_no, apellido, oficio
    FROM empleados
    WHERE apellido LIKE "G%";

--4. Obtener todos los datos de los pedidos que en los que las unidades pedidas son 2, 4 o 6.

    SELECT *
    FROM pedidos
    WHERE unidades IN (2, 4, 6);

--5. Obtener los apellidos de los empleados que tengan una ‘R’ en la segunda posición.

    SELECT apellido
    FROM empleados
    WHERE apellido LIKE "_R%";

--6. Muestra la descripción y el precio de los productos cuyo precio actual no este entre 300 y
--500 euros.

    SELECT descripcion, precio_actual
    FROM productos
    WHERE precio_actual NOT BETWEEN 300 AND 500;

--7. Consultar los productos cuya cantidad en stock no sea ni 15 ni 25.

    SELECT *
    FROM productos
    WHERE stock_disponible NOT IN (15,25);

--8. Consultar apellidos, salario y comisión de los empleados cuya comisión es de 0 euros.

    SELECT apellido, salario, comision
    FROM empleados
    WHERE comision = 0;

--9. Consultar apellidos, salario y comisión de los empleados que tienen comisión (si su
--comisión es 0, no debe mostrarse).

    SELECT apellido, salario, comision
    FROM empleados
    WHERE comision !=0;

--10. Obtener la descripción de los productos que empiezan por ‘A’ y tengan una ‘T’ en su
--interior.

    SELECT descripcion
    FROM productos
    WHERE descripcion LIKE "AT%" OR descripcion LIKE "A%T" OR descripcion LIKE "A%T%";

--11. Obtener los apellidos de los empleados con tres caracteres y terminen por ‘L’.

    SELECT apellido
    FROM empleados
    WHERE apellido LIKE "__L";

--12. Obtener los nombres de los productos que contengan en su interior la siguiente cadena de
--caracteres ‘MOD’.

    SELECT descripcion, 
    FROM productos
    WHERE descripcion LIKE "MOD%" OR descripcion LIKE "%MOD" OR descripcion LIKE "%MOD%";


--13. Consultar apellidos y oficio de los empleados que son directores. 

    SELECT apellido, oficio
    FROM empleados
    WHERE oficio = "director";

--14. Consultar los pedidos que se han realizado entre el 3 de Noviembre de 1999 y el 5 de
--Octubre de 1999.

    SELECT *
    FROM pedidos
    WHERE fecha_pedido BETWEEN '1999-10-05' AND '1999-11-03';

--15. Visualizar apellido, oficio, fecha de alta y salario de los empleados que entraron en la
--empresa en el año 1981.

    SELECT apellido, oficio, fecha_alta, salario
    FROM empleados
    WHERE fecha_alta BETWEEN '1981-01-01' AND '1981-12-31';

--16. Visualizar apellido, oficio, fecha de alta y salario de los empleados que no se dieron de alta
--en Mayo de 1981.

    SELECT apellido, oficio, fecha_alta, salario
    FROM empleados
    WHERE fecha_alta NOT BETWEEN '1981-05-01' AND '1981-05-31';

--17. Desconectarse o salir del servidor de MySQL.

EXIT;








/*XXXXXXXXXXXXXXXXXXX----BLOQUE DE EJERCICIOS 2.3 ----XXXXXXXXXXXXXXXXXXXXXXX*/


--1. Consultar apellido, salario y nº de departamento de los empleados cuyo salario es menor de 
--2000 euros en los departamentos 10 o 30.

    SELECT  apellido, salario, dep_no
    FROM empleados
    WHERE salario <2000 && dep_no IN (10,30);



--2. Consultar apellido, oficio, salario y comisión de los empleados cuyo oficio es 
--‘VENDEDOR’, ‘ANALISTA’ o ‘EMPLEADO’ y su comisión es NULL.

    SELECT apellido, oficio, salario, comision
    FROM empleados
    WHERE oficio IN ("vendedor","analista","empleado") 
          && comision IS NULL;



--3. Visualiza el apellido, oficio, director y fecha de alta  de los empleados que tienen un director 
--asignado y su fecha de alta es del 15 de Noviembre del 1981 al 25 de Mayo de 1982.

    SELECT apellido, oficio, director, fecha_alta
    FROM empleados
    WHERE director IS NOT NULL
          && fecha_alta BETWEEN '1981-11-15' AND '1981-05-25';



--4. Visualiza el apellido, oficio, director, fecha de alta y nº de departamento de los empleados que 
--no tienen un director asignado y su fecha de alta es en 1981 o son del departamento 20.

    SELECT apellido, oficio, director, fecha_alta, dep_no
    FROM empleados
    WHERE director IS NULL 
          && fecha_alta BETWEEN '1981-01-01' AND '1982-12-31' 
          || dep_no = 20;



--5. Visualiza el apellido, código de departamento y director de los empleados que su apellido 
--Contenga una 'o' o sean del departamento 30 y su director sea el 7698.

    SELECT apellido, dep_no, director
    FROM empleados
    WHERE (apellido LIKE "%o%" OR apellido LIKE "%o" OR apellido LIKE "o%")
          OR dep_no = 30 
          AND director = 7698;



--6. Visualiza el apellido y código de departamento de los empleados que su apellido termine en 
--'ez' y no sean del departamento 30. Etiqueta o nombra las columnas como "Empleado" y 
--"Código departamento" respectivamente.

    SELECT apellido AS "empleado", dep_no AS "Codigo_departamento"
    FROM empleados
    WHERE apellido LIKE "%ez" 
          && dep_no != 30;



--7. Visualiza descripción, precio actual, precio rebajado un 5% y stock disponible  de los 
--productos cuya cantidad en stock es menor que 25 o su precio actual es superior a 500 euros.

    SELECT descripción, precio_actual, precio_actual * (1-(0.05)) AS "REBAJA_5%", stock_disponible 
    FROM productos
    WHERE stock_disponible < 25
          || precio_actual > 500;



--8. Visualiza apellido, fecha de alta, salario, comisión y precio total de los empleados  que no 
--pertenecen al departamento 10 o entraron en la empresa después del verano de 1981. El 
--precio total es salario+comisión, consideramos que la comisión de los empleados cuyo valor 
--es NULL es 0

    SELECT apellido, fecha_alta, salario, comision, salario + IFNULL(comision, 0) AS "precio_total"
    FROM empleados
    WHERE dep_no !=10 
          || fecha_alta >= '1981-09-23';



    -- SELECT apellido, fecha_alta, salario, 
    --    IFNULL(comision, 0) AS comision, 
    --    salario + IFNULL(comision, 0) AS precio_total
    -- FROM empleados
    -- WHERE departamento != 10 
    --       OR fecha_alta >= '1981-09-23';








/*XXXXXXXXXXXXXXXXXXX----BLOQUE DE EJERCICIOS 3.1----XXXXXXXXXXXXXXXXXXXXXXX*/


/*-- SCHEMA TABLA--

ESPECIE    VARCHAR2(26 BYTE)    Yes        1
POBLACION    VARCHAR2(26 BYTE)  Yes        2
PROVINCIA    VARCHAR2(26 BYTE)  Yes        3
ORDEN_REG    NUMBER(38,0)       Yes        4
AÑO_PLANT    NUMBER(38,0)       Yes        5
PULGON    VARCHAR2(26 BYTE)     Yes        6
COCHINILLA    VARCHAR2(26 BYTE) Yes        7
ALTURA_CM    NUMBER(38,0)       Yes        8
ESTADO    VARCHAR2(26 BYTE)     Yes        9
RIEGO    VARCHAR2(26 BYTE)      Yes        10
REC_PERIODICIDAD_PODA VARCHAR2(26 BYTE)Yes 11
ULTIMA_PODA    VARCHAR2(26 BYTE)Yes        12
*/

--1.1 Todos los datos de la tabla.

    select * from ejemplar_arbol;

--1.2 Todos los datos de la tabla, pero sólo las columnas especie y altura en centímetros. Se ordenará 
--por especie en orden ascendente y dentro de cada especie por altura, en orden descendiente. 
--No deben aparecer filar repetidas.

    SELECT DISTINCT ESPECIE, ALTURA_CM 
    FROM EJEMPLAR_ARBOL 
    ORDER BY ESPECIE ASC, ALTURA_CM DESC;

--1.3 Todas las especies de árboles distintas que hay. Utilizar el alias de tabla “A”.

    SELECT DISTINCT ESPECIE AS "A" 
    FROM EJEMPLAR_ARBOL;

--1.4 Los árboles que están plantados en Coslada, ordenados por el año de plantación en orden 
--descendente.

    SELECT * 
    FROM EJEMPLAR_ARBOL 
    WHERE POBLACION = 'COSLADA' 
    ORDER BY AÑO_PLANT DESC;

--1.5 El año de plantación y altura de todos las encinas. La altura debe aparecer con el texto “ALTURA 
--EN CENTÍMETROS”.


    SELECT AÑO_PLANT, ALTURA_CM "ALTURA EN CENTIMEROS" 
    FROM EJEMPLAR_ARBOL 
    WHERE ESPECIE='ENCINA';

--1.6 La especie de árbol y estado de todos los árboles, sin que salgan filas repetidas. En la parte de 
--arriba del listado aparecerán las especies sanas, y a continuación las enfermas.

    SELECT DISTINCT ESPECIE, ESTADO
    FROM EJEMPLAR_ARBOL
    ORDER BY ESTAD DESC;

--1.7 Las especies de árbol que están enfermas (sin que salgan filas repetidas). Sólo hay que listar la 
--columna especie, ordenada ascendentemente.

    SELECT DISTINCT ESPECIE
    FROM EJEMPLAR_ARBOL
    WHERE ESTADO != 'SANO'
    ORDER BY ESPECIE ASC;

--1.8 Las poblaciones, ordenadas por orden alfabético, en las que hay árboles que no tienen cochinilla 
--ni pulgón, sin embargo están enfermos.

    SELECT POBLACION
    FROM EJEMPLAR_ARBOL
    WHERE COCHINILLA != 'SI' AND PULGON != 'SI' AND ESTADO != 'SANO'
    ORDER BY POBLACION ASC;

--1.9 Las especies de Rivas-Vaciamadrid que tienen plaga de cochinilla.

    SELECT ESPECIE
    FROM EJEMPLAR_ARBOL
    WHERE POBLACION = 'RIVAS-VACIAMADRID' AND COCHINILLA !='NO';

--1.10 La especie, año de plantación y altura de los árboles de Guadalajara, ordenados por año de 
--plantación en orden ascendente y por altura descendente

    SELECT ESPECIE, AÑO_PLANT, ALTURA_CM
    FROM EJEMPLAR_ARBOL
    WHERE POBLACION = 'GUADALAJARA'
    ORDER BY AÑO_PLANTASC, ALTURA_CM DESC;

--2.1 Los árboles plantados entre 2010 y 2012.

    SELECT * 
    FROM EJEMPLAR_ARBOL
    WHERE AÑO_PLANT BETWEEN 2010 AND 2012;

--2.2 Los árboles de Madrid que no tienen poda registrada (campo “ultima_poda”) y miden más de 300 
--centímetros.

    SELECT *
    FROM EJEMPLAR_ARBOL
    WHERE PROVINCIA = 'MADRID' AND ULTIMA_PODA = 'NO REGISTRADA' AND ALTURA_CM > 300;

--2.3 Los alcornoques plantados en Oviedo antes del 2007 que miden más de 500 centímetros. 
--Mostrar todos los datos del árbol, ordenados por altura.

    SELECT *
    FROM EJEMPLAR_ARBOL
    WHERE ESPECIE = 'ALCORNOQUE' AND POBLACION = 'OVIEDO' AND AÑO_PLANT < 2007 AND ALTURA_CM > 500
    ORDER BY ALTURA_CM;

--2.4 Las poblaciones y provincias que han podado árboles (campo “ultima_poda”) y sin embargo no 
--tenían recomendada ninguna poda (campo “rec_periodicidad_poda”). 
--Ordenar por provincia, y dentro de provincia por población, en orden alfabético (debe aparecer 
--a la izquierda la provincia y a la derecha la población).

    SELECT PROVINCIA, POBLACION
    FROM EJEMPLAR_ARBOL
    WHERE ULTIMA_PODA != 'NO REGISTRADO' AND REC_PERIODICIDAD_PODA = 'NO PODA';
    ORDER BY PROVINCIA, POBLACION;

--2.5 Las alturas de los árboles que tienen riego de algún tipo y se plantaron antes del año 2000. 
--Deben aparecer ordenadas de mayor a menor.

    SELECT ALTURA_CM
    FROM EJEMPLAR_ARBOL
    WHERE RIEGO IS NOT NULL AND AÑO_PLANT < 2000
    ORDER BY ALTURA_CM;

--2.6 La especie, orden de registro, recomendación de poda y última poda de árboles de la provincia
--de Madrid. Ordenar por la última poda realizada. 
--No deben aparecer árboles que no tienen poda registrada (campo “ultima_poda”). 
--El resultado debe expresar el nombre de las columnas “rec_periodicidad_poda” y “orden_reg” 
--como “recomendación de poda” y “orden de alta en BD”, respectivamente.

    SELECT ESPECIE, ORDEN_REG AS "ORDEN DE ALTA EN BD", REC_PERIODICIDAD_PODA AS "RECOMENDACION DE PODA", ULTIMA_PODA
    FROM EJEMPLAR_ARBOL
    WHERE PROVINCIA = 'MADRID' AND ULTIMA_PODA != 'NO REGISTRADA'
    ORDER BY ULTIMA_PODA;

--2.7 Las ciudades que tienen algún tipo de pino plantado (observa bien las especies, hay diversos 
--pinos). También debe mostrarse la especie de pino. 
--Hay que tener en cuenta que pueden insertarse nuevos tipos de pino en la base de datos, y la 
--consulta debe seguir siendo válida. 

    SELECT POBLACION, ESPECIE
    FROM EJEMPLAR_ARBOL
    WHERE ESPECIE LIKE '%PINO%' 

--2.8 Las poblaciones que tienen más de una palabra. Hay que mostrar la población y su provincia, 
--ordenadas por provincia.

    SELECT POBLACION, PROVINCIA
    FROM EJEMPLAR_ARBOL
    WHERE POBLACION LIKE '% %' OR POBLACION LIKE '%-%'
    ORDER BY PROVINCIA;

--2.9 Los árboles que están enfermos (campo estado) y no tienen riego de ningún tipo (campo riego).

    SELECT *
    FROM EJEMPLAR_ARBOL
    WHERE ESTADO != 'SANO' AND RIEGO IS NOT NULL;

--2.10 Los árboles plantados en las ciudades de Madrid y Barcelona, los años 2000, 2010 y 2015, 
--ordenados por ciudad y dentro de ciudad por altura.

    SELECT *
    FROM EJEMPLAR_ARBOL
    WHERE POBLACION = 'MADRID' OR POBLACION = 'BARCELONA' IN (2000, 2010, 2015)
    ORDER BY POBLACION, ALTURA_CM;





/*XXXXXXXXXXXXXXXXXXX----BLOQUE DE EJERCICIOS 4.1----XXXXXXXXXXXXXXXXXXXXXXX*/