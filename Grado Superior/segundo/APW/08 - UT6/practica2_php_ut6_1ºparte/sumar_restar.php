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
			
			
			//Otra opción con switch: (mia)
			/*
			switch($operacion){
				case "sumar":
				$resultado = sumar($numero1,$numero2);        //LLama a la función
				break;
				//echo "<br/> Suma = $suma";
				case "restar":
				$resultado = restar($numero1,$numero2);     //LLama a la función
				break;
				//echo "<br/> Resta = $resta";
			//endif;
				default:
				$resultado = $restar($numero1,$numero2); 
				break;
				//echo "<br/> Resta = $resta";
			}
			echo "La operación es $operacion => $resultado";
			*/
		?>
		
	</body>
</html>