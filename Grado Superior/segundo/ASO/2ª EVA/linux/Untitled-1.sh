#!/bin/bash

for (i=0;i=digitos;i++)
do
	echo \n "*"
done


############################################################################

#!/bin/bash

suma=$(($1+$2))

echo "el valor de la suma de $1 y $2 es: $suma"

############################################################################

#!/bin/bash

read -n3 -p  "introduce un numero de 3 digitos" numero

primerdigito=(echo $numero | cut -c 1)
tercerdigito=(echo $numero | cut -c 3)

if [ $primerdigito -eq $tercerdigito ] 
then 
    echo "el numero es capicua"
else 
    echo "el numero no es capicua"
fi

############################################################################

#!/bin/bash

read -p "dime como te llamas" nombre
read -p "dime que tan viej@ eres" edad

sleep 3
echo "te llamas $nombre y tienes $edad años, si que eres viej@"

############################################################################

#!/bin/bash



while [ $continuar = S ]
do 
    read -p "dime un mes" mes
    read -p "dime un año" anio
    cal $mes $anio
    read -n1 -p "quieres continuar? (S/N): " continuar
done

############################################################################

#!/bin/bash




while [ $continuar = S ]
do
    read -p "que archivo quieres ver?" archivo
    find / -name $archivo
    read -n1 -p "quieres seguir buscando archivos? (S/N):" continuar
done 


############################################################################

#!/bin/bash

directorios=0
directorios=$(ls -l | grep ^d | tr -s " " | cut -d ""-f9)
echo "estos son los nombres que hay en el directorio actual: $directorios"


############################################################################

#!/bin/bash

if [ -e $1 ] 
then 
    rm $1

else 
    echo "no se ha introducido ningun fichero"
    exit
fi


############################################################################

#!/bin/bash



if [ $# -le 1 ]
then 
    echo "no has introducido suficientes parametros"
else 
    if [ $# -gt 2 ]
    then 
        echo "demasiados parametros"
    else 
        if [ $1 -eq $2 ] 
        then 
            echo "las palabras son iguales"
        else 
            echo "las palabras son diferentes"
        fi
    fi
fi 

############################################################################

#!/bin/bash

tam1=`ls -l $1 | cut -d " " -f5`
tam2=`ls -l $2 | cut -d " " -f5`

if [ $tam1 -eq $tam2 ] 
then
    echo "los archivos son iguales"
else 
    echo "los archivos no son iguales"
fi

############################################################################

#!/bin/bash
