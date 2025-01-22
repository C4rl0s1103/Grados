/* Paso 1: crear BBDD joomla2101 */

show databases;
drop databases joomla2101;
create database joomla2101;
use joomla2101;

/* Paso 2: crear usuario joomla2101 */

create user 'joomla2101'@'localhost' identified by 'joomla2101';
grant all privileges on joomla2101.* to 'joomla2101'@'localhost';

select user, host, authentication_string
from mysql.user;