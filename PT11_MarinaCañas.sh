#!/bin/bash

nombre_equipo=$1
shift
deporte=$1
shift
num_participantes=$#

if [ $deporte == "futbol" ] || [ $deporte == "baloncesto" ] || [ $deporte == "voleibol" ]
then
    if [ $deporte == "futbol" ] && [ $num_participantes -eq 11 ]
    then    
        echo El equipo $nombre_equipo se compone de $num_participantes jugadores:
        for participante in $@
        do
            echo "Jugador: " $participante
        done

    elif [ $deporte == "baloncesto" ] && [ $num_participantes -eq 5 ]
    then
        echo El equipo $nombre_equipo se compone de $num_participantes jugadores:
        for participante in $@
        do
            echo "Jugador: " $participante
        done
        
    elif [ $deporte == "voleibol" ] && [ $num_participantes -eq 6 ]
    then
        echo El equipo $nombre_equipo se compone de $num_participantes jugadores:
        for participante in $@
        do
            echo "Jugador: " $participante
        done
        
    else    
        echo "Introduce la cantidad de miembros necesaria para el deporte $deporte."
    fi
else 
    echo "Inserta un deporte válido."
fi