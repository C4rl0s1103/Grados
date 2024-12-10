<html>
	<head>
		<title>Acceso a la BBDD curso</title>
		<meta http-equiv='Content-type' content='text/html; charset='ISO-8859-1'/>
	</head>

<body>


<?php
	
	//M O S T R A R   E L   C O N T E N I D O   D E   U N A   T A B L A


// 1. Conectar con el servidor de base de datos               //Es mysqli porque es para las versiones nuevas, si fuera una antigua sería mysql
$conexion = mysqli_connect ('localhost', 'root', '') 		//ponemos entre parentesis el ....,usuario, contraseña (root no tiene contraseña         
or die ("No se puede conectar con el servidor");
// 2. Seleccionar una base de datos
mysqli_select_db ($conexion,'curso')						//Si fuera para una versión antigua los parámetros estariían alreves ('curso',$conexion)
or die ("No se puede seleccionar la base de datos");
// 3. Enviar la instrucción SQL a la base de datos
$consulta = "SELECT emp_no,apellido FROM empleados           
			 WHERE oficio='vendedor'";   					//Vamos a trabajar con select, insert, delete y create
$resultado = mysqli_query ($conexion,$consulta)             //Esto es como en el servidor cuando hacemos un enter de la instrucción
or die ("Fallo en la consulta");							//En el caso de que haya un fallo en la instrucción
// 4. Obtener y procesar los resultados
															//Qué resultado quiero que sea cuando es un select, cuando es un insert...
echo "EN BREVE HAR&Eacute; ALGO"; 							// si sale el texto en breve haré algo quiere decir que hemos conseguido conectar con el servidor

// 5. Cerrar la conexión con el servidor de bases de datos
mysqli_close ($conexion);
?>
</body>
</html>