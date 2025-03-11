/* Paso 1: crear BBDD joomla2101 */

show databases;
drop database joomla1702;
create database joomla1702;
use joomla1702;

/* Paso 2: crear usuario joomla2101 */

create user 'joomla1702'@'localhost' identified by 'joomla1702';
grant all privileges on joomla1702.* to 'joomla1702'@'localhost';

select user, host, authentication_string
from mysql.user;


joomlaprexamen
adminadminadmin