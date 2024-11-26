<!DOCTYPE html>
<html lang="es">
 <head>
 <title></title>
 <meta charset="UTF-8"/>
 </head>
 <body>
    
    <?php
         $numero1 = 9;
         $numero2 = 2;
         
         $suma = $numero1 + $numero2;
         $resta = $numero1 - $numero2;
         $producto = $numero1 * $numero2;
         $division = $numero1 / $numero2;
         $resto = $numero1 % $numero2;


       echo "primer_numero = $numero1 <br/>";
       echo "Segundo_numero = $numero2 <br/><br/>";
       echo "Suma = $suma <br/>";
       echo "Resta = $resta <br/>";
       echo "Producto = $producto <br/>";
       echo "division = $division <br/>";
       echo "Resto de la division = $resto <br/>";
        
      
      /* Como tenemos comillas simples tenemos que poner un . delante de la variable */ 
      echo "<br/>";
      echo "El valor del primer numero es: '.$numero1' fin";
   
      /* para hacer una constante usaremos el comando define */
      echo "<br/>";
      define("PI", 3.1416);
      echo "el numero pi es:" .PI;
      
    ?>

 </body>
</html>















