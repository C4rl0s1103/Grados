<?php
	/*	Ejemplo 1		*/
	//$notas=array(6,7,4,9,2,1,5,1);				//1
	
	//$faltas=array( 12, 0, 6, 34, 45, 5, 45, 45);   //2
	
	$alumnos=array( "Carlos"=>12, "Rosa"=>0, "Sergio"=>6, "Pablo"=>34,
			"Ana"=>45, "Maria"=>5, "Elena"=>26, "Juan"=>1);   //3
		
	function contador($numero,$array){ 
		
		$c=0;
		foreach($array as $indice=>$valor):
			if($valor==$numero):
				$c++;
			endif;
		endforeach;	

		return $c;
	}
	
	/* $num=10;							//1
	$total=contador($num,$notas);
	echo $total.' alumno/s han obtenido un '.$num;  */
	
	
	/*$num=45;							//2
	$total=contador($num,$faltas);
	echo $total.' alumno/s han faltado '.$num.' faltas';  */
	
	$num=45;							//3
	$total=contador($num,$alumnos);
	echo $total.' alumno/s ha/n faltado '.$num.' faltas';  
	
	
	
	
?>




