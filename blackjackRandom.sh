#!/bin/bash
# Haz un script wru permita jugar a Blackjack
# El as tiene un valor de 11
# El resto de cartas valen su n´mero
# El script debe permitir al usuario pedir carta
# Una vez que el usuario se planta, le toca jugar al crupier
# El crupier pide carta mientras su mano sume menos de 17
# El jugador que se pase de 21 pierde automáticamente
# Si no se pasa de 21, gana el jugador que más se acerque
# Guarda un log de la partida (cartas que van saliendo y suma de las manos, así como el ganador) en un fichero blackjack.log

printf "Pide carta: [Introduce "Dame carta"]"

solicitud=$1
if [ $solicitud == "Dame carta" ]
then


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