/* 1. */ 
SHOW databases;
DROP DATABASE tema3_practica1;
CREATE DATABASE tema3_practica1;
use tema3_practica1;

/* 2. Y 3. */
/* VARCHAR SON CARACTERES ALFANUMERICOS, CADENA DE TEXTO */
/* INT NUMEROS ENTEROS */
/* NOT NULL, ES QUE NO SE PUEDEN QUEDAR SIN NUMEROS Y UNIQUE ES QUE NO SE PUEDEN REPETIR */
SHOW TABLES;
DROP TABLE CLIENTES_2;
DROP TABLE PEDIDOS_2;
DROP TABLE PLATOS_2;
DROP TABLE DETALLE_PEDIDO_2;
CREATE TABLE CLIENTES_2
(   ID_CLIENTE VARCHAR(10) PRIMARY KEY,
    NOM_CLI VARCHAR(30),
    DIRECCION VARCHAR(30), 
    LOCALIDAD VARCHAR(30),
    TELEFONO INT(9) NOT NULL UNIQUE
);

CREATE TABLE PEDIDOS_2
(   ID_PEDIDO VARCHAR(10) PRIMARY KEY,
    ID_CLIENTE VARCHAR(10),
    FECHA DATE,
    IMPORTE FLOAT(10,2) NOT NULL,
    /* ALIAS A LA FK o restricccion a la tabla */
    CONSTRAINT FK_PEDIDOS_2_CLIENTES_2
    /* REFERENCIA A LA TABLA PEDIDOS_1 Y ID_CLIENTE */
    FOREIGN KEY (ID_CLIENTE)
    /* REFERENCIA A LA TABLA DE LA CLAVE AJENA CLIENTES_1 Y EL ID_CLIENTE */
    REFERENCES CLIENTES_2(ID_CLIENTE)
);

CREATE TABLE PLATOS_2
(   ID_PLATO VARCHAR(10) PRIMARY KEY,
    DESC_PLATO VARCHAR(100),
    INGREDIENTES VARCHAR(100),
    /* en este caso es el 10 es el total de los cuales 2 son decimales */
    PRECIO FLOAT(10,2) NOT NULL
);

CREATE TABLE DETALLE_PEDIDO_2
(   ID_PEDIDO VARCHAR(10),
    ID_PLATO VARCHAR(10),
    NUM_PLATOS INT(2) NOT NULL DEFAULT 1,
    /* CLAVE PRIMARIA COMPUESTA */
    CONSTRAINT PK_DETALLE_PEDIDO_2
    PRIMARY KEY (ID_PEDIDO, ID_PLATO),

    CONSTRAINT FK_DETALLE_PEDIDO_2_PEDIDO_2
    FOREIGN KEY (ID_PEDIDO)
    REFERENCES PEDIDOS_2(ID_PEDIDO),
    
    CONSTRAINT FK_ID_PLATO_2_ID_PLATO
    FOREIGN KEY (ID_PLATO)
    REFERENCES PLATOS_2(ID_PLATO)
);
