
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
empty($_GET['dato3']) || empty($_GET['dato4'])){
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


<?php
function multiplicar100($parametro){
    $resultado = $parametro*100;
    return $resultado;
}
function dividir100($parametro){
    $resultado = $parametro/100;
    return $resultado;
}
//VALIDACIÓN DE VACÍOS EN NÚMERO
if (empty($_POST['dato'])){
    echo "ERROR: Debes introducir un valor";
}else{
    //DECLARACIÓN DE VARIABLE
    $numero=$_POST['dato'];
    //VALIDAMOS EL RANGO
    if ($numero>=125 && $numero<=475){
        //VALIDAMOS VACIO EN OPERACIÓN
        if(empty($_POST['cien'])){
            echo "ERROR: Debes seleccionar una operación";
        }else{
            //DECLARACIÓN DE VARIABLE
            $operacion=$_POST['cien'];
            if($operación == "producto"){
                $res_multi=multiplicar100($numero);
                echo 'multiplicar' .$numero. ' x 100 = ' .$res_multi;
            }elseif($operacion == "division"){
                $res_div=dividir100($numero);
                echo 'dividir' .$numero. ' / 100 = ' .$res_div;
            }
        }
    }else{
        echo "ERROR: El numero introducido esta fuera de rango";
    }
}
?>
<br/><br/><br/><br/>
<a href='formulario_operaciones.html'> Volver al formulario</a>

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
			//mysqli_set_charset($conexion,'utf8');
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

<!DOCTYPE html>
<html lang="es">
	<head>
		<title>Pr&aacute;ctica 1</title>
		<meta charset="UTF-8"/>
	</head>
	<body>

		<?php
			//Funciones
			function sumar($num1,$num2){
				$total = $num1 + $num2;
				return $total;
			}
			
			function restar($num1,$num2){
				$total = $num1 - $num2;
				return $total;
			}
	
			//El servidor necesita numero1,numero2 (los cuadros de texto) y de las dos opciones saber cual se quiere utilizar(sumar o restar)
			//Datos de entrada
			$numero1 = $_GET['numero1']; 
			$numero2 = $_GET['numero2'];
			$operacion = $_GET['operacion'];
			//¿Qué valores puede tener la variable $operación? 
			//Solo sumar o restar
		
			if($operacion=="sumar"):
				$resultado = sumar($numero1,$numero2);        //LLama a la función	
			else:
				$resultado = restar($numero1,$numero2);     //LLama a la función
			endif;
			
			echo '<br/> El resultado es:'.$resultado;
			
		
	</body>
</html>