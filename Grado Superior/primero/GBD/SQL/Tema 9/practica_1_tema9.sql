/* 1. */
DROP TABLE IF EXISTS vendedores;

DROP TABLE vendedores;

/* 2. */
CREATE TABLE vendedores
    SELECT emp_no, apellido, director, salario, comision, dep_no
    from empleados
    WHERE oficio = 'vendedor';

/* 3. */ 
SELECT * FROM vendedores;

/* 4. */
DESC vendedores;

/* 5. */
SHOW CREATE TABLE vendedores;

/* 6. */
No.

ALTER TABLE vendedores
MODIFY emp_no int(4) PRIMARY KEY;

ALTER TABLE vendedores
ADD CONSTRAINT pk_vendedores
    PRIMARY KEY vndedores;


/* 7. */ 
ALTER TABLE vendedores
ADD CONSTRAINT FK_VENDEDORES_DEPARTAMENTOS
    FOREIGN KEY vendedores(dep_no)
    references departamentos(dep_no);

/* 8. */ 
ALTER TABLE vendedores
ADD CONSTRAINT FK_VENDEDORES_EMPLEADOS 
    FOREIGN KEY vendedores(director)
    references empleados(director);

/* 9. */
SELECT EMP_NO, APELLIDO, SALARIO 
FROM vendedores
WHERE SALARIO > 1400 
ORDER BY SALARIO DESC;

SELECT EMP_NO, APELLIDO, SALARIO 
FROM vendedores
WHERE SALARIO > 1400 
ORDER BY 3 DESC;

/* 10. */
SELECT v.emp_no, v.apellido, v.dep_no, d.dnombre, d.localidad
FROM vendedores v, departamentos d
WHERE v.dep_no = d.dep_no 
ORDER BY v.dep_no;

/* 11. */ 
SELECT v.emp_no, v.apellido, v.director, e.apellido "apellido director"
FROM vendedores v, empleados e
WHERE v.director = e.emp_no 
ORDER BY v.apellido ASC;

/* 12.*/
CREATE TABLE tabla1
    SELECT dep_no, dnombre
    FROM departamentos;

CREATE TABLE tabla2
    SELECT dep_no "departamento", dnombre "nombre"
    FROM departamentos;



