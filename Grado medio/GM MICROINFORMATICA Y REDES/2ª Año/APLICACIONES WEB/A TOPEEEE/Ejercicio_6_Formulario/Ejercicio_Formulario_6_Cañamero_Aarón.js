function vuelta1()
		{
			var palabras=document.getElementById("palabra1").value;
			var delreves=("");
			for(largo=palabras.length;largo>=0;largo--)
			{
				delreves=delreves+palabras.charAt(largo);
			}
			document.getElementById("resultado").value=delreves;
		}