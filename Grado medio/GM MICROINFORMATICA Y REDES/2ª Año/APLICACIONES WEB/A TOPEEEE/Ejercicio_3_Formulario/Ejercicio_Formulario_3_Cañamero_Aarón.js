function comparar() 
	{		
		var cadena1=document.getElementById("texto1").value;
		var cadena2=document.getElementById("texto2").value;
		if(cadena1.length == cadena2.length) 	
		{
			alert(" Las cadenas tienen la misma longitud");
		}
		else if(cadena1.length > cadena2.length) 
			{
				alert(" Las cadena1 "+ cadena1+ " es más larga que la cadena 2 "+ cadena2);
			}
			else 
			{
				alert(" Las cadena2 "+ cadena2+ " es más larga que la cadena 1 "+ cadena1);
			}
	}