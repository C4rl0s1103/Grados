<!DOCTYPE html>
<html lang="es">
	<head>
		<title>Pr&aacute;ctica 1</title>
		<meta charset="UTF-8"/>
	</head>
	<body>

		<?php
		
		//Funciones
		function sumar10($num){
			$resul = $num + 10;
			return $resul;
		}
		
		function restar10($num){
			$resul = $num - 10;
			return $resul;
		}
		
		
		if(empty($_POST['numero'])):
			echo "ERROR: obligatorio introducir un n&uacute;mero";
		
		else:
			$numero = $_POST['numero'];
			
			
			if($numero >= 1 && $numero <= 25):
			
				if(empty($_POST['opcion'])):
					echo "ERROR: obligatorio elegir una opci&oacute;n";
					
				else:
					$opcion = $_POST['opcion'];
					//¿Qué valores puede tener la variable $operación? 
					//suma10 o resta10
					if($opcion=="suma10"): //Pone suma10 entre comillas simples
						$suma = sumar10($numero);        //LLama a la función	
						echo 'Suma '.$numero.' + 10 = '.$suma;
							
					elseif($opcion=="resta10"): //pone solo else:
						$resta = restar10($numero);     //LLama a la función
						echo 'Resta '.$numero.' - 10 = '.$resta;
						
					endif;
				endif;
				
			else:
				echo "ERROR: Debe introducir números v&aacute;lidos";
			endif;
		endif;
		
		?>
		
		<br/><br/><br/><br/>
		<a href="formulario_practica4_ut6_php">Volver al formulario</a>
		
		<!--Yo lo he puesto así
		<P>
			Volver al
			<a href="formulario_practica4_ut6_php" title= "Volver al formulario">formulario</a>
		</p>
		-->
	</body>
</html>