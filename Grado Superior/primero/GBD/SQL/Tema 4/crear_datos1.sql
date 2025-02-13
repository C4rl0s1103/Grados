INSERT INTO CLIENTES_2 
(ID_CLIENTE, NOM_CLI, DIRECCION, LOCALIDAD, TELEFONO)
VALUES('CLI_0001','ROBERTO','c/Rosas 4','Torrejon de Ardoz',917805678);

INSERT INTO CLIENTES_2 
(ID_CLIENTE, NOM_CLI, DIRECCION, LOCALIDAD, TELEFONO)
VALUES('CLI_0002','ROSARIO','c/Claveles 5','Coslada',916778090);

INSERT INTO CLIENTES_2 
(ID_CLIENTE, NOM_CLI, DIRECCION, LOCALIDAD, TELEFONO)
VALUES('CLI_0003','COSME','c/Iglesia 6','Getafe',910009566);

INSERT INTO PEDIDOS_2 
(ID_PEDIDO, ID_CLIENTE, FECHA, IMPORTE)
VALUES('PED_1000','CLI_0002','12/02/13',1650);

INSERT INTO PEDIDOS_2 
(ID_PEDIDO, ID_CLIENTE, FECHA, IMPORTE)
VALUES('PED_1001','CLI_0001','13/02/12',4570);

INSERT INTO PEDIDOS_2 
(ID_PEDIDO, ID_CLIENTE, FECHA, IMPORTE)
VALUES('PED_1003','CLI_0003','17/02/13',560);

INSERT INTO PLATOS_2 
(ID_PLATO, DESC_PLATO, INGREDIENTES, PRECIO)
VALUES('PLA_0001','Ensalada','Lechuga, Tomates y Pepino',5,5);

INSERT INTO PLATOS_2 
(ID_PLATO, DESC_PLATO, INGREDIENTES, PRECIO)
VALUES('PLA_0002','Tortilla','Huevos',4,3);

INSERT INTO PLATOS_2 
(ID_PLATO, DESC_PLATO, INGREDIENTES, PRECIO)
VALUES('PLA_0003','Ternera','Ternera y Verduras',15);

INSERT INTO DETALLE_PEDIDO_2 
(ID_PEDIDO, ID_PLATO, NUM_PLATOS)
VALUES('PED_1000','PLA_0003',4);

INSERT INTO DETALLE_PEDIDO_2 
(ID_PEDIDO, ID_PLATO, NUM_PLATOS)
VALUES('PED_1001','PLA_0001',2);

INSERT INTO DETALLE_PEDIDO_2 
(ID_PEDIDO, ID_PLATO, NUM_PLATOS)
VALUES('PED_1001','PLA_0002',6);