/* 1. */ 
SELECT oficio, 
    COUNT(*) AS "Total empleados"
FROM empleados
WHERE SALARIO > '1400'
GROUP BY oficio
HAVING COUNT(*) >= 2;

+----------+-----------------+
| oficio   | Total empleados |
+----------+-----------------+
| DIRECTOR |               2 |
| VENDEDOR |               2 |
+----------+-----------------+
2 rows in set (0.00 sec)

/* 2. */ 
SELECT vendedor_no AS "Nº vendedor", 
    COUNT(*) AS "Total clientes"
FROM clientes
GROUP BY vendedor_no
HAVING COUNT(*) > 2;

+-------------+----------------+
| Nº vendedor | Total clientes |
+-------------+----------------+
|        7654 |              4 |
+-------------+----------------+
1 row in set (0.00 sec)

/* 3. */ 
SELECT cliente_no AS "Nº de cliente", 
    SUM(Unidades) AS "Unidades pedidas"
FROM pedidos
GROUP BY cliente_no
HAVING SUM(Unidades) >= 10;

+---------------+------------------+
| Nº de cliente | Unidades pedidas |
+---------------+------------------+
|           101 |               10 |
|           105 |               21 |
|           106 |               20 |
+---------------+------------------+
3 rows in set (0.00 sec)

/* 4. */ 
SELECT VENDEDOR_NO AS "Nº VENDEDOR", 
    AVG(limite_credito) AS "Media limite credito", 
    COUNT(limite_credito) AS "Nº de clientes"
FROM clientes
GROUP BY vendedor_no
having COUNT(*)>2;

/*
SELECT VENDEDOR_NO AS "Nº VENDEDOR",
    AVG(limite_credito) AS "Media limite credito",
    COUNT(cliente_no) AS "Nº de clientes"
FROM clientes
GROUP BY vendedor_no
having COUNT(*)>2;
*/

+-------------+----------------------+----------------+
| Nº VENDEDOR | Media limite credito | Nº de clientes |
+-------------+----------------------+----------------+
|        7654 |          5000.000000 |              4 |
+-------------+----------------------+----------------+
1 row in set (0.00 sec)

/* 5. */ 
SELECT producto_no AS "Nº de producto", 
    MIN(fecha_pedido) AS "fecha pedido mas antiguo",
    MAX(fecha_pedido) AS "fecha pedido mas reciente"
FROM PEDIDOS
GROUP BY producto_no;

+----------------+--------------------------+---------------------------+    
| Nº de producto | fecha pedido mas antiguo | fecha pedido mas reciente |    
+----------------+--------------------------+---------------------------+    
|             10 | 1999-10-07               | 1999-12-06                |    
|             20 | 1999-10-06               | 2000-01-20                |    
|             30 | 1999-10-20               | 1999-12-15                |
|             40 | 1999-10-20               | 1999-12-08                |    
|             50 | 1999-10-06               | 1999-11-06                |    
|             70 | 1999-11-03               | 2000-01-16                |    
+----------------+--------------------------+---------------------------+    
6 rows in set (0.00 sec)

/* 6. */
SELECT dep_no AS "Nº de dpto",
    SUM(salario) AS "Suma salarial mensual"
FROM empleados 
GROUP BY dep_no;

+------------+-----------------------+
| Nº de dpto | Suma salarial mensual |
+------------+-----------------------+
|         10 |               9800.50 |
|         20 |               4750.00 |
|         30 |               8550.12 |
+------------+-----------------------+
3 rows in set (0.00 sec)