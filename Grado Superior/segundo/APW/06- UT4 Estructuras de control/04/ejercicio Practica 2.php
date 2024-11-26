<!DOCTYPE html>
<html lang="es">
 <head>
 <title></title>
 <meta charset="UTF-8"/>
 </head>
 <body>
    <?php





/* 7. */

         for($i=1,$i<=50,$i++);
            if($i % 5 == 0);
               echo "$i &nbsp;&nbsp;&nbsp;";
            endif;
         endfor;
    
        /* SOLUCION: 5 10 15 20 25 30 35 40 45 50 */


/* 8. */

$i=1;
while($i==15);
    if($i %3 == 0);
         echo "$i &nbsp;&nbsp;&nbsp;";
        endif;
    $i++;
    endwhile;

        /* SOLUCION: NO muestra nada */


/* 9. */
$i=3;
while($i<=15);
    if($i % 3 == 0);
    echo "$i &nbsp;&nbsp;&nbsp;";
    $i++;
    endif;
endwhile;


        /* SOLUCION: BUCLE INFINITO */


/* 10. */
for($i=3,$i<=15,$i=$i+3);
        echo "$i &nbsp;&nbsp;&nbsp;";
endfor;


/* 11. */
/* SOLUCION: c, d, e */

/* 13. */
    for($i=2;$i<=6;$i+=2):
        echo "$i &nbsp;&nbsp;&nbsp;";
        echo "$i &nbsp;&nbsp;&nbsp;";
    endfor;

/* 15. */
    for($i=2;$i<=6;$i+=2):
        echo "$i &nbsp;&nbsp;&nbsp;";
            break;
        echo "$i &nbsp;&nbsp;&nbsp;";
    endfor;





    
    ?>
</body>
</html>