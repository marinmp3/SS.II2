#!/bin/bash
# Marina Cañas Izquirdo, Oscar Benito, Pablo Jimenez
if [ $# -eq 4 ] && [ $2 == "-o" ] || [ $2 == "-v" ] && [ $3 == "-f" ] || [ $3 == "-d" ] 
then
    dirname=$1
    num_files=$4

    if [ $2 == "-o" ]
    then
        if test -d $dirname
        then
            mv $dirname .$dirname
        elif ! test -d .$dirname
        then
            mkdir .$dirname
        fi

    elif [ $2 == "-v" ]
    then
        if test -d .$dirname
        then
            mv .$dirname $dirname
        elif ! test -d $dirname
        then
            mkdir $dirname
        fi
    fi

    if [ $2 == "-o" ]
    then
        if [ $3 == "-f" ] && [ $4 -ge 1 ] && [ $4 -le 100 ] 
        then
            for ((i=1 ; i<=$num_files ; i++))
            do
                touch .$dirname/dir_$dirname.$i
            done
        elif [ $3 == "-d" ] && [ $4 -ge 1 ] && [ $4 -le 100 ]
        then    
            for ((i=1 ; i<=$num_files ; i++))
            do
                mkdir .$dirname/dir_$dirname.$i
            done
        fi
    elif [ $2 == "-v" ]
        then
        if [ $3 == "-f" ] && [ $4 -ge 1 ] && [ $4 -le 100 ] 
        then
            for ((i=1 ; i<=$num_files ; i++))
            do
                touch $dirname/dir_$dirname.$i
            done
        elif [ $3 == "-d" ] && [ $4 -ge 1 ] && [ $4 -le 100 ]
        then    
            for ((i=1 ; i<=$num_files ; i++))
            do
                mkdir $dirname/dir_$dirname.$i
            done
        fi
    fi
else
    echo "El formato de los argumentos es incorrecto."
fi