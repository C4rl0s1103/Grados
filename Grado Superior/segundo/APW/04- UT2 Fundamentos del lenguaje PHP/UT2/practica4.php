<!DOCTYPE html>
<html lang="es">
 <head>
 <title></title>
 <meta charset="UTF-8"/>
 </head>
 <body>
    
    <?php
         define ('PI', 3.1416);

         $radio = 2;
         $longitud = 2*PI*$radio;
         $area = PI* pow($radio,2);
         $volumen = (4/3)*PI*pow($radio,3);

         echo "COMILLAS DOBLES <br/>" ;
         echo "Longitud de la circunferencia $longitud <br/>";
         echo "Area del circulo $area <br/>";
         echo "Volumen de la esfera $volumen <br/>";
         echo "<br/>";

         echo 'COMILLAS SIMPLES <br/>';
         echo 'Longitud de la circunferencia' .$longitud. '<br/>';
         echo 'Area del circulo' .$area. '<br/>';
         echo 'Volumen de la esfera' .$volumen. '<br/>';
    ?>

 </body>
</html>
