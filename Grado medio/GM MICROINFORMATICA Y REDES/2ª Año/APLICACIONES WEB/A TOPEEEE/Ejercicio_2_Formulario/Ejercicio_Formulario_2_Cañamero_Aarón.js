function comparar()
{
  var cadena1=document.getElementById('texto').value;
  if ( cadena1.toUpperCase() == cadena1) 
  {
      alert(" La cadena está formada sólo por mayúsculas y en minúsculas es ");
	    document.getElementById('final2').value=cadena1.toLowerCase();
  }
  else if(cadena1 == cadena1.toLowerCase()) 
  {
      alert(" La cadena está formada sólo por minúsculas y en mayúsculas es ");
	    document.getElementById("final2").value=cadena1.toUpperCase();
  }
  else 
  {
      document.getElementById("fianl1").value="la cadena es una mezcla de mayúsculas y minúsculas ";
  }
}
