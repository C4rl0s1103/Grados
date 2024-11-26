/* Crear BBDD "mi club" */ 
DROP DATABASE IF EXISTS mi_club;
CREATE DATABASE mi_club;
USE mi_club;

/* crear la tabla cuotas */ 
DROP TABLE IF EXISTS cuotas;
CREATE TABLE cuotas 
(
    codigo_actividad CHAR(4) NOT NULL;
    PAGO    ENUM('mensual','anual') NOT NULL DEFAULT 'MENSUAL',
    actividad VARCHAR(20) NOT NULL,
    precio FLOAT(7,2) NOT NULL,
    CONSTRAINT PK_CUOTAS PRIMARY KEY (codigo_actividad,pago)
);

/*  */