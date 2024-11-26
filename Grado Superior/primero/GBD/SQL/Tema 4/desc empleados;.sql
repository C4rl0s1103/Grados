desc empleados; 
select * from empleados;
show tables;

/* Añadir una nueva columna */
alter table empleados
add nombre varchar(10) after emp_no;

alter table empleados
add nombre varchar(10) default '';

/* Borrar una columna */
alter table empleados
drop nombre;

/* cambiar el nombre de una columna */ 
alter table empleados 
change nombre nombre_emp varchar(10);

/* modificar el tipo de columna de una tabla */ 
alter table empleados
modify nombre_emp varchar(15);

/* renombrar la tabla */
alter table empleados
rename to nuevos_empleados