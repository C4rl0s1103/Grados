/* 1. */ 
SHOW databases;
DROP DATABASE tema3_practica1;
CREATE DATABASE tema3_practica1;
use tema3_practica1;

/* 2. Y 3. */
/* VARCHAR SON CARACTERES ALFANUMERICOS, CADENA DE TEXTO O STRING */
/* INT NUMEROS ENTEROS */
/* NOT NULL, ES QUE NO SE PUEDEN QUEDAR SIN NUMEROS Y UNIQUE ES QUE NO SE PUEDEN REPETIR */
SHOW TABLES;
DROP TABLE CLIENTES_1;
DROP TABLE PEDIDOS_1;
DROP TABLE PLATOS_1;
DROP TABLE DETALLE_PEDIDO_1;
CREATE TABLE CLIENTES_1
(   ID_CLIENTE VARCHAR(10) PRIMARY KEY,
    NOM_CLI VARCHAR(30),
    DIRECCION VARCHAR(30), 
    LOCALIDAD VARCHAR(30),
    TELEFONO INT(9) NOT NULL UNIQUE
);

CREATE TABLE PEDIDOS_1
(   ID_PEDIDO VARCHAR(10) PRIMARY KEY,
    ID_CLIENTE VARCHAR(10),
    FECHA DATE,
    IMPORTE FLOAT(10,2),
    /* ALIAS A LA FK */
    CONSTRAINT FK_PEDIDOS_1_CLIENTES_1
    /* REFERENCIA A LA TABLA PEDIDOS_1 Y ID_CLIENTE */
    FOREIGN KEY PEDIDOS_1(ID_CLIENTE)
    /* REFERENCIA A LA TABLA DE LA CLAVE AJENA CLIENTES_1 Y EL ID_CLIENTE */
    REFERENCES CLIENTES_1(ID_CLIENTE)
);

CREATE TABLE PLATOS_1
(   ID_PLATO VARCHAR(10) PRIMARY KEY,
    DESC_PLATO VARCHAR(100),
    INGREDIENTES VARCHAR(100),
    PRECIO FLOAT(10,2)
);

CREATE TABLE DETALLE_PEDIDO_1
(   ID_PEDIDO VARCHAR(10) PRIMARY KEY,
    ID_PLATO VARCHAR(10),
    NUM_PLATOS INT(2) NOT NULL DEFAULT 1,
    CONSTRAINT FK_DETALLE_PEDIDO_1_PEDIDO_1
    FOREIGN KEY (ID_PEDIDO)
    REFERENCES PEDIDOS_1(ID_PEDIDO),
    CONSTRAINT FK_ID_PLATO_1_ID_PLATO
    FOREIGN KEY (ID_PLATO)
    REFERENCES PLATOS_1(ID_PLATO)
);
