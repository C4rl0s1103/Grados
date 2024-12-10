<html>
	<head>
		<title>Consulta de libros por categoria</title>
		
		<meta http-equiv='Content-type' content='text/html; charset='ISO-8859-1'/>
		
		<style>table, th, td { border: 1px solid black;}
		th, td{ padding: 10px; }
			</style>
			
	</head>

	<body>
		

		<?php
		
			//MOSTRAR EL CONTENIDO DE UNA TABLA
		
			$categoria = $_POST['categoria'];

			// 1. Conectar con el servidor de base de datos             			  //Es mysqli porque es para las versiones nuevas, si fuera una antigua sería mysql
			$conexion = mysqli_connect ('localhost', 'root', '') 					 //ponemos entre parentesis el ....,usuario, contraseña (root no tiene contraseña         
			or die ("No se puede conectar con el servidor");
				
			// 2. Seleccionar una base de datos
			mysqli_select_db ($conexion,'biblioteca')								//Si fuera para una versión antigua los parámetros estariían alreves ('curso',$conexion)
			or die ("No se puede seleccionar la base de datos");
				
			// 3. Enviar la instrucción SQL a la base de datos
			mysqli_set_charset($conexion,'utf8'); //IMPORTANTE para  reconocer los carácteres)
			if($categoria=="todos"):
				$consulta = "SELECT * FROM libros";
			else:
				$consulta = "SELECT * FROM libros WHERE categoria ='$categoria'"; //Vamos a trabajar con select, insert, delete y create
			endif;
			
			$resultado = mysqli_query ($conexion,$consulta)//En resultado tenemos la salida del select, hacemos un select para poder mostrar lo que vamos a borrar, porque si lo borramos antes no lo podemos ver luego    //Esto es como en el servidor cuando hacemos un enter de la instrucción
			//or die ("Fallo en la consulta");												//En el caso de que haya un fallo en la instrucción
			or die ("ERROR sentencia SQL".mysqli_error()); //Para que nos muestre el error de la consulta como en mysql
				
			// 4. Obtener y procesar los resultados
			$nfilas = mysqli_num_rows($resultado);
			if($nfilas > 0):
				if($categoria=="todos"):
					echo '
						<h2>Consulta de todos los libros</h2>';
									
				else:
					echo '
						<h2>Consulta de libros de '.$categoria.'</h2>';		
				endif;
						
				echo'<table>
						<tr>
							<th> Id </th>
							<th> T&iacute;tulo </th>
							<th> Autor </th>
							<th> Editorial </th>
							<th> Categoria </th>';
				
				for($i=0; $i<$nfilas; $i++):
					$fila = mysqli_fetch_array ($resultado, MYSQLI_ASSOC);
					echo "<tr>";
					echo "<td>".$fila['id']."</td>";                     //Hay que poner los puntos así ".$fila['id']." aunque sean comillas dobles
					echo "<td>".$fila['titulo']."</td>";
					echo "<td>".$fila['autor'].'</td>';
					echo "<td>".$fila['editorial']."</td>";
					echo "<td>".$fila['categoria']."</td>";
					echo "</tr>";
				endfor;
				
				echo"</table>";
				echo "N&uacute;mero de filas mostradas = $nfilas";
				
			else:
				echo "No hay ningún libro";
			endif;
			
			
				// 5. Cerrar la conexión con el servidor de bases de datos
				mysqli_close ($conexion);
				
			//echo " <br/><br/><br/><br/>
		          //<a href="Formulario_Ejercicio6_Listados">Listar otro libro</a>"; //Se podria poner aqui 
			
		?>
		
		<br/><br/><br/><br/>
		<a href="Formulario_Ejercicio6_Listados">Listar otro libro</a>
		
	</body>
</html>