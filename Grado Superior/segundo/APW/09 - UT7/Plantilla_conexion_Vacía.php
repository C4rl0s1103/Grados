<html>
	<head>
		<title>Acceso a la BBDD curso</title>
		<meta http-equiv='Content-type' content='text/html; charset='ISO-8859-1'/>
	</head>

<body>


<?php
	
	//M O S T R A R   E L   C O N T E N I D O   D E   U N A   T A B L A


// 1. Conectar con el servidor de base de datos
$conexion = mysqli_connect ('localhost', 'root', '')
or die ("No se puede conectar con el servidor");
// 2. Seleccionar una base de datos
mysqli_select_db ($conexion,'curso')
or die ("No se puede seleccionar la base de datos");
// 3. Enviar la instrucci�n SQL a la base de datos
$consulta = "SELECT emp_no,apellido FROM empleados
			 WHERE oficio='vendedor'";   
$resultado = mysqli_query ($conexion,$consulta)
or die ("Fallo en la consulta");
// 4. Obtener y procesar los resultados

echo "EN BREVE HAR&Eacute; ALGO";

// 5. Cerrar la conexi�n con el servidor de bases de datos
mysqli_close ($conexion);
?>
</body>
</html>