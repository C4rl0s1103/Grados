<!DOCTYPE html>
<html lang="es">
 <head>
 <title></title>
 <meta charset="UTF-8"/>
 </head>
 <body>
    <?php

/* 1. */
$numero=5;
 if ($numero<10){
$numero=$numero/2;
 }
 echo " \$numero = $numero";

/* 2. */
$a=3;
$b=5;
if ($a*$b==25){
$a=$a*4;
$b=$b*2;
}
echo "\$a= $a  \$b= $b";

/* 3. */

$numero = 5;
if ($numero<10)
{$numero=$numero/2;}
else
{$numero=$numero*2;}
echo " \$numero = $numero"; 


/* 4. */

$edad=15;
 if ($edad<1)
{$etapa="Bebé";}
 elseif ($edad<13)
{$etapa="Niñez";}
 elseif ($edad<17)
{$etapa="Adolescencia";}
 elseif ($edad<22)
{$etapa="Juventud";}
 elseif ($edad<71)
{$etapa="Madurez";}
 else
{$etapa="Vejez";}
 echo "Edad = $edad  &nbsp;&nbsp;&nbsp; Etapa = $etapa";

/* 5. */
$ciudad="Soria"; 
 switch ($ciudad){
 case "Lugo":
$comunidad="Galicia";
break;
 case "Huesca":
$comunidad="Aragón";
break;
 case "Soria":
$comunidad="Castilla León";
break;
 case "Almería":
$comunidad="Andalucía";
break;
 default:
$comunidad="Otra";  }
 echo "Ciudad = $ciudad  &nbsp;&nbsp;&nbsp; Comunidad = $comunidad"

/* 6. */
$numero=23;
 if ($numero<10){
$numero=$numero/2;  }
echo " \$numero = $numero"; 

/* 7. */
$a=3;
 $b=5;
 if ($a*$b<25){
$a=$a*4;
$b=$b*2;
}
 echo "\$a= $a  \$b= $b";


/* 8. */

$ciudad="Soria";
 switch ($ciudad){
 case "Lugo":
$comunidad="Galicia";
break;
 case "Huesca":
$comunidad="Aragón";
break;
 case "Soria":
$comunidad="Castilla León";
 case "Almería":
$comunidad="Andalucía";
break;
 default:
$comunidad="Otra";
 }
 echo "Ciudad = $ciudad  &nbsp;&nbsp;&nbsp; Comunidad = $comunidad"; 





    ?>
</body>
</html>








