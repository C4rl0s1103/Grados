<!--Cargamos la biblioteca
source C:\Users\alumno\Desktop\Ejercicio1_Practica1_Dado.sql-->

<html>
	<head>
		<title>Acceso a la BBDD biblioteca</title>
		<meta http-equiv='Content-type' content='text/html; charset='ISO-8859-1'/>
	</head>

	<body>


		<?php
		
		if(empty($_POST['titulo']) OR empty($_POST['autor']) OR empty($_POST['editorial'])): //Solo estos tres porque son cuadro de texto, categoría no porque es un desplegable
			echo 'ERROR: obligatorio introducir un valor en cada campo';
		else:
			$titulo = $_POST['titulo'];
			$autor = $_POST['autor'];
			$editorial = $_POST['editorial'];
			$categoria = $_POST['categoria'];
			
			
			//INSERTAR UN REGISTRO EN UNA TABLA

			// 1. Conectar con el servidor de base de datos             			  //Es mysqli porque es para las versiones nuevas, si fuera una antigua sería mysql
			$conexion = mysqli_connect ('localhost:3309', 'root', '') 					 //ponemos entre parentesis el ....,usuario, contraseña (root no tiene contraseña         
			or die ("No se puede conectar con el servidor");
			
			// 2. Seleccionar una base de datos
			mysqli_select_db ($conexion,'biblioteca')								//Si fuera para una versión antigua los parámetros estariían alreves ('curso',$conexion)
			or die ("No se puede seleccionar la base de datos");
			
			// 3. Enviar la instrucción SQL a la base de datos
			mysqli_set_charset($conexion,'utf8'); //Para que reconozca los utf8, por ejemplo los acentos del formulario
			
			$consulta = "INSERT INTO libros (titulo, autor, editorial, categoria) 
							VALUES('$titulo','$autor','$editorial','$categoria')"; 		//Vamos a trabajar con select, insert, delete y create
			
			$resultado = mysqli_query ($conexion,$consulta)             				//Esto es como en el servidor cuando hacemos un enter de la instrucción
			or die ("ERROR sentencia SQL");												//En el caso de que haya un fallo en la instrucción
			
			// 4. Obtener y procesar los resultados
			
			echo '
				<b>Resultado de la inserci&oacute;n de un nuevo libro</b><br/><br/>
				&nbsp;&nbsp;El libro ha sido recibido correctamente:
				<ul type="disc"> 
						<li>T&iacute;tulo:'.$titulo.'</li>
						<li>Autor:'.$autor.'</li>
						<li>Editorial:'.$editorial.'</li>
						<li>Categoria:'.$categoria.'</li>
				</ul>';
				//En la lista <ul type="disc"> no hace falta poner 	type="disc" porque por defecto sale disc			
															//Qué resultado quiero que sea cuando es un select, cuando es un insert...
			//echo "EN BREVE HAR&Eacute; ALGO"; 	Esto no está
			// si sale el texto en breve haré algo quiere decir que hemos conseguido conectar con el servidor

		//endif; //esta cerrado aquí por si nos pidieran hacer más cosas con la base de datos, pero se podría cerrar más abajo //*****Si pongo aquí el endif; me da error******
		
			// 5. Cerrar la conexión con el servidor de bases de datos
			mysqli_close ($conexion);
			
		endif; //Se podría cerrar aquí
		
		?>
		
		<br/><br/><br/><br/>
		<a href="Formulario_Ejercicio4_Insertar_Dado">Insertar otro nuevo libro</a>
		
	</body>
</html>