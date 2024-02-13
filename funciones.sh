#!/bin/bash

sumar(){
    numero1=$1
    numero2=$2

    echo $[ $numero1 + $numero2 ]
}

# ================= MAIN ================= #

sumar 7 7

resultado=`sumar 7 7`

echo $resultado