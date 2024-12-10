<!--
<html>
	<head>
		<title>Borrado de libros</title>
		<style>table, th, td { border: 1px solid black;}
			   th, td{ padding: 10px; }
		</style>
		<meta http-equiv='Content-type' content='text/html; charset='ISO-8859-1'/>
	</head>

	<body>


		
/*		
		if(empty($_POST['id'])): 
			echo 'ERROR: obligatorio introducir un valor en cada campo';
		else:
			$numero = $_POST['id'];
			
			//CONSULTAR UN REGISTRO EN UNA TABLA

			// 1. Conectar con el servidor de base de datos             			  //Es mysqli porque es para las versiones nuevas, si fuera una antigua sería mysql
			$conexion = mysqli_connect ('localhost', 'root', '') 					 //ponemos entre parentesis el ....,usuario, contraseña (root no tiene contraseña         
			or die ("No se puede conectar con el servidor");
			
			// 2. Seleccionar una base de datos
			mysqli_select_db ($conexion,'biblioteca')								//Si fuera para una versión antigua los parámetros estariían alreves ('curso',$conexion)
			or die ("No se puede seleccionar la base de datos");
			
			// 3. Enviar la instrucción SQL a la base de datos
			mysqli_set_charset($conexion,'utf8'); //Para que reconozca los utf8, por ejemplo los acentos del formulario
			
			$consulta = "SELECT * FROM libros WHERE id=$numero"; 						//Vamos a trabajar con select, insert, delete y create
			$resultado = mysqli_query ($conexion,$consulta)//En resultado tenemos la salida del select, hacemos un select para poder mostrar lo que vamos a borrar, porque si lo borramos antes no lo podemos ver luego    //Esto es como en el servidor cuando hacemos un enter de la instrucción
			or die ("ERROR sentencia SQL");												//En el caso de que haya un fallo en la instrucción
			//or die ("ERROR sentencia SQL".mysqli_error()); //Para que nos muestre el error de la consulta como en mysql
			
			// 4. Obtener y procesar los resultados
			$nfilas = mysqli_num_rows($resultado);
			if($nfilas > 0):
			echo '
			<h2>Datos del libro borrado</h2>
				<table>
				<tr>
					<th> Id </th>
					<th> T&iacute;tulo </th>
					<th> Autor </th>
					<th> Editorial </th>
					<th> Categoria </th>';
					
			for($i=0; $i<$nfilas; $i++):
				$fila = mysqli_fetch_array ($resultado, MYSQLI_ASSOC);
					echo '<tr>';
					echo '<td>'.$fila['id'].'</td>';
					echo '<td>'.$fila['titulo'].'</td>';
					echo '<td>'.$fila['autor'].'</td>';
					echo '<td>'.$fila['editorial'].'</td>';
					echo '<td>'.$fila['categoria'].'</td>';
					echo '</tr>';
			endfor;
			
			echo'</table>';
			echo "N&uacute;mero de filas mostradas = $nfilas";
			
		else:
			echo "No hay ningún libro";
		endif;
		
		//BORRAR UN LIBRO
			$consulta = "delete from libros where id = $numero";
			$resultado = mysqli_query($conexion,$consulta)
			or die ("ERROR sentencia SQL");
			//or die ("ERROR sentencia SQL".mysqli_error()); //Para que nos muestre el error de la consulta como en mysql
	
			// 5. Cerrar la conexión con el servidor de bases de datos
			mysqli_close ($conexion);
			
		
		
		?>*/
		
		<br/><br/><br/><br/>
		<a href="Formulario_Ejercicio5_Borrar">Borrar otro libro</a>
		
	</body>
</html>

-->

<html>
	<head>
		<title>Borrado de libros</title>
		<style>
			   table, th, td { border: 1px solid black;}
			   th, td{ padding: 10px; }
		</style>
		<meta http-equiv='Content-type' content='text/html; charset='ISO-8859-1'/>
	</head>

	<body>


		<?php
		
		if(empty($_POST['id'])): 
			echo 'ERROR: obligatorio introducir un valor en cada campo';
		else:
			$numero = $_POST['id'];
			
			//CONSULTAR UN REGISTRO EN UNA TABLA

			// 1. Conectar con el servidor de base de datos             			  //Es mysqli porque es para las versiones nuevas, si fuera una antigua sería mysql
			$conexion = mysqli_connect ('localhost', 'root', '') 					 //ponemos entre parentesis el ....,usuario, contraseña (root no tiene contraseña         
			or die ("No se puede conectar con el servidor");
			
			// 2. Seleccionar una base de datos
			mysqli_select_db ($conexion,'biblioteca')								//Si fuera para una versión antigua los parámetros estariían alreves ('curso',$conexion)
			or die ("No se puede seleccionar la base de datos");
			
			// 3. Enviar la instrucción SQL a la base de datos
			mysqli_set_charset($conexion,'utf8'); //Para que reconozca los utf8, por ejemplo los acentos del formulario
			
			$consulta = "SELECT * FROM libros WHERE id=$numero"; 						//Vamos a trabajar con select, insert, delete y create
			$resultado = mysqli_query ($conexion,$consulta)//En resultado tenemos la salida del select, hacemos un select para poder mostrar lo que vamos a borrar, porque si lo borramos antes no lo podemos ver luego    //Esto es como en el servidor cuando hacemos un enter de la instrucción
			or die ("ERROR sentencia SQL");												//En el caso de que haya un fallo en la instrucción
			//or die ("ERROR sentencia SQL".mysqli_error()); //Para que nos muestre el error de la consulta como en mysql
			
			// 4. Obtener y procesar los resultados
			$nfilas = mysqli_num_rows($resultado);
			if($nfilas > 0):
				echo '
				<h2>Datos del libro borrado</h2>
					<table>
					<tr>
						<th> Id </th>
						<th> T&iacute;tulo </th>
						<th> Autor </th>
						<th> Editorial </th>
						<th> Categoria </th>
					</tr>';
						
				for($i=0; $i<$nfilas; $i++):
					$fila = mysqli_fetch_array ($resultado, MYSQLI_ASSOC);
						echo '<tr>';
						echo '<td>'.$fila['id'].'</td>';
						echo '<td>'.$fila['titulo'].'</td>';
						echo '<td>'.$fila['autor'].'</td>';
						echo '<td>'.$fila['editorial'].'</td>';
						echo '<td>'.$fila['categoria'].'</td>';
						echo '</tr>';
				endfor;
				
				echo'</table>';
				echo "N&uacute;mero de filas mostradas = $nfilas";
				
			else:
				echo "No hay ningún libro";
			endif;
		
		//BORRAR UN LIBRO
			$consulta = "delete from libros where id = $numero";
			$resultado = mysqli_query($conexion,$consulta)
			or die ("ERROR sentencia SQL");
			//or die ("ERROR sentencia SQL".mysqli_error()); //Para que nos muestre el error de la consulta como en mysql
	
			// 5. Cerrar la conexión con el servidor de bases de datos
			mysqli_close ($conexion);
		endif;
		
		//echo '<br/><br/>                                              //Podría ir aquí
		//<a href="Formulario_Ejercicio5_Borrar">Borrar otro libro</a>';
		?>
		
		<br/><br/>
		<a href="Formulario_Ejercicio5_Borrar">Borrar otro libro</a>
		
		
	</body>
</html>