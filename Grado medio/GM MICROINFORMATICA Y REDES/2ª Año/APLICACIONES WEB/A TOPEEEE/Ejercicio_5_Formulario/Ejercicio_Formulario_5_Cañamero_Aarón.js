function parimpar()
		{
			var numero=document.getElementById("numeros1").value;
			if(numero%2==0)
			{
				document.getElementById("resultado1").value="par";
			}
			else 
			{
				document.getElementById("resultado1").value="impar";
			}

		}