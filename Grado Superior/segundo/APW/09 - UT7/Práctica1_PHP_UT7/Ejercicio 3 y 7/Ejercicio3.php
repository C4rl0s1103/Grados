<!--Cargamos el ej 1 con source C:\Users\SERGIO\Desktop\Ejercicio1_Practica1_Dado.sql -->

<html>
	<head>
		<title>Ejercicio3</title>
		<meta http-equiv='Content-type' content='text/html' charset='ISO-8859-1'/>  
		<style>
				table, th, td { border: 1px solid black;}
				th, td{ padding: 10px; }
		</style>
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
mysqli_set_charset($conexion,'utf8'); //sin esto salen mal las tildes
$consulta = "SELECT * FROM libros";   
$resultado = mysqli_query ($conexion,$consulta)
or die ("Fallo en la consulta");
// 4. Obtener y procesar los resultados
$nfilas = mysqli_num_rows ($resultado);	

if ($nfilas > 0):
	echo '
		  <h2>Consulta de libros</h2>
			<table>
				<tr>
					<th> Id </th>
					<th> T&iacute;tulo </th>
					<th> Autor </th>
					<th> Editorial </th>
					<th> Categoria </th>
				</tr>';

	for ($i=0; $i<$nfilas; $i++):
			$fila = mysqli_fetch_array ($resultado,MYSQLI_ASSOC);
			//Este sería el primer array asociativo que se guarda en $fila
			//$fila = array("id"=>1,"titulo"=>'Gestión de Bases de Datos',"autor"=>'Iván López Montalbán',
			                //"editorial"=>'Garceta', "categoria"=>'texto'); 
			echo '<tr>';
				echo '<td>'.$fila['id'].'</td>';
				echo '<td>'.$fila['titulo'].'</td>';
				echo '<td>'.$fila['autor'].'</td>';
				echo '<td>'.$fila['editorial'].'</td>';
				echo '<td>'.$fila['categoria'].'</td>';
				echo '</tr>';  
			
	endfor;
	echo'</table>';
	
else:
	echo "No hay ningún libro";
endif;
echo "<br/>Número de filas = $nfilas <br/><br/>";
// 5. Cerrar la conexión con el servidor de bases de datos
mysqli_close ($conexion);
	
?>
</body>
</html>