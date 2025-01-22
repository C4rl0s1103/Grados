

<html>
	<head>
		<title>Formulario</title>
		<meta http-equiv='Content-type' content='text/html; charset=utf-8'/>
	</head>
	<body>
	
		<h2>Insertar un nuevo libro</h2>
		<form action='insertar_libro_comprobacion_errores.php' method='post'>    
		
			<label for='id_titulo'>Titulo:</label>
			<input type='text' name='titulo' id='id_titulo'/><br /><br />
			
			<label for='id_autor'>Autor:</label>
			<input type='text' name='autor' id='id_autor'/><br /><br />
			
			<label for='id_editorial'>Editorial:</label>
			<input type='text' name='editorial' id='id_editorial'/><br /><br />
			
			<label for="id_categoria">Categoria:</label> &nbsp;&nbsp;&nbsp;&nbsp;
			<select name="categoria" id="id_categoria">
				<option value="Texto" selected="selected">Texto</option>
				<option value="Lectura">Lectura</option>
			</select>
			
			<br /><br /><br /><br />
			<input type='submit' value='Grabar'/>
		 
		</form>
			
	</body>
</html>
<html>



