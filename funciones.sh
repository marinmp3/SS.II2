#!/bin/bash
sumar(){

    numero1=$1
    numero2=$2

    echo $[ $numero1 + $numero2 ]
    return 0 //sirve para determinar si la funct. funciona bien o no - para obtener el resultado usar echo
}
# --- main --- #
sumar 7 7 55
resultado=`sumar 7 $2`
resultado=`sumar 7 15`
echo $resultado

resultado=$?
echo $resultado