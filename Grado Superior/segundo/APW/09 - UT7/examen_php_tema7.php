
<html>
	<head>
		<title>Ejercicio</title>
		<meta http-equiv='Content-type' content='text/html' charset='ISO-8859-1'/>  
		<style>
            table, th, td {border:1px solid black;}
            th,td {padding:15px;}
		</style>
	</head>
<body>
<?php

if(empty($_GET['dato1']) || empty($_GET['dato2']) ||
empty($_GET['dato3']) || emtpy($_GET['dato4'])){
    echo "ERROR: obligatorio introducir un valor en cada cuadro de texto";
}else{
    $codigo = $_GET['dato1'];
    $descripticion = $_GET['dato2'];
    $precio_actual = $_GET['dato3'];
    $stock_disponible = $_GET['dato4'];
}

// 1. Conectar con el servidor de base de datos              
$conexion = mysqli_connect ('localhost', 'root', '') 		        
or die ("No se puede conectar con el servidor");

// 2. Seleccionar una base de datos
mysqli_select_db($conexion,'curso')						
or die ("No se puede seleccionar la base de datos");

// 3. Enviar la instrucción SQL a la base de datos
// HACEMOS EL INSERT
$consulta = "INSERT INTO productos (codigo, descripcion, precio_actual, stock_disponible)
            VALUES ($codigo, $descripcion, $precio_actual, $stock_disponible);";
$resultado = mysqli_query($conexion,$consulta) or die ("Fallo en la consulta");	
// HACEMOS EL SELECT PARA MOSTRAR LA TABLA
$consulta = "SELECT * FROM curso.productos;";
$resultado = mysqli_query($conexion,$consulta) or die ("Fallo en la consulta");	

// 4. Obtener y procesar los resultados
$nfilas = mysqli_num_rows ($resultado);	
	echo '
		  <h2>Listado de productos</h2>
			<table>
				<tr>
					<th> Codigo </th>
					<th> Descripcion </th>
					<th> Precio actual </th>
					<th> Stock disponible </th>
				</tr>';
	for ($i=0; $i<$nfilas; $i++){
			$fila = mysqli_fetch_array ($resultado,MYSQLI_ASSOC);
			echo '<tr>';
				echo '<td>'.$fila['Codigo'].'</td>';
				echo '<td>'.$fila['Descripcion'].'</td>';
				echo '<td>'.$fila['Precio actual'].'</td>';
				echo '<td>'.$fila['Stock disponible'].'</td>';
				echo '</tr>';  
    }
	echo'</table>';

// 5. Cerrar la conexión con el servidor de bases de datos
mysqli_close ($conexion);
?>
</body>
</html>



