/* *** SCRIPT PARA CREAR Y CARGAR LAS TABLAS DE LA BBDD BIBLIOTECA
 *** LIBROS  */

/* ######################## SELECCION DE LA BASE DE DATOS ####################### */

DROP DATABASE IF EXISTS BIBLIOTECA;
CREATE DATABASE BIBLIOTECA;
USE BIBLIOTECA;
/* ######################## BORRADO DE TABLAS #######################
   # POR SI YA EXISTEN Y SE QUIEREN VOLVER A CREAR ##################
   # sI NO EXISTEN SE PRODUCIRAN UNOS ERRORES QUE NO DEBEN SER TENIDOS EN CUENTA ##### */

DROP TABLE IF EXISTS LIBROS;

/* ######################## CREACION DE TABLAS #######################  
   ## TABLA LIBROS  */
   
CREATE TABLE LIBROS
( id  INT(4) AUTO_INCREMENT,
  titulo  VARCHAR(60) NOT NULL,
  autor	  VARCHAR(40) NOT NULL,
  editorial VARCHAR(20),
  categoria ENUM('Texto','Lectura') NOT NULL DEFAULT 'Texto',
CONSTRAINT PK_LIBROS_ID PRIMARY KEY (ID))
ENGINE = INNODB;
/*  ##################### INTRODUCCIÓN DE DATOS ######################
    ## LIBROS  */

INSERT INTO LIBROS (TITULO, AUTOR, EDITORIAL, CATEGORIA) 
VALUES('Gestión de Bases de Datos','Iván López Montalbán','Garceta','Texto');
INSERT INTO LIBROS (TITULO, AUTOR, EDITORIAL, CATEGORIA)
VALUES('El PC Hardware y componetes','Juan E. Herrerías Rey','Anaya','Lectura');