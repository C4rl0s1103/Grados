<html>
	<head>
		<title>Consulta de libros por categoria</title>
		
		<meta http-equiv='Content-type' content='text/html; charset='ISO-8859-1'/>
	
			
	</head>

	<body>
	
		<?php
		
			// 1. Conectar con el servidor de base de datos             			  //Es mysqli porque es para las versiones nuevas, si fuera una antigua sería mysql
			$conexion = mysqli_connect ('localhost', 'root', '') 					 //ponemos entre parentesis el ....,usuario, contraseña (root no tiene contraseña         
			or die ("No se puede conectar con el servidor");
				
			// 2. Seleccionar una base de datos
			mysqli_select_db ($conexion,'biblioteca')								//Si fuera para una versión antigua los parámetros estariían alreves ('curso',$conexion)
			or die ("No se puede seleccionar la base de datos");
				
			// 3. Enviar la instrucción SQL a la base de datos
			mysqli_set_charset($conexion,'utf8');
			$consulta = "UPDATE libros SET editorial = 'Santillana' WHERE editorial = 'Anaya'";
			
			$resultado = mysqli_query ($conexion,$consulta)//En resultado tenemos la salida del select, hacemos un select para poder mostrar lo que vamos a borrar, porque si lo borramos antes no lo podemos ver luego    //Esto es como en el servidor cuando hacemos un enter de la instrucción
			or die ("Fallo en la consulta");												//En el caso de que haya un fallo en la instrucción
			//or die ("ERROR sentencia SQL".mysqli_error()); //Para que nos muestre el error de la consulta como en mysql
				
			// 4. Obtener y procesar los resultados
			echo '<b>Resultado de la modificaci&oacute;n </b></br></br>
				 &nbsp;&nbsp;El libro ha sido modificado correctamente.
				 <br/><br/>&nbsp; &nbsp; &nbsp; &nbsp;
				 <a href="Practica1_Ejercicio3">Mostrar libros</a>'; //Mirar el ej3 que no lo tengo **************
					
				// 5. Cerrar la conexión con el servidor de bases de datos
				mysqli_close ($conexion);
			
		?>
		
	</body>
</html>