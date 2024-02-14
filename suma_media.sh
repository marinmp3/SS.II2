#!/bin/bash

# HAZ UN SCRIPT QUE RECIBA LOS SIGUIENTES ARGUMENTOS:
# 1 - Nombre del directorio base
# 2 - Nombre de fichero para la suma
# 3 - Nombre de fichero para la media
# 4 y sucesivos - Lista de números para operar

# El script debe crear el directorio y los ficheros indicados
# El script debe calcular la suma y  la media de todos los números
# y alamcenar el resultado en los ficheros correspondientes

dir_name=$1 
addition_file=$2
avg_file=$3
shift
num_list=$@

for ((i=1 ; i<=$num_list ; i++))
    do
        mkdir $dir_name/dir_$dir_name.$i
        touch $addition_file/file_$addition_file.$i
    done

for ((i=0 ; i<$num_list ; i++))
do
    $sum=$num_list+$num_list -r
    echo $sum

for ((i=0 ; i<$num_list ; i++))
do
    avg=$num_list+$num_list / $num_list$#
    echo $avg

# CORRECCIÓN
dir_name=$1 
addition_file=$2
avg_file=$3
shift

mkdir $dir_name
sumatorio=0

for numero in $@
do  
    sumatorio=$[$sumatorio + $numero] # == sumatorio=$[$sumatorio + $numero]
done

echo "La suma es $sumatorio" > $dir_name/$addition_file
echo "La media es $[ $sumatorio/$# ]" > $dir_name/$avg_file 
