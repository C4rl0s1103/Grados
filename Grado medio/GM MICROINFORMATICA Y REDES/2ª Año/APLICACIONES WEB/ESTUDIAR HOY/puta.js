	function longitud()
	{
		var cadena1 = document.getElementById('principio').value
		var cadena2 = document.getElementById('principio2').value
		if (cadena1.length == cadena2.length)
		{
			document.getElementById('final').value='IGUALES';
		}
		else if (cadena1.length > cadena2.length)
		{
			document.getElementById('final').value='PRIMERO ES MAYOR';
		}
		else 
		{
			document.getElementById('final').value='SEGUNDO ES MAYOR';
		}
	}
