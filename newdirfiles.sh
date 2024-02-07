#!/bin/bash
# Comprobamos que se introducen 3 args y que el seguno se encuentra entre 1 y 99
if [ $# -eq 3 ] && [ $2 -ge 1 ] && [ $2 -le 99 ] # con [] evalúa
then
    dirname=$1
    num_files=$2
    basefilename=$3

    if `test -d $dirname` # sin [] ejecuta el comando
    then
        echo "El directorio existe"
    else
        echo "El directorio no existe"
    fi
fi

#!/bin/bash
# Comprobamos que se introducen 3 args y que el seguno se encuentra entre 1 y 99
if [ $# -eq 3 ] && [ $2 -ge 1 ] && [ $2 -le 99 ] # con [] evalúa
then
    dirname=$1
    num_files=$2
    basefilename=$3

    if ! test -d $dirname # para comprobar que no existe, luego lo crea, flag -d para comprobar que es dir.
    then 
        mkdir $dirname
    fi
    for ((i=0 ; i<$num_files ; i++))
    do
        touch $dirname/$basefilename$i.java #le puedo añadir extensiones
    done
fi