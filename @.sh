#!bin/bash
# Haz un script que reciba como primer argumento el nombre de un fichero y escriba el resto de argumentos
# en el fichero
# La primera línea del fichero debe ser el número de filas escritas

file_name=$1
numeroArgumentos=$#

echo "$numeroArgumentos líneas escritas" > $file_name

for ((i=1 ; i<$numeroArgumentos ; i++))
do
    echo ${argumentos[i]} >> $file_name
done
