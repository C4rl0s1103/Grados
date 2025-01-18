/* 1. */
create view madrid_sevilla AS
select p.pedido_no, p.cliente_no, c.nombre, c.localidad, c.vendedor_no, c.limite_credito
from pedidos p, clientes c
where p.cliente_no = c.cliente_no AND c.localidad IN ('madrid', 'sevilla');

/* 2. */
update clientes 
set limite_credito = 8000 
where nombre Like 'M%' OR vendedor_no NOT IN ('7499','7844');

/* 3. */
select * from madrid_sevilla where pedido_no < 1005 order by pedido_no;
+-----------+------------+----------------------+-----------+-------------+----------------+
| pedido_no | cliente_no | nombre               | localidad | vendedor_no | limite_credito |
+-----------+------------+----------------------+-----------+-------------+----------------+
|      1001 |        106 | SIGNOLOGIC S.A.      | MADRID    |        7654 |        8000.00 |
|      1002 |        101 | DISTRIBUCIONES GOMEZ | MADRID    |        7499 |        5000.00 |
|      1004 |        106 | SIGNOLOGIC S.A.      | MADRID    |        7654 |        8000.00 |
+-----------+------------+----------------------+-----------+-------------+----------------+
3 rows in set (0.00 sec)

/* 4. */
drop table pedidos;
drop table clientes; 


/* 5. */
select * from madrid_sevilla;
ERROR 1356 (HY000): View 'curso.madrid_sevilla' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them

/* 6. */
data
    mi_club
        cuotas.frm
        db.opt
        socios.frm
    ib_logfile()
    ib_logfile1
    ibdata1

/* 7. */
mysql -u root -p -e "C:\estructura.sql" > C:\salida_socios.txt 

/* 8. */
mysqlshow.exe -u root -p use mi_club ; show tables;

/* 9. */
mysql> use mi_club
mysql> select * from socios where pago = 'anual'

/* 10. */
mysql -u root -p curso -e "use mi_club; select * from socios where pago = 'anual' "