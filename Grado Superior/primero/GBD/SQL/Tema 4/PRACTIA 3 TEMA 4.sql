/* 1. Crear base de datos y poner en uso */
CREATE DATABASE tema4_practica3;
/* SI QUEREMOS ELIMINARLA USAREMOS EL DROP DATABASE tema4_practica3 */ 
use tema4_practica3;

/* 2. */
DROP TABLE SOCIOS; 
CREATE TABLE SOCIOS (
    /* int numeros enteros */
    /* varchar es maximo de caracteres */
    /* char siempre son esos caracteres */
    socio_no INT(4) PRIMARY KEY,
    apellidos VARCHAR(14) UNIQUE,
    telefono CHAR(9) NOT NULL,
    fecha_alta DATE DEFAULT '2000-01-01',
    direccion VARCHAR(20),
    codigo_postal INT(5)
);

DROP TABLE PRESTAMOS;
CREATE TABLE PRESTAMOS (
    num_prestamo INT(2) PRIMARY KEY,
    socio_no INT(4),
    CONSTRAINT FK_PRESTAMOS_SOCIOS
    FOREIGN KEY (socio_no)
    REFERENCES socios(socio_no)
);

/* 3. */

/* TABLA SOCIOS */
/* PONEMOS '' CUANDO EN LA TABLA TENEMOS VARCHAR, CHAR Y DATE */
INSERT INTO SOCIOS
(socio_no,apellidos,telefono,fecha_alta,direccion,codigo_postal)
VALUES (1000,'LOPEZ SANTOS','916543267','2005-01-08','C.REAL 5',28400);

INSERT INTO SOCIOS
(socio_no,apellidos,telefono,fecha_alta,direccion,codigo_postal)
VALUES (1001,'PEREZ CERRO','918451256','2005-01-12','C.MAYOR 31',28400);

INSERT INTO SOCIOS
(socio_no,apellidos,telefono,fecha_alta,direccion,codigo_postal)
VALUES (1002,'LOPEZ PEREZ','916543267','2005-01-18','C.REAL 5',28400);

INSERT INTO SOCIOS
(socio_no,apellidos,telefono,fecha_alta,direccion,codigo_postal)
VALUES (1003,'ROMA LEIVA','','2005-01-21','C.PANADEROS 9',28431);

INSERT INTO SOCIOS
(socio_no,apellidos,telefono,fecha_alta,direccion,codigo_postal)
VALUES (1004,'GOMEZ DURUELO','918654329','2005-01-31','C.REAL 15',28400);

INSERT INTO SOCIOS
(socio_no,apellidos,telefono,fecha_alta,direccion,codigo_postal)
VALUES (1005,'PEÑA MAYOR','918515256','2000-01-01','C.LARGA 31',28431);

/* TABLA PRESTAMOS */
INSERT INTO PRESTAMOS
(num_prestamo,socio_no)
VALUES(1,1001);

INSERT INTO PRESTAMOS
(num_prestamo,socio_no)
VALUES(2,1002);

INSERT INTO PRESTAMOS
(num_prestamo,socio_no)
VALUES(3,1003);


/* 4. y 5. */
SELECT socio_no,telefono 
FROM SOCIOS
WHERE direccion LIKE 'C.PANADEROS%' OR fecha_alta BETWEEN '2005-01-01' AND '2005-01-15';

+----------+-----------+
| socio_no | telefono  |
+----------+-----------+
|     1000 | 916543267 |
|     1001 | 918451256 |
|     1003 |           |
+----------+-----------+
3 rows in set (0.00 sec)

/* 6. */
INSERT INTO PRESTAMOS 
(num_prestamo,socio_no)
VALUES(4,1002);

/* 7. */
/* SI. */

/* 8. */ 
/* ACTUALIZAR DE LA TABLA SOCIOS EL APELLIDO DE LOPEZ SANTOS A MANOLITO */
/* ACTUALIZAR EL VALOR DE LA TABLA  */
ALTER TABLE SOCIOS
SET SOCIO_NO = 3333
WHERE SOCIO_NO = 1003;


/* 9. */
/* NO ES POSIBLE */

/* 10. */
DELETE FROM PRESTAMOS
WHERE SOCIO_NO = 1001;

/* 11. */
/* SI ES POSIBLE */ 

/* 12. */
/* ELIMINAR COLUMNA DE X TABLA */
ALTER TABLE SOCIOS
DROP codigo_postal;

/* 13. */

/* 14. */ 
SET AUTOCOMMIT = 0;

SI, ROLLBACK;

/* 15. */ 
SET AUTOCOMMIT = 1;

no, por que el commit esta activado
/* 16. */ 
SET AUTOCOMMIT = 0;

