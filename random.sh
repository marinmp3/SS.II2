#!/bin/bash

echo $RANDOM # devuelve entero entre 0 y 32767

echo $[ $RANDOM % 10 ] # Entero aleatorio entre 0 y 9 (devuelve los qu se pueden obtener dividiendo un #/10)

echo $[ $RANDOM % 10 + 1 ] # Entero aleatorio entre 1 y 10

echo $[ $RANDOM % ( 10 - 2 ) + ( 2 ) ] # Entero aleatorio entre 2 y 10

                # máximo-mínimo+1   #mínimo
echo $[ $RANDOM % ( 100 - 20 + 1 ) + ( 20 ) ] # Entero aleatorio entre 20 y 100