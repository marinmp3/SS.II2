#!/bin/bash

# SCRIPT QUE SUMA CARTAS DE BLACKJACK
# echo "Tus cartas son $1 y $2."
# for argumento in $@
# do
#     echo $1+$2
# done

# if [$argumento == 1] 
#     then 
#         echo 11 + $argumento
# else if [$argumento == 2]
#     then
#         echo  2 + $argumento
# else if [$argumento == 3]
#     then
#         echo  3 + $argumento
# else if [$1 || $2 == 4]
#     then
#         echo  4 + $argumento
# else if [$1 || $2 == 5]
#     then
#         echo  5 + $argumento
# else if [$1 || $2 == 6]
#     then
#         echo  6 + $argumento
# else if [$1 || $2 == 7]
#     then
#         echo  7 + $argumento
# else if [$1 || $2 == 8]
#     then
#         echo  8 + $argumento
# else if [$1 || $2 == 9]
#     then
#         echo  9 + $argumento
# else if [$1 || $2 == 10 || $1 || $2 == 11 || $1 || $2 == 12 || $1 || $2 == 13]
#     then
#         echo  10 + $argumento
# else
#     echo "Valor fuera de rango"
# fi

# CORRECCIÓN - ERRORES - REFACTORIZAR IF/ELSE CON -ge Y le / USAR $argumento en las condiciones, no $1 y $2

echo "Hay $# cartas: $1 y $2"

suma=0

for carta in $@
do
    if [ $carta == 1 ]
    then
        suma=$[suma + 11]
    elif [ $carta == 11 ] || [ $carta == 12 ] || [ $carta == 13 ]
    then
        suma=$[suma + 10] 
    elif [ $carta -ge 2 ] &&  [ $carta -le 10 ]
    then
        suma=$[suma + carta] #suma el valor de la carta
    fi
done

if [ $suma -le 21 ]
then
    echo "La suma es $suma. Has ganado."
else
    echo "La suma es $suma. Perdiste."
fi