<html>
	<head>
		<title>Formulario</title>
		 <meta http-equiv='Content-type' content='text/html' charset='ISO-8859-1'/>  
	</head>

<body>


<?php
	
			//M O S T R A R   E L   C O N T E N I D O   D E   U N A   T A B L A


// 1. Conectar con el servidor de base de datos
$conexion = mysqli_connect ('localhost', 'root', '')
or die ("No se puede conectar con el servidor");
// 2. Seleccionar una base de datos
mysqli_select_db ($conexion,'biblioteca')
or die ("No se puede seleccionar la base de datos");
// 3. Enviar la instrucción SQL a la base de datos
$consulta = "SELECT * FROM libros";   
$resultado = mysqli_query ($conexion,$consulta)
or die ("Fallo en la consulta");
// 4. Obtener y procesar los resultados
$nfilas = mysqli_num_rows ($resultado);	
echo "Número de filas = $nfilas <br/><br/>";
if ($nfilas > 0):
	for ($i=0; $i<$nfilas; $i++):
			$fila = mysqli_fetch_array ($resultado,MYSQLI_ASSOC);
			
			echo $fila['id'].'<br/>';
			echo $fila['titulo'].'<br/>';
			echo $fila['autor'].'<br/>';
			echo $fila['editorial'].'<br/>';
			echo $fila['categoria'].'<br/>';
			echo "<br/><br/>";  
			
	endfor;
else:
	echo "No hay ningún libro";
endif;
// 5. Cerrar la conexión con el servidor de bases de datos
mysqli_close ($conexion);
	
?>
</body>
</html>