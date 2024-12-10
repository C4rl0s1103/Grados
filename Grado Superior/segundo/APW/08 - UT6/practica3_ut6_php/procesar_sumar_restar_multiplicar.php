<!DOCTYPE html>
<html lang="es">
	<head>
		<title>Practica 3
			
		</title>
		<meta charset="UTF-8"/>
	</head>
	<body>

		<?php
		
		//Funciones
		function sumar($num1,$num2){
			$resul = $num1 + $num2;
			return $resul;
		}
		
		function restar($num1,$num2){
			$resul = $num1 - $num2;
			return $resul;
		}
		
		function multiplicar($num1,$num2){
			$resul = $num1 * $num2;
			return $resul;
		}
		
		if(empty($_POST['numero1']) || empty($_POST['numero2'])):
			echo "Error: obligatorio introducir un valor en cada campo";
		
		else:
			$numero1 = $_POST['numero1'];
			$numero2 = $_POST['numero2'];
			
			if($numero1 >= 1 && $numero1 <= 100 && $numero2 >= 1 && $numero2 <= 100):
			
				if(empty($_POST['operacion'])):
					echo "Error: obligatorio elegir una operación";
					
				else:
					$operacion = $_POST['operacion'];
					//¿Qué valores puede tener la variable $operación? 
					//sumar, restar o multiplicar
					if($operacion=="sumar"): //Pone sumar entre comillas simples
						$suma = sumar($numero1,$numero2);        //LLama a la función	
						echo 'Suma '.$numero1.' + '.$numero2.' = '.$suma;
							
					elseif($operacion=="restar"): //Pone restar entre comillas simples
						$resta = restar($numero1,$numero2);     //LLama a la función
						echo 'Resta '.$numero1.' - '.$numero2.' = '.$resta;
						
					elseif($operacion=="multiplicar"): //pone solo else:
						$mul = multiplicar($numero1,$numero2);     //LLama a la función
						echo 'Producto '.$numero1.' * '.$numero2.' = '.$mul;
					endif;
				endif;
				
			else:
				echo "Error: Debe introducir números v&aacute;lidos";
			endif;
		endif;
		
		?>
		
		<br/><br/><br/><br/>
		<a href="formulario_practica3_ut6_php">Volver al formulario</a>
		
		
	</body>
</html>