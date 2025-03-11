
<?php
function multiplicar100($parametro){
    $resultado = $parametro*100;
    return $resultado;
}
function dividir100($parametro){
    $resultado = $parametro/100;
    return $resultado;
}
//VALIDACIÓN DE VACÍOS EN NÚMERO
if (empty($_POST['dato'])){
    echo "ERROR: Debes introducir un valor";
}else{
    //DECLARACIÓN DE VARIABLE
    $numero=$_POST['dato'];
    //VALIDAMOS EL RANGO
    if ($numero>=125 && $numero<=475){
        //VALIDAMOS VACIO EN OPERACIÓN
        if(empty($_POST['cien'])){
            echo "ERROR: Debes seleccionar una operación";
        }else{
            //DECLARACIÓN DE VARIABLE
            $operacion=$_POST['cien'];
            if($operación == "producto"){
                $res_multi=multiplicar100($numero);
                echo 'multiplicar' .$numero. ' x 100 = ' .$res_multi;
            }elseif($operacion == "division"){
                $res_div=dividir100($numero);
                echo 'dividir' .$numero. ' / 100 = ' .$res_div;
            }
        }
    }else{
        echo "ERROR: El numero introducido esta fuera de rango";
    }
}
?>
<br/><br/><br/><br/>
<a href='formulario_operaciones.html'> Volver al formulario</a>



