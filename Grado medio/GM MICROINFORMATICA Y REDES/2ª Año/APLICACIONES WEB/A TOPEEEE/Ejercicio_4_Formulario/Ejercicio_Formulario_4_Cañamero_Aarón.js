function factorial() 
{
	var total=1;
	var x=document.getElementById("factorial1").value; 
	for (i=1; i<=x; i++) 
	{
		total = total * i; 
	}
	if (x<1 || x>25) 
		{
			alert("El número no está entre 1 y 25");
			total=0;
		}
		document.getElementById("resultado1").value=total;
	}