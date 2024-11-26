
                /*===============================================*/
                /*===============================================*/
                /*===========  PHP - PRACTICA 1 TEMA 2  =========*/
                /*===============================================*/
                /*===============================================*/


--------------------------------------------------------------------------------------------------
1. Escribir un script en PHP, que permita sumar el contenido de 2 variables enteras y calcula su
suma, resta, producto, división y resto. Muestra la siguiente información a través de un
página web:
Primer número = 9
Segundo número = 2
Suma = 11
Resta = 7
Producto = 18
División = 4.5
Resto de la división = 1
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    //DECLARACIÓN DE VARIABLES
    $primer_numero = 20;
    $segundo_numero = 5;
    $suma = $primer_numero + $segundo_numero;
    $resta = $primer_numero - $segundo_numero;
    $producto = $primer_numero * $segundo_numero;
    $division = $primer_numero / $segundo_numero;
    $resto = $primer_numero % $segundo_numero;

    // SALIDA POR PANTALLA
    echo "Primer número = $primer_numero <br/>";
    echo "Segundo número = $segundo_numero <br/><br/>";
    echo "&nbsp Suma = $suma <br/>";
    echo "&nbsp Resta = $resta <br/>";
    echo "&nbsp Producto = $producto <br/>";
    echo "&nbsp División = $division <br/>";
    echo "&nbsp Resto de la división = $resto <br/>";

    // Alternativa para mostrar variables dentro de un echo
    // con comillas simples
    echo '<br/>';
    echo 'El valor del primer número es '.$primer_numero.' fin';
    echo '<br/>';
    echo 'El valor del primer número es '.$primer_numero;
    echo '<br/>';
    echo $primer_numero. 'es el valor del primer número';

    echo '<br/>';
    // Definición de una constante
    // Las constantes se definen con la función define()
    // pasando como argumentos el nombre en string y el valor.
    define('PI', 3.1416);

    // Para utilizar la constante PI no hace falta anteponer 
    // el símbolo $ como en las variables
    // Se observa la diferencias a la hora de utilizar la constante
    // con la sintaxis de comillas dobles y simples.
    echo 'El valor del la constante PI es: '.PI.'';
    echo '<br/>';
    echo "El valor del la constante PI es: " .PI;
    echo '<br/>';
    echo PI. "es el valor del la constante PI";
?>




                /*===============================================*/
                /*===============================================*/
                /*===========  PHP - PRACTICA 4 TEMA 2  =========*/
                /*===============================================*/
                /*===============================================*/


--------------------------------------------------------------------------------------------------
1. Escribir un script en PHP, que permita almacenar un número real en una variable, ese
número indica el valor del radio en cm. Obtener la longitud de la circunferencia, el área del
círculo y el volumen de la esfera que se corresponde con dicho radio. Las fórmulas
matemáticas que nos dan los cálculos son:
Longitud = 2*PI*r 
Área = PI*r^2 
Volumen = 4/3*PI*r^3
Muestra la información a través de una página web.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    echo '<br/>';

    //DECLARACIÓN DE CONSTANTES
    define("PI", 3.1416);

    //DECLARACIÓN DE VARIABLES
    $radio = 2;
    $longitud = 2*PI*$radio;
    $area = PI* pow($radio,2);
    $volumen = (4/3)*PI*(pow($radio,3));
    // Podemos elevar un numero x a otro número y con la siguiente función
    // pow(x,y) o con el operador x**y


    echo "SOLUCIÓN CON COMILLAS DOBLES <br/>";
    // SALIDA POR PANTALLA
    echo "Vamos a realizar algunos cálculos sabiendo:<br/>";
    echo "&nbsp&nbsp&nbsp&nbsp> radio de la circunferencia = $radio <br/>";
    echo "&nbsp&nbsp&nbsp&nbsp> Número PI = " .PI;
    echo "<br/><br/>";
    echo "La lóngitud de la circunferencia es = $longitud <br/>";
    echo "El área de la circunferencia es = $area <br/>";
    echo "El volumen de la circunferencia es = $volumen <br/>";
    echo "<br/><br/><br/>";

    echo 'SOLUCIÓN CON COMILLAS SIMPLES <br/>';
    // SALIDA POR PANTALLA
    echo 'Vamos a realizar algunos cálculos sabiendo:<br/>';
    echo '&nbsp&nbsp&nbsp&nbsp> radio de la circunferencia = ' .$radio. '<br/>';
    echo '&nbsp&nbsp&nbsp&nbsp> Número PI = '.PI.'';
    echo '<br/><br/>';
    echo 'La lóngitud de la circunferencia es = ' .$longitud. '<br/>';
    echo 'El área de la circunferencia es = ' .$area. '<br/>';
    echo 'El volumen de la circunferencia es = ' .$volumen. '<br/>';
    echo '<br/><br/>';
?>





                /*===============================================*/
                /*===============================================*/
                /*===========  PHP - PRACTICA 1 TEMA 3  =========*/
                /*===============================================*/
                /*===============================================*/



--------------------------------------------------------------------------------------------------
Ejercicio 1. Dado el siguiente formulario:
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Cuadrado</title>
        <meta charset="UTF-8"/>
    </head>
    <body>
        <form action="procesar_ejercicio1.php" method="post" >
            <p> Lado:
            <input type="text" name="lado" /> </p>          /* introducimos valor 4 en la caja de texto Lado*/
            <p> <input type="submit" value="Enviar"/> </p>
        </form>
    </body>
</html>
Escribir un script en PHP, que permita almacenar un número real en una variable, ese número indica el valor
del lado de un cuadrado en cm. Obtener el área del cuadrado que se corresponde con dicho lado.
Fórmula matemática para calcular el área de un cuadrado: Área = lado^2
Obligatoriamente debes utilizar las simples comillas en la función echo.
Muestra la información a través la siguiente página web.
Lado=4
Área=16
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    echo '<br/>';

    //DECLARACIÓN DE VARIABLES RECIBIDAS DEL FORMULARIO
    $lado = $_POST['lado']; // con $_POST Recogemos el valor introducido en la caja de texto 
                            // del formulario y enviada por el metodo post.

    $area = pow($radio,2);
    // Podemos elevar un numero x a otro número y con la siguiente función
    // pow(x,y) o con el operador x**y


    echo "SOLUCIÓN CON COMILLAS DOBLES <br/>";
    // SALIDA POR PANTALLA
    echo "Vamos a realizar algunos cálculos sabiendo:<br/>";
    echo "&nbsp&nbsp&nbsp&nbsp> lado del cuadrado = $lado <br/>";
    echo "<br/><br/>";
    echo "El área del cuadrado es = $area <br/>";
    echo "<br/><br/><br/>";

    echo 'SOLUCIÓN CON COMILLAS SIMPLES <br/>';
    // SALIDA POR PANTALLA
    echo 'Vamos a realizar algunos cálculos sabiendo:<br/>';
    echo '&nbsp&nbsp&nbsp&nbsp> lado del cuadrado = ' .$lado. '<br/>';
    echo '<br/><br/>';
    echo 'El área del cuadrado es = ' .$area. '<br/>';
        echo '<br/><br/>';
?>









--------------------------------------------------------------------------------------------------
Ejercicio 2. Dado el siguiente formulario:
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Cuadrado</title>
        <meta charset="UTF-8"/>
    </head>
    <body>
        <form action="procesar_ejercicio2.php" method="post" >
            <p> Lado:
            <input type="text" name="lado2" /> </p>       /* introducimos valor 3 en la caja de texto Lado2*/
            <p> <input type="submit" value="Enviar"/> </p>
        </form>
    </body>
</html>
Escribir un script en PHP, que permita almacenar un número real en una variable, ese número indica el valor
del lado de un cuadrado en cm. Obtener el área del cuadrado que se corresponde con dicho lado.
Fórmula matemática para calcular el área de un cuadrado: Área = lado^2
Obligatoriamente debes utilizar las simples comillas en la función echo.
Muestra la información a través la siguiente página web.
Lado=3
Área=9

--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    echo '<br/>';

    //DECLARACIÓN DE VARIABLES RECIBIDAS DEL FORMULARIO
    $lado = $_POST['lado2']; // con $_POST Recogemos el valor introducido en la caja de texto 
                            // del formulario y enviada por el metodo post.

    $area = pow($radio,2);
    // Podemos elevar un numero x a otro número y con la siguiente función
    // pow(x,y) o con el operador x**y


    echo "SOLUCIÓN CON COMILLAS DOBLES <br/>";
    // SALIDA POR PANTALLA
    echo "Vamos a realizar algunos cálculos sabiendo:<br/>";
    echo "&nbsp&nbsp&nbsp&nbsp> lado del cuadrado = $lado <br/>";
    echo "<br/><br/>";
    echo "El área del cuadrado es = $area <br/>";
    echo "<br/><br/><br/>";

    echo 'SOLUCIÓN CON COMILLAS SIMPLES <br/>';
    // SALIDA POR PANTALLA
    echo 'Vamos a realizar algunos cálculos sabiendo:<br/>';
    echo '&nbsp&nbsp&nbsp&nbsp> lado del cuadrado = ' .$lado. '<br/>';
    echo '<br/><br/>';
    echo 'El área del cuadrado es = ' .$area. '<br/>';
        echo '<br/><br/>';
?>




















--------------------------------------------------------------------------------------------------
Ejercicio 3. Dado el siguiente formulario:
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Cuadrado</title>
        <meta charset="UTF-8"/>
    </head>
    <body>
        <form action="procesar_ejercicio3.php" method="get" >
            <p> Lado:
            <input type="text" name="lado3" /> </p>         /* introducimos valor 2 en la caja de texto Lado3*/
            <p> <input type="submit" value="Enviar"/> </p>
        </form>
    </body>
</html>
Escribir un script en PHP, que permita almacenar un número real en una variable, ese número indica el valor
del lado de un cuadrado en cm. Obtener el área del cuadrado que se corresponde con dicho lado.
Fórmula matemática para calcular el área de un cuadrado: Área = lado^2
Obligatoriamente debes utilizar las simples comillas en la función echo.
Muestra la información a través la siguiente página web.
Lado=2
Área=4
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    echo '<br/>';

    //DECLARACIÓN DE VARIABLES RECIBIDAS DEL FORMULARIO
    $lado = $_GET['lado3']; // con $_GET Recogemos el valor introducido en la caja de texto 
                            // del formulario y enviada por el metodo get.

    $area = pow($radio,2);
    // Podemos elevar un numero x a otro número y con la siguiente función
    // pow(x,y) o con el operador x**y


    echo "SOLUCIÓN CON COMILLAS DOBLES <br/>";
    // SALIDA POR PANTALLA
    echo "Vamos a realizar algunos cálculos sabiendo:<br/>";
    echo "&nbsp&nbsp&nbsp&nbsp> lado del cuadrado = $lado <br/>";
    echo "<br/><br/>";
    echo "El área del cuadrado es = $area <br/>";
    echo "<br/><br/><br/>";

    echo 'SOLUCIÓN CON COMILLAS SIMPLES <br/>';
    // SALIDA POR PANTALLA
    echo 'Vamos a realizar algunos cálculos sabiendo:<br/>';
    echo '&nbsp&nbsp&nbsp&nbsp> lado del cuadrado = ' .$lado. '<br/>';
    echo '<br/><br/>';
    echo 'El área del cuadrado es = ' .$area. '<br/>';
    echo '<br/><br/>';
?>


















                /*===============================================*/
                /*===============================================*/
                /*===========  PHP - PRACTICA 1 TEMA 4  =========*/
                /*===============================================*/
                /*===============================================*/
        Escribe el resultado de la ejecución del script PHP de cada ejercicio.



--------------------------------------------------------------------------------------------------
Ejercicio 1:
<?php 
    $numero=5;
    if ($numero<10){
        $numero=$numero/2;
    }
    echo " \$numero = $numero";
?>
--------------------------------------------------------------------------------------------------
SOLUCION: $numero =2.5








--------------------------------------------------------------------------------------------------
Ejercicio 2:
<?php 
    $a=3;
    $b=5;
    if ($a*$b==25){
        $a=$a*4;
        $b=$b*2;
    }
    echo "\$a= $a \$b= $b"
?>
--------------------------------------------------------------------------------------------------
SOLUCION: $a= 3  $b= 5










--------------------------------------------------------------------------------------------------
Ejercicio 3:
<?php 
    $numero = 5;
    if ($numero < 10){
        $numero=$numero/2;
    }else{ 
        $numero=$numero*2;
    }
    echo " \$numero = $numero";
/* Cuando el hilo de ejecución entra por una de las condiciones del if, automáticamente ya NO evalúa
el resto de condiciones elseif o else*/

?>
--------------------------------------------------------------------------------------------------
SOLUCION: $numero = 2.5






--------------------------------------------------------------------------------------------------
Ejercicio 4:
<?php 
    $edad=15;
    if ($edad<1){
        $etapa="Bebé";
    }elseif ($edad<13){
        $etapa="Niñez";
    }elseif ($edad<17){
        $etapa="Adolescencia";
    }elseif ($edad<22){
        $etapa="Juventud";
    }elseif ($edad<71){
        $etapa="Madurez";
    }else{
        $etapa="Vejez";
    }
    echo "Edad = $edad &nbsp;&nbsp;&nbsp; Etapa = $etapa";
?>
--------------------------------------------------------------------------------------------------
SOLUCION:    Edad = 15     Etapa = Adolescencia






--------------------------------------------------------------------------------------------------
Ejercicio 5:
<?php 
    $ciudad="Lugo";
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
            $comunidad="Otra"; 
        }
    echo "Ciudad = $ciudad &nbsp;&nbsp;&nbsp; Comunidad = $comunidad";
    /*Es necesario implementar el break; tras cada case para evitar ejecuciones en cascada indeseadas.*/
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  Ciudad = Lugo  Comunidad = Galicia





--------------------------------------------------------------------------------------------------
Ejercicio 6:
<?php 
    $numero=23;
    if ($numero<10){
        $numero=$numero/2; 
    }
    echo " \$numero = $numero";
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  $numero = 23







--------------------------------------------------------------------------------------------------
Ejercicio 7:
<?php 
    $a=3;
    $b=5;
    if ($a*$b<25){
        $a=$a*4;
        $b=$b*2;
    }
    echo "\$a= $a \$b= $b"
?>
--------------------------------------------------------------------------------------------------
SOLUCION: $a= 12  $b= 10







--------------------------------------------------------------------------------------------------
Ejercicio 8:
<?php 
/*                           NO ENTRA EN EL EXAMEN
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
    echo "Ciudad = $ciudad &nbsp;&nbsp;&nbsp; Comunidad = $comunidad";
*/
?>
--------------------------------------------------------------------------------------------------
SOLUCION:






--------------------------------------------------------------------------------------------------
Ejercicio 9:
Escribir los script de PHP de los ejercicios 1, 3, 4 y 5 con la sintaxis de los dos puntos.
--------------------------------------------------------------------------------------------------
SOLUCION:   


//Ejercicio 1
<?php 
    $numero=5;
    if ($numero<10):
        $numero=$numero/2;
    endif;
    echo " \$numero = $numero";
?>




//Ejercicio 3
<?php 
    $numero = 5;
    if ($numero < 10):
        $numero=$numero/2;
    else: 
        $numero=$numero*2;
    endif;
    echo " \$numero = $numero";
?>




//Ejercicio 4
<?php 
    $edad=15;
    if ($edad<1):
        $etapa="Bebé";
    elseif ($edad<13):
        $etapa="Niñez";
    elseif ($edad<17):
        $etapa="Adolescencia";
    elseif ($edad<22):
        $etapa="Juventud";
    elseif ($edad<71):
        $etapa="Madurez";
    else:
        $etapa="Vejez";
    endif;
    echo "Edad = $edad &nbsp;&nbsp;&nbsp; Etapa = $etapa";
?>




//Ejercicio 5
<?php 
    $ciudad="Lugo";
    switch ($ciudad):
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
            $comunidad="Otra"; 
        endswitch;
    echo "Ciudad = $ciudad &nbsp;&nbsp;&nbsp; Comunidad = $comunidad";
?>




--------------------------------------------------------------------------------------------------
Ejercicio 10:
Escribir el script de PHP del ejercicio 3 con el operador ternario ?:
--------------------------------------------------------------------------------------------------
SOLUCION:     NO ENTRA





                /*===============================================*/
                /*===============================================*/
                /*===========  PHP - PRACTICA 2 TEMA 4  =========*/
                /*===============================================*/
                /*===============================================*/



--------------------------------------------------------------------------------------------------
Ejercicio 1: ¿Cuál es el resultado de la ejecución de estas instrucciones?
<?php
    $i=1;
    while($i<=10){
        echo "$i &nbsp;&nbsp;&nbsp;";
        $i++;
    }
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  1    2    3    4    5    6    7    8    9    10
ojo: La variable $i se queda valiendo 11




--------------------------------------------------------------------------------------------------
Ejercicio 2: Escribe la estructura while del ejercicio 1 utilizado la sintaxis de dos puntos.
--------------------------------------------------------------------------------------------------
SOLUCION:
<?php
    $i=1;
    while($i<=10):
        echo "$i &nbsp;&nbsp;&nbsp;";
        $i++;
    endwhile;
?>
ojo: La variable $i se queda valiendo 11




--------------------------------------------------------------------------------------------------
Ejercicio 3: ¿Cuál es el resultado de la ejecución de estas instrucciones?
<?php
    $i=1;
    do{
        echo "$i &nbsp;&nbsp;&nbsp;";
        $i++;
    }while($i<=10);
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  1    2    3    4    5    6    7    8    9    10    
ojo: En los bucles do while, la primera ejecución del bucle sucede seguro y después se evalúa 
la condición para determinar si el bucle continúa su ejecución o se queda solo en esa primera 
iteracion obligatoria.
ojo: la variable $i se queda valiendo 11




--------------------------------------------------------------------------------------------------
Ejercicio 4: ¿Cuál es el resultado de la ejecución de estas instrucciones?
<?php
    for($i=1;$i<=10;$i++){
        echo "$i &nbsp;&nbsp;&nbsp;";
        // Aqui se ejecuta el $i++
    }
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  1    2    3    4    5    6    7    8    9    10 
ojo: La variable $i se queda valiendo 11




--------------------------------------------------------------------------------------------------
Ejercicio 5: Escribe la estructura for del ejercicio 4 utilizado la sintaxis de dos puntos.
--------------------------------------------------------------------------------------------------
SOLUCION:
<?php
    for($i=1;$i<=10;$i++):
        echo "$i &nbsp;&nbsp;&nbsp;";
        // Aqui se ejecuta el $i++
    endfor;
?>
ojo: La variable $i se queda valiendo 11




--------------------------------------------------------------------------------------------------
Ejercicio 6: Escribir un script en PHP que muestre los números del 20 al 1. Primero con una
estructura while y depués con una estructura for ambas con la sintaxis de dos puntos.
--------------------------------------------------------------------------------------------------
SOLUCION:
<?php
    //Primera forma
    $i=20;
    while ($i>0){
        echo "$i &nbsp;&nbsp;&nbsp;";
        $i--;
    }

    //Segunda forma
    for ($i=20 ; $i>0 ; $i--):
        echo "$i &nbsp;&nbsp;&nbsp;";
    endfor;
?>
ojo: La variable $i se queda valiendo -1




--------------------------------------------------------------------------------------------------
Ejercicio 7: ¿Cuál es el resultado de la ejecución de estas instrucciones?
<?php
    for($i=1;$i<=50;$i++):
        if($i % 5 == 0):
            echo "$i &nbsp;&nbsp;&nbsp;";
        endif;
        // Aqui incrementa $i++
    endfor;
?>
--------------------------------------------------------------------------------------------------
SOLUCION: 5  10  15  20  25  30  35  40  45  50




--------------------------------------------------------------------------------------------------
Ejercicio 8: ¿Cuál es el resultado de la ejecución de estas instrucciones?
<?php
    $i=1;
    while($i==15):
        if($i % 3 == 0):
            echo "$i &nbsp;&nbsp;&nbsp;";
        endif;
        $i++;
    endwhile;
?>
--------------------------------------------------------------------------------------------------
SOLUCION: No muestra nada por que nunca entra en el bucle, $i=1 y la condición
de ejecución del bucle es que $i==15




--------------------------------------------------------------------------------------------------
Ejercicio 9: ¿Cuál es el resultado de la ejecución de estas instrucciones?
<?php
    $i=3;
    while($i<=15):
        if($i % 3 == 0):
            echo "$i &nbsp;&nbsp;&nbsp;"; 
            $i++;
        endif;
    endwhile;
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  

el incremento de $i
solo ocurre si la condición se cumple. Esto significa que si $i
no es divisible por 3, el bucle seguirá ejecutándose sin incrementar $i
lo que podría llevar a un bucle infinito.

Dado que $i
comienza en 3 y se incrementa solo cuando es divisible por 3, el resultado de 
este código sería que imprimirá 3, 6, 9, 12 y 15, pero no incrementará $i
en los casos donde no sea divisible por 3, lo que causará que el bucle nunca termine.




--------------------------------------------------------------------------------------------------
Ejercicio 10: ¿Cuál es el resultado de la ejecución de estas instrucciones?
<?php
    for($i=3;$i<=15;$i=$i+3):
        echo "$i &nbsp;&nbsp;&nbsp;";
        // Aquí se ejecuta $i=$i+3
    endfor;
?>
--------------------------------------------------------------------------------------------------
SOLUCION: Se repite 5 veces con los valores 3  6  9  12  15
$i termina valiendo 18




--------------------------------------------------------------------------------------------------
Ejercicio 11: Sabiendo que la instrucción $i=$i+3; es equivalente a la instrucción 
$i+=3;. ¿Cuáles de estas opcines muestran como resultado de ejecución 3 6 9 12 15
<?php

    //Opción a: 
    $i=3;
    while($i<=15):
        $i+=3;
        echo "$i &nbsp;&nbsp;&nbsp;";
    endwhile;

    //Opción b: 
    for($i=3;$i>=15;$i+=3):
        echo "$i &nbsp;&nbsp;&nbsp;";
    endfor;

    //Opción c: 
    $i=3;
    do{
        echo "$i &nbsp;&nbsp;&nbsp;";
        $i+=3;
    }while($i<=15);

    //Opcion d: 
    $i=3;
    while($i<=15):
        echo "$i &nbsp;&nbsp;&nbsp;";
        $i+=3;
    endwhile;

    //Opción e: 
    for($i=3;$i<=15;$i+=3):
        echo "$i &nbsp;&nbsp;&nbsp;";
        // Aquí se ejecuta el $i+=3
    endfor;

    //Opción f: 
    $i=1;
    do{
        $i+=3;
        echo "$i &nbsp;&nbsp;&nbsp;";
    }while($i<=15);
?>
--------------------------------------------------------------------------------------------------
SOLUCION:
(C, D, E) 




--------------------------------------------------------------------------------------------------
Ejercicio 12: Escribe de forma abreviada las instrucciones que sean posibles.
<?php

    //Opción a:
    $x = $x+2;

    //Opción b:
     $x = $x-3;

    //Opción c:
     $x = $x*5;

    //Opción d:
     $x = $x/4;

    //Opción e:
     $x = $x%2;

    //Opción f:
     $x = $y+5*($x+2);

    //Opción g:
     $x = $x+1;

    //Opción h:
     $x = $x-1;

    //Opción i:
     $x = $x+$y*5;

    //Opción j:
     $y = $y-(5*$x)+($y+1);

?>
--------------------------------------------------------------------------------------------------
SOLUCION:   NO ENTRA EN EL EXAMEN




--------------------------------------------------------------------------------------------------
Ejercicio 13: ¿Cuál es el resultado de la ejecución de estas instrucciones?
<?php
    for($i=2;$i<=6;$i+=2):
        echo "$i &nbsp;&nbsp;&nbsp;";
        break;
        echo "$i &nbsp;&nbsp;&nbsp;";
    endfor;
?>
--------------------------------------------------------------------------------------------------
SOLUCION: 2  2  4  4  6  6 




--------------------------------------------------------------------------------------------------
Ejercicio 14: ¿Cuál es el resultado de la ejecución de estas instrucciones?
<?php
    for($i=2;$i<=6;$i+=2):
        echo "$i &nbsp;&nbsp;&nbsp;";
        continue;
        // Aquí se ejecuta el $i+=2
        echo "$i &nbsp;&nbsp;&nbsp;";
    endfor;
?>
--------------------------------------------------------------------------------------------------
SOLUCION: 2    4    6   




--------------------------------------------------------------------------------------------------
Ejercicio 15: ¿Cuál es el resultado de la ejecución de estas instrucciones?
<?php
    for($i=2;$i<=6;$i+=2):
        echo "$i &nbsp;&nbsp;&nbsp;";
        break;
        echo "$i &nbsp;&nbsp;&nbsp;";
    endfor;
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  2




--------------------------------------------------------------------------------------------------
Ejercicio 16: ¿Cuál es el resultado de la ejecución de estas instrucciones?
<?php
    for($i=0;$i<3;$i++):
        for($j=0;$j<2;$j++):
            echo "($i,$j) &nbsp;&nbsp;&nbsp;";
        endfor;
    endfor;
?>
--------------------------------------------------------------------------------------------------
SOLUCION:    NO ENTRA EN EL EXAMEN




--------------------------------------------------------------------------------------------------
Ejercicio 17: ¿Cuál es el resultado de la ejecución de estas instrucciones?
<?php
    for($i=0;$i<3;$i++):
        for($j=0;$j<2;$j++):
            echo "($i,$j) &nbsp;&nbsp;&nbsp;";
            break;
        endfor;
    endfor;
?>
--------------------------------------------------------------------------------------------------
SOLUCION:   NO ENTRA EN EL EXAMEN




--------------------------------------------------------------------------------------------------
Ejercicio 18: ¿Cuál es el resultado de la ejecución de estas instrucciones?
<?php
    for($i=0;$i<3;$i++):
        for($j=0;$j<2;$j++):
            echo "($i,$j) &nbsp;&nbsp;&nbsp;";
        endfor;
        break;
    endfor;
?>
--------------------------------------------------------------------------------------------------
SOLUCION:   NO ENTRA EN EL EXAMEN




--------------------------------------------------------------------------------------------------
Ejercicio 19: ¿Cuál es el resultado de la ejecución de estas instrucciones?
<?php
    $numero=2;
    for($i=1;$i<=10;$i++):
        echo "$numero x $i = ".$numero*$i."<br/>";
    endfor;
?>
--------------------------------------------------------------------------------------------------
SOLUCION:   NO ENTRA EN EL EXAMEN




--------------------------------------------------------------------------------------------------
Ejercicio 20: Escribe un script en PHP que muestre la tabla de multiplica de los 10 primeros
números naturales.
--------------------------------------------------------------------------------------------------
SOLUCION:   NO ENTRA EN EL EXAMEN






                /*===============================================*/
                /*===============================================*/
                /*===========  PHP - PRACTICA 3 TEMA 4  =========*/
                /*===============================================*/
                /*===============================================*/
        Escribe el resultado de la ejecución del script PHP de cada ejercicio.



--------------------------------------------------------------------------------------------------
Ejercicio 1:
<?php
    $numero = 10;
    if ($numero<10):
        $numero=$numero/2;
    endif;
    echo " \$numero = $numero";
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  $numero = 10




--------------------------------------------------------------------------------------------------
    Ejercicio 2:
<?php
    $numero = 10;
    if ($numero<10):
        $numero=$numero/2;
    else:
        $numero=$numero*2;
    endif;
    echo " \$numero = $numero";
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  $numero = 20




--------------------------------------------------------------------------------------------------
Ejercicio 3:
<?php  
    $numero = 10;
    if ($numero<10):
        $numero=$numero/2;
    elseif($numero>10):
        $numero=$numero*2;
    else:
        $numero=pow($numero,2);
    endif;
    echo " \$numero = $numero";
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  $numero = 100




--------------------------------------------------------------------------------------------------
Ejercicio 4:
<?php
    $numero = -4;
    if ($numero>0):
        echo $numero.' n&uacute;mero positivo';
    else:
        echo $numero.' n&uacute;mero negativo o cero';
    endif;
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  -4 número negativo o cero




--------------------------------------------------------------------------------------------------
Ejercicio 5:
<?php
    $numero = 0;
    if ($numero>0):
        echo $numero.' n&uacute;mero positivo';
    endif;
?>
--------------------------------------------------------------------------------------------------
SOLUCION: No imprime nada




--------------------------------------------------------------------------------------------------
Ejercicio 6:
<?php
    $numero = 5;
    if ($numero>0):
        echo $numero.' n&uacute;mero positivo';
    elseif($numero<0):
        echo $numero.' n&uacute;mero negativo';
    else:
        echo $numero.' n&uacute;mero cero';
    endif;
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  5 número positivo




--------------------------------------------------------------------------------------------------
Ejercicio 7:
<?php
    $numero = 5;
    if ($numero>0):
        echo $numero.' n&uacute;mero positivo';
    endif;
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  5 número positivo




--------------------------------------------------------------------------------------------------
Ejercicio 8:
<?php
    $numero = 0;
    if ($numero>0):
        echo $numero.' n&uacute;mero positivo';
    else:
        echo $numero.' n&uacute;mero negativo o cero';
    endif;
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  0 número negativo o cero




--------------------------------------------------------------------------------------------------
Ejercicio 9:
<?php
    $numero = 0;
    if ($numero>0):
        echo $numero.' n&uacute;mero positivo';
    elseif($numero<0):
        echo $numero.' n&uacute;mero negativo';
    else:
        echo $numero.' n&uacute;mero cero';
    endif;
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  0 número cero




--------------------------------------------------------------------------------------------------
Ejercicio 10:
<?php
    $numero = -4;
    if ($numero>0):
        echo $numero.' n&uacute;mero positivo';
    endif;
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  No imprime nada por que no entra en el condicional, el valor de la 
variable $numero sigue siendo -4




--------------------------------------------------------------------------------------------------
Ejercicio 11:
<?php
    $numero = 5;
    if ($numero>0):
        echo $numero.' n&uacute;mero positivo';
    else:
        echo $numero.' n&uacute;mero negativo o cero';
    endif;
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  5 número positivo




--------------------------------------------------------------------------------------------------
Ejercicio 12:
<?php
    $numero = -4;
    if ($numero>0):
        echo $numero.' n&uacute;mero positivo';
    elseif($numero<0):
        echo $numero.' n&uacute;mero negativo';
    else:
        echo $numero.' n&uacute;mero cero';
    endif;
?>
--------------------------------------------------------------------------------------------------
SOLUCION:  -4 número negativo





                /*===============================================*/
                /*===============================================*/
                /*===========  PHP - PRACTICA 1 TEMA 5  =========*/
                /*===============================================*/
                /*===============================================*/
Tenemos información de las notas obtenidas por los alumnos repetidos de 1º ASIR en el módulo de
Gestión de Bases de Datos (GBD). Para poder tratar esta información obligatoriamente la debes
          almacenar en el siguiente array: $notas=array(6,7,4,9,2,1,5,1);




--------------------------------------------------------------------------------------------------
1. Programar un script en PHP que permita contar y mostrar el número de alumnos repetidores
aprobados de 1º ASIR en GBD. Debes hacerlo de dos formas: con el bucle for y con el bucle
foreach.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $notas = array(6,7,4,9,2,1,5,1);
    $numElementos = count($notas); //8

    $contadorAprobados = 0;
    for($i=0;$i<$numElementos;$i++){
        if($notas[$i] >= 5 ){
            $contadorAprobados++;
        }
    }
    echo "El número total de alumnos con GBD aprobado es de  $contador &nbsp;&nbsp;";
?>









--------------------------------------------------------------------------------------------------
2. Programar un script en PHP que permita contar y mostrar el número de alumnos con notas
superiores a 5 e inferiores a 9 de los alumnos repetidores de 1º ASIR en GBD. Debes
hacerlo de dos formas: con el bucle for y con bucle foreach.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $notas=array(6,7,4,9,2,1,5,1);
    $numElementos=count($notas);

    $contador=0;
    for($i=0;$i<$numElementos;$i++){
        if($notas[$i] > 5 and $notas[$i] < 9 ){
            $contador++;
        }
    }
    echo "El número de alumnos con una nota entre 5 y 9 es de $contador";
?>











--------------------------------------------------------------------------------------------------
3. Programar un script en PHP que permita calcular y mostrar la nota media de los alumnos de
1º ASIR en GBD. Debes hacerlo de dos formas: con el bucle for y con bucle foreach.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $notas = array(6,7,4,9,2,1,5,1);
    $numElementos=count($notas);

    $contador = 0;
    $sumatorio = 0; 
    for($i=0;$i<$numElementos;$i++){
        $sumatorio=$sumatorio+$notas[$i];
    }
    $media = $sumatorio / $numElementos;
    echo "La nota media es $media &nbsp;&nbsp;";

    /*La nota media puede conseguirse sumando los valores de todas las notas y dividiendo
    el resultado entre el número de notas totales. 
    Tenemos el número de notas totales guardado en la variable numElementos por lo que solo 
    debemos declarar una variable llamada sumatorio que vaya sumando las notas del array 
    en cada iteración del bucle aprovechando que $i va incrementando su valor para coincidir
    con las distintas posiciones de este 
    Finalmente ya tenemos las variables $sumatorio y $numElementos, si las dividimos y guardamos
    el resultado de la división en una tercera variable denominada $media podemos utilizarla para
    imprimirla en pantalla con un eco.*/
?>











--------------------------------------------------------------------------------------------------
4. Programar un script en PHP que permita obtener y mostrar la nota más alta obtenida por los
alumnos de 1º ASIR en GBD. Debes hacerlo de dos formas: con el bucle for y con bucle
foreach.
--------------------------------------------------------------------------------------------------
SOLUCION:   NO ENTRA EN EL EXAMEN

<?php 
/*
    // VARIABLES PROPORCIONADAS 
    $notas=array(6,7,4,9,2,1,5,1);
    $numElementos=count($notas);

    $mayor=0;
    for ($i=0;$i<$numElementos;$i++){
        if ($notas[$i] > $mayor){
            $mayor = $notas[$i];
        }
    }
    echo "Nota mayor = $mayor";
*/
?>











--------------------------------------------------------------------------------------------------
5. Programar un script en PHP que permita obtener y mostrar la nota más baja obtenida por los
alumnos de 1º ASIR en GBD. Debes hacerlo de dos formas: con el bucle for y con bucle
foreach.
--------------------------------------------------------------------------------------------------
SOLUCION:  NO ENTRA EN EL EXAMEN

<?php 
/*
    // VARIABLES PROPORCIONADAS
    $notas=array(6,7,4,9,2,1,5,1);
    $numElementos=count($notas);

    $menor=0;
    for ($i=0;$i<$numElementos;$i++){
        if ($notas[$i] < $menor){
            $menor = $notas[$i];
        }
    }
    echo "Nota menor = $menor";
*/
?>











--------------------------------------------------------------------------------------------------
6. Programar un script en PHP que permita mostrar si hubo o no algún alumno con una nota de
10 en GBD de 1º ASIR. Obligatoriamente debes trabajar con una variable de tipo boolean
(que tome los valores true o false). Debes hacerlo de dos formas: con el bucle for y con
bucle foreach.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $notas=array(6,7,4,9,2,1,5,1);
    $numElementos=count($notas);

    // Forma de Carmen.
    $hay_matricula = False;
    for ($i=0;$i<$numElementos;$i++){
        if ($notas[$i] == 10 ){
            $hay_matricula = True;
            break;
        }
    }
    if ($hay_matricula == True){
        echo "Si tenemos algun alumno con matrícula, (10 de nota).";
    }else{
        echo "No hay alumnos con matrícula, (10 de nota).";
    }



    // Mi forma.
    $notas=array(6,7,4,9,2,1,5,1);
    $numElementos=count($notas);

    $hay_matricula = False;
    for ($i=0;$i<$numElementos;$i++){
        if ($notas[$i] == 10 ){
            $hay_matricula = True;
            echo "Si tenemos algun alumno con matrícula, (10 de nota).";
            break;
        }
    }
    if ($hay_matricula == False){
        echo "No hay alumnos con matrícula, (10 de nota).";}

    /*Las variables booleanas solo pueden almacenar dos valores, que son True o False
    Este tipo de variables se utilizan para determinar si una afirmación es cierta y cambia
    en un momento determinado de la ejecución o viceversa.
    Es comun encontrar la variables booleanas definidas con nombres que representen una pregunta
    como por ejemplo en el ejercicio anterior: hay_matricula (True = si, False = no)*/
?>






--------------------------------------------------------------------------------------------------
7. Programar un script en PHP que permita calcular y mostrar el porcentaje de notas inferiores
a 3 de los alumnos de 1º ASIR en GBD. Debes hacerlo de dos formas: con el bucle for y con
bucle foreach.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $notas=array(6,7,4,9,2,1,5,1);
    $numElementos=count($notas);

    $contador=0;
    $sumatorio=0;
    for($i=0; $i < $numElementos; $i++){
        if($notas[$i] < 3 ){
            $contador++;
        }
    }
    $porcentaje=$contador*100/$numElementos;
    
    echo "Hay un total de $contador alumnos con una nota inferior a 3 que suponen
    un $porcentaje % del total"

    /*Con la variable contador almacenamos el número de notas inferiores a 3 y después utilizamos
    ese dato para realizar una regla de tres aprovechando que tenemos el numero total de notas en
    la variable numElementos:
    Si $numElementos es el 100% ¿a que porcentaje equivale $contador?*/
?>









                /*===============================================*/
                /*===============================================*/
                /*===========  PHP - PRACTICA 2 TEMA 5  =========*/
                /*===============================================*/
                /*===============================================*/
Tenemos información sobre los nombres y precios de los productos de una tienda de alimentación.
Para poder tratar esta información obligatoriamente la debes almacenar en el siguiente array:
      $precios = array("azúcar"=>2.7, "aceite"=>4, "arroz"=>1.5, "sal"=>0.8,
                     "pollo"=>2.4, "tomates"=>1.3, "pan"=>0.6);




--------------------------------------------------------------------------------------------------
1. Programar un script en PHP que permita contar y mostrar el número de productos con precios
superiores e iguales a 2.5 euros.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $precios = array("azúcar"=>2.7, "aceite"=>4, "arroz"=>1.5, 
    "sal"=>0.8, "pollo"=>2.4, "tomates"=>1.3, "pan"=>0.6);
    $numElementos=count($precios);

    $contador = 0;
    foreach ($precios as $producto => $valor) {
        if ($valor >= 2.5) {
            $contador++;
        }
    }
    echo 'Hay ' .$contador. ' productos con un precio igual o superior a 2.5 euros.';

    /* Introducimos dos conceptos nuevos: arrays asociativos y bucles foreach.
    
    la variable $precios almacena un array asociativo, que es un tipo de array donde cada 
    elemento no va emparejado a un ínice como antes si no que ahora se asocia a un nombre (string)
        array tradicional --> Cada elemento se asocia a una posición empezando por 0
        array asociativo --> Cada elemento lleva asociado un nombre, a este par de conceptos se
                             les conoce como clave valor, (clave = nombre, valor = elemento).
    
    De esta manera si queremos acceder al dato almacenado en la primera posición del array $notas
    debemos utilizar $notas[0]
    En cambio si queremos acceder a la primera posición del array $precios debemos utilizar la 
    sintaxis $precios["azúcar"]

    Por otro lado, tenemos el bucle foreach que nos sirve para recorrer facilmente un array 
    asociativo dandonos la posibilidad de acceder en cada iteración del bucle a la clave y
    al valor de la posición que toca. Se hace imposible recorrer este tipo de arrays con un 
    bucle for normal ya que este solo nos permite incrementar el valor numérico de $i, el cual si
    coincidía con las distintas posiciones, en cambio en este caso cada posición recibe un
    nombre o clave propio.
    La sintaxis del bucle foreach es la siguiente:
        foreach ($array_asociativo as $clave => $valor){
            En la primera iteración $clave = "Azúcar" y $valor = 2.7
        }
    Así, podemos acceder a la clave y el valor pertinente por cada iteración del bucle para poder
    operar con ellos como sea necesario*/
?>







--------------------------------------------------------------------------------------------------
2. Programar un script en PHP que permita calcular y mostrar el porcentaje de productos entre
0.6 y 2.1 euros.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $precios = array("azúcar"=>2.7, "aceite"=>4, "arroz"=>1.5, 
    "sal"=>0.8, "pollo"=>2.4, "tomates"=>1.3, "pan"=>0.6);
    $numElementos=count($precios);

    $contador = 0;
    foreach ($precios as $producto => $valor){
        if ($valor >= 0.6 and $valor <= 2.1){
            $contador++;
        }
    }
    $porcentaje = $contador*100/$numElementos;
    echo "Hay un $porcentaje % de productos con un precio entre 0.6 y 2.1";

    /*De nuevo utilizamos la variable contador para calcular el número de productos que cumplen
    la condición y finalmente hacemos uso de una regla de tres para calcular el porcentaje que
    estos suponene respecto del total*/
?>







--------------------------------------------------------------------------------------------------
3. Programar un script en PHP que permita contar y mostrar el número de productos con precios
inferiores a 1 euro, con precios entre 1 y 4 euros y con precios superiores a 4 euros.
Obligatorio utilizar condicionales anidadas.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $precios = array("azúcar"=>2.7, "aceite"=>4, "arroz"=>1.5, 
    "sal"=>0.8, "pollo"=>2.4, "tomates"=>1.3, "pan"=>0.6);
    $numElementos=count($precios);

    $menosDeUnEuro = 0; // Precios inferiores a 1€
    $entreUnoYCuatroEuros = 0; // Precios entre 1 y 4€
    $masDeCuatroEuros = 0; // Precios superiores a 4€

    foreach ($precios as $producto => $valor){
        if($valor < 1){
            $menosDeUnEuro++;
        }elseif($valor > 4){
            $masDeCuatroEuros++;
        }else{ 
            $entreUnoYCuatroEuros++;
        }
    }
    echo 'Hay ' .$menosDeUnEuro. ' productos con un precio inferior a 1€';
    echo "Hay $entreUnoYCuatroEuros productos con un precio entre 1 y 4€";
    echo 'Hay ' .$masDeCuatroEuros. ' productos con un precio superior a 4€';

    /* Utilizamos un bucle foreach para recorrer el array asociativo y dentro un condicional
    anidado para ordenar los valores en las tres categorías que nos solicita el enunciado
    Cada categoría está reptresentada por un a variable con su nombre descriptivo que después
    utilizamos para los echos.*/
?>








--------------------------------------------------------------------------------------------------
4. Programar un script en PHP que permita calcular y mostrar el precio medio de los productos.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $precios = array("azúcar"=>2.7, "aceite"=>4, "arroz"=>1.5, 
    "sal"=>0.8, "pollo"=>2.4, "tomates"=>1.3, "pan"=>0.6);
    $numElementos=count($precios);

    $sumatorio = 0;
    foreach($precios as $producto => $valor){
        $sumatorio = $sumatorio + $valor;
    }
    $media = $sumatorio/$numElementos;
    echo "La media de precios es de $media";

    /*Otra vez el fucking ejercicio de la media... esta mujer me va a quitar la vida...
    me tiene mas aburrido que un enano en un concierto...*/
?>







--------------------------------------------------------------------------------------------------
5. Programar un script en PHP que permita calcular y mostrar el porcentaje de productos con
precios superiores o iguales al precio medio.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $precios = array("azúcar"=>2.7, "aceite"=>4, "arroz"=>1.5, 
    "sal"=>0.8, "pollo"=>2.4, "tomates"=>1.3, "pan"=>0.6);
    $numElementos=count($precios);

    //Calculamos de nuevo la media y la guardamos en la variable $media.
    $sumatorio = 0;
    foreach($precios as $producto => $valor){
        $sumatorio = $sumatorio + $valor;
    }

    /*Comparamos el precio o $valor de cada producto con la $media guardada y guardamos en la 
    variable $superiorALaMedia en número de productos que cumplen la condición marcada y lo 
    mostramos con un echo*/
    $superiorALaMedia = 0;
    foreach($precios as $producto => $valor){
        if ($valor > $media){
            $superiorALaMedia++;
        }
    }
    echo 'Hay ' .$superiorALaMedia. 'productos con un valor superior a la media';
?>








--------------------------------------------------------------------------------------------------
6. Programar un script en PHP que permita calcular y mostrar el precio del producto más caro.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $precios = array("azúcar"=>2.7, "aceite"=>4, "arroz"=>1.5, 
    "sal"=>0.8, "pollo"=>2.4, "tomates"=>1.3, "pan"=>0.6);
    $numElementos=count($precios);

    $valorMasCaro = PHP_INT_MIN; /* PHP_INT_MIN establece el valor mínimo posible para un int
    También podemos:
    - Incializar la variable con la primera posición del array asociativo que almacena el valor 
        del primer producto.   -->   $valorMasCaro = $precios["azucar"];
    - Igualarla a 0 como punto de partida  -->  $valorMasCaro = 0;
    */
    $productoMasCaro = "";
    foreach($precios as $producto => $valor){
        if ($valor > $valorMasCaro ){
            $valorMasCaro = $valor;
            $productoMasCaro = $producto;
        }
    }
    echo 'El producto más caro es ' .$productoMasCaro. ' con un precio de ' .$valorMasCaro;
?>








--------------------------------------------------------------------------------------------------
7. Programar un script en PHP que permita calcular y mostrar el precio del producto más barato.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $precios = array("azúcar"=>2.7, "aceite"=>4, "arroz"=>1.5, 
    "sal"=>0.8, "pollo"=>2.4, "tomates"=>1.3, "pan"=>0.6);
    $numElementos=count($precios);

    $valorMasBarato = PHP_INT_MAX; /* PHP_INT_MAX establece el valor máximo posible para un int
    También podemos:
    - Aprovechar la variable del ejercicio anterior &valorMasCaro para usarla como punto de partida
        más alto y de ahí poder ir bajando  -->   $valorMasBarato = $valorMasCaro;
    - Igualarla a un número absurdamente alto como punto de partida  -->  $valorMasBarato = 999999;
    */
    
    $productoMasBarato = "";
    foreach($precios as $producto => $valor){
        if($valor < $valorMasBarato){
            $valorMasBarato = $valor;
            $productoMasBarato = $producto;
        }
    }
    echo "El producto más barato es $productoMasBarato con un precio de $valorMasBarato";
?>








--------------------------------------------------------------------------------------------------
8. Programar un script en PHP que permita mostrar si hubo o no algún producto con precios
superiores a 3 euros. Si hay algún producto muestra el siguiente mensaje: "Hay algún producto
con precios superiores a 3 euros" y sino hay ninguno muestra el siguiente mensaje
"No hay ningún producto con precios superiores a 3 euros". Obligatoriamente debes utilizar
una variable de tipo boolean.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $precios = array("azúcar"=>2.7, "aceite"=>4, "arroz"=>1.5, 
    "sal"=>0.8, "pollo"=>2.4, "tomates"=>1.3, "pan"=>0.6);
    $numElementos=count($precios);

    $haySup3=False;
    foreach ($precios as $producto => $valor){
        if($valor >3){
            $haySup3=True;
            break;
        }
    }

    if ($haySup3 == True){
        echo "Hay algún producto con precio superior a 3€";
    }else{
        echo "No hay ningun producto con precio superior a 3€";
    }
?>









--------------------------------------------------------------------------------------------------
9. Programar un script en PHP que permita mostrar si hubo o no algún producto con precios
superiores a 3 euros. Si hay algún producto muestra el nombre y el precio de cada uno de
ellos en forma de listado y sino hay ninguno muestra el siguiente mensaje "No hay ningún
producto con precios superiores a 3 euros". Obligatoriamente debes utilizar una variable de
tipo boolean.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $precios = array("azúcar"=>2.7, "aceite"=>4, "arroz"=>1.5, 
    "sal"=>0.8, "pollo"=>2.4, "tomates"=>1.3, "pan"=>0.6);
    $numElementos=count($precios);

    $haySup3=false;
    foreach ($precios as $producto => $valor){
        if($valor >3){
            $haySup3=true;
            echo '' .$producto. '&nbsp;&nbsp; precio ' .$valor. '<br/>';
        }
    }
    if ($haySup3 == false){
        echo "Hay algún producto con precio superior a 3€";  
    }

    /*En este caso no ponemos un break cuando encontramos un producto con valor superior
    a 4€ ya que el enunciado nos pide que imprimamos por pantalla cada producto que cumpla
    dicha condición, si se encontrara un break despues de encontrar el primero, ya no 
    seguiría mirando e imprimiendo.*/
?>










--------------------------------------------------------------------------------------------------
10. Programar un script en PHP que permita mostrar si hubo o no algún producto con precios inferiores
a 1.5 euros. Si hay algún producto muestra el nombre y el precio de cada uno de
ellos en forma de listado y sino hay ninguno muestra el siguiente mensaje "No hay ningún
producto con precios inferiores a 3 euros". Obligatoriamente debes utilizar una variable de
tipo boolean.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $precios = array("azúcar"=>2.7, "aceite"=>4, "arroz"=>1.5, 
    "sal"=>0.8, "pollo"=>2.4, "tomates"=>1.3, "pan"=>0.6);
    $numElementos=count($precios);

    $haySup1yMedio=false;
    foreach ($precios as $producto => $valor){
        if($valor < 1.5){
            $haySup1yMedio=true;
            echo '' .$producto. '&nbsp;&nbsp; precio ' .$valor. '<br/>';
        }
    }

    /*Igual que el ejercicio anterior pero para productos con un valor menor a 1.5
    Soy yo? o es mas pesada que una tonelada de mierda?*/
?>









--------------------------------------------------------------------------------------------------
11. Programar un script en PHP que permita calcular y mostrar el precio del producto más caro.
Y el nombre de todos los productos con dicho precio.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $precios = array("azúcar"=>2.7, "aceite"=>4, "arroz"=>1.5, 
    "sal"=>0.8, "pollo"=>2.4, "tomates"=>1.3, "pan"=>0.6);
    $numElementos=count($precios);

    /*Con el primer bucle foreach, conseguimos el precio mas caro del array y lo guardamos
    en la variable $valorMasCaro*/ 
    $valorMasCaro = PHP_INT_MIN;
    foreach($precios as $producto => $valor){
        if($valor > $valorMasCaro){
            $valorMasCaro = $valor;
        }
    }

    /*Con este segundo bucle foreach comparamos el precio de cada elemento del array con 
    el $valorMasCaro y si coincide imprimimos su clave y su valor en el momento*/
    echo 'A continuación la lista de productos más caros <br/>';
    foreach($precios as $producto => $valor){
        if($valor == $valorMasCaro){
            echo '' .$producto. '&nbsp;&nbsp; precio ' .$valor. '<br/>';
        }
    }
?>









--------------------------------------------------------------------------------------------------
12. Programar un script en PHP que permita calcular y mostrar el precio del producto más barato.
Y el nombre de todos los productos con dicho precio.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $precios = array("azúcar"=>2.7, "aceite"=>4, "arroz"=>1.5, 
    "sal"=>0.8, "pollo"=>2.4, "tomates"=>1.3, "pan"=>0.6);
    $numElementos=count($precios);

    /*Con el primer bucle foreach, conseguimos el precio mas barato del array y lo guardamos
    en la variable $valorMasBarato*/ 
    $valorMasBarato = PHP_INT_MAX;
    foreach($precios as $producto => $valor){
        if($valor < $valorMasBarato){
           $valorMasBarato = $valor; 
        }
    }


    /*Con este segundo bucle foreach comparamos el precio de cada elemento del array con 
    el $valorMasBarato y si coincide imprimimos su clave y su valor en el momento*/
    echo 'A continuación la lista de productos más caros <br/>';
    foreach($precios as $producto => $valor){
        if($valor == $valorMasBarato){
            echo '' .$producto. '&nbsp;&nbsp; precio ' .$valor. '<br/>';
        }
    }
?>








--------------------------------------------------------------------------------------------------
13. Programar un script en PHP que permita mostrar si hay o no “sal”. Si hay “sal” muestra el
siguiente mensaje: "Hay sal y su precio es xxx.dd euros" y sino hay muestra el siguiente
mensaje "No hay sal". Obligatoriamente debes utilizar una variable de tipo boolean.
--------------------------------------------------------------------------------------------------
SOLUCION:

<?php 
    /* VARIABLES PROPORCIONADAS */
    $precios = array("azúcar"=>2.7, "aceite"=>4, "arroz"=>1.5, 
    "sal"=>0.8, "pollo"=>2.4, "tomates"=>1.3, "pan"=>0.6);
    $numElementos=count($precios);

    $haySal = False;
    foreach($precios as $producto => $valor){
        if($producto=="sal"){
            $haySal=True;
            echo "Hay sal y su precio es $valor euros";
        }
    }
    if($haySal==False){
        echo "No hay sal";
    }

?>








                /*===============================================*/
                /*===============================================*/
                /*===========  PHP - PRACTICA 3 TEMA 5  =========*/
                /*===============================================*/
                /*===============================================*/




--------------------------------------------------------------------------------------------------
1. Escribir el resultado de la ejecución de este código.
<?php
    
    $i=1;
    while($i<=10):
        if($i % 2 == 0):
            echo "$i &nbsp;&nbsp;&nbsp;";
        endif;
    $i++; //$i=$i+1;
    endwhile;

    echo "<br/><br/><br/>";

    for($i=1;$i<=10;$i++):
        if($i % 2 == 0):
            echo "$i &nbsp;&nbsp;&nbsp;";
        endif;
    endfor;

    /*Y ooootro perrito pilootooo... decimonobena vez que hacemos el ejercicio de los multiplos
     de dos... Carmen es mas aburrida que escuchar una partida de ajedrez por la radio*/
?>
--------------------------------------------------------------------------------------------------
SOLUCION:

2    4    6    8    10    


2    4    6    8    10   








--------------------------------------------------------------------------------------------------
2. Escribir el resultado de la ejecución de este código.
<?php
    $n=array(2, 7, 8, 3);
    $c = 0;
    $ac = 0;
    $numero_elementos=count($n);

    for($i=0;$i<$numero_elementos;$i++){
        if($n[$i] == 8 ):
            $c++;
        endif;
        $ac=$ac+$n[$i];
    }
    echo "\$c = $c &nbsp;&nbsp; \$ac = $ac";
?>
--------------------------------------------------------------------------------------------------
SOLUCION: $c = 1    $ac = 20
