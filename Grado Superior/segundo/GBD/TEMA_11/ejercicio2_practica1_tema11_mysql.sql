
/*   Crear BBDD  "mi_club"  */
DROP DATABASE IF EXISTS mi_club;
CREATE DATABASE mi_club;
USE mi_club;

/*   Crear la tabla "cuotas"  */
DROP TABLE IF EXISTS cuotas;
CREATE TABLE cuotas
( codigo_actividad 	CHAR(4) NOT NULL,
  pago 		ENUM('mensual','anual') NOT NULL DEFAULT 'mensual',
  actividad VARCHAR(20) NOT NULL,
  precio	FLOAT(7,2) NOT NULL,
CONSTRAINT PK_CUOTAS PRIMARY KEY (codigo_actividad,pago))
ENGINE = InnoDB CHARACTER SET 'latin1'
; 


/*   Insertar datos en la tabla "cuotas"  */

/* 1� FORMA  larga */
 	INSERT INTO cuotas (codigo_actividad,actividad,precio) 
	  VALUES ('BA01', 'baloncesto', 45.50);
	INSERT INTO cuotas (codigo_actividad,pago,actividad,precio) 
	  VALUES ('BA01',  'anual', 'baloncesto', 360.90);
	INSERT INTO cuotas (codigo_actividad,actividad,precio) 
	  VALUES ('TE02', 'tenis', 80.50);  

/*  2� FORMA  corta */
/*
 	INSERT INTO cuotas VALUES ('BA01', 'mensual', 'baloncesto', 45.50);
	INSERT INTO cuotas VALUES ('BA01',  'anual', 'baloncesto', 360.90);
	INSERT INTO cuotas VALUES ('TE02', 'mensual', 'tenis', 80.50);  
*/
/*  2� FORMA corta  m�s simplificada*/
/* 	INSERT INTO cuotas VALUES
		('BA01', 'mensual', 'baloncesto', 45.50),
		('BA01',  'anual', 'baloncesto', 360.90),
		('TE02', 'mensual', 'tenis', 80.50);    
*/		
		
	
	
/*   Crear la tabla "socios"  */
DROP TABLE IF EXISTS socios;
CREATE TABLE socios
( num_socio INT(4)  NOT NULL,
  codigo_actividad 	CHAR(4) NOT NULL,
  pago 		ENUM('mensual','anual') NOT NULL DEFAULT 'mensual',
  nombre VARCHAR(15) NOT NULL,
CONSTRAINT PK_SOCIOS PRIMARY KEY (num_socio,codigo_actividad),
CONSTRAINT FK_SOCIOS_CUOTAS FOREIGN KEY (codigo_actividad) REFERENCES cuotas (codigo_actividad))
ENGINE = InnoDB CHARACTER SET 'latin1'
; 


/*   Insertar datos en la tabla "socios"  */

/* 1� FORMA  larga */
  INSERT INTO socios (num_socio,codigo_actividad,nombre) VALUES (1001, 'BA01','Rosa');
  INSERT INTO socios (num_socio,codigo_actividad,pago,nombre) VALUES (1001, 'TE02', 'anual', 'Rosa');
  INSERT INTO socios (num_socio,codigo_actividad,nombre) VALUES (1002, 'TE02', 'Lucas');   
	
/* 2� FORMA  corta */
/*	INSERT INTO socios VALUES (1001, 'BA01','mensual','Rosa');
	INSERT INTO socios VALUES (1001, 'TE02', 'anual', 'Rosa');
	INSERT INTO socios VALUES (1002, 'TE02','mensual','Lucas');   */  
	

/*  2� FORMA corta  m�s simplificada*/
/* 	INSERT INTO socios VALUES
		(1001, 'BA01','mensual','Rosa'),
		(1001, 'TE02', 'anual', 'Rosa'),
		(1002, 'TE02','mensual','Lucas');  
*/	
	
	
