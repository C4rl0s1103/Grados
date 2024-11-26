/* 1. */ 
SET AUTOCOMMIT = 0;

    UPDATE empleados
    SET salario = salario + 500
    WHERE dep_no IN (
        SELECT dep_no
        FROM departamentos
        WHERE localidad != 'MADRID'
    );

    ROLLBACK;
    COMMIT;

/* 2. */
SET AUTOCOMMIT = 0;

    UPDATE empleados
    SET dep_no = (
        SELECT dep_no 
        FROM departamentos 
        WHERE dnombre = 'ventas'
    )
    WHERE emp_no = 7900;

    ROLLBACK;
    COMMIT;

/* 3. */
SET AUTOCOMMIT = 0;

    DELETE FROM departamentos
    WHERE dep_no NOT IN (
        SELECT DISTINCT dep_no
        FROM EMPLEADOS
    );

    ROLLBACK;
    COMMIT;

/* 4. */ 
