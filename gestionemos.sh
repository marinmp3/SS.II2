#/bin/bash
# orden=$1
directorio_creado=""
salida=true
orden=$1
for arg in $@
do
    fichero="./gestionemos.log"
    touch $fichero
    printf "%-20s %-20s %-20s %-10s %-10s %-10s %-10s %-10s %-10s\n" `date "+%F %T %z"` $fichero $orden $salida >> $fichero 


if [ $1 == "-m" ] || [ $1 == "--manual" ]
    then
    echo "-m || --manual: Muestra un manual de uso del script."
    echo "-d || --dir: Crea directorios."
    echo "-p || --process: Lista recursivamente los procesos en funcionamiento."
    echo "-l || --list: Lista los ficheros del directorio especificado."
    echo "-k || --kill: Mata el proceso especificado."
    echo "-b || --backup: Crea y comprime una copia del directorio HOME."

elif [ $1 == "-d" ] || [ $1 == "--dir" ]
then
    shift
    argumento=$1    
    if [ $argumento == "-d" ] || [ $argumento == "--dir" ]
    then
        shift
        argPosterior=$1
        echo "seleccionaste -d o --dir"
    else
        if [ $argumento = "+" ]
        then
            if [ -z "$directorio_creado" ]
            then
                echo "No se puede usar '+' sin haber creado un directorio previamente"
            fi
        else
        if [ -z "$directorio_creado" ]
        then
            mkdir -p "$argumento"
            directorio_creado="$argumento"
        else
            mkdir -p "$directorio_creado/$arg"
            fi
        fi
    fi


elif [ $1 == "-p" ] || [ $1 == "--process" ]
then
    shift
    user=$1
    touch "procesos_$user_`date`.log"
    top -u $user >> procesos_"$user"_"$date".log
    

elif [ $1 == "-l" ] || [ $1 == "--list" ]
then
    shift
    while $1 == "-l" 
    do
        shift
        nuevaorden=$1
        echo "Introduce --list o --log: "
        if [[ $nuevaorden == "--list" ]]
        then
            if [ $# -gt 1 ]
            then 
                shift
                dir_arg=$1
                touch "ficheros_$dir_arg_`date`.log"
                ls -a $dir_ar >> "ficheros_$dir_arg_`date`.log"
                for fichero in $dir_arg
                do
                    echo El directorio $dir_arg contiene $# ficheros
                done
            else
                touch "ficheros_HOME_`date`.log"
                ls -a ~ >> "ficheros_HOME_`date`.log"
            fi
        fi
    done
    
 
elif [ $1 == "-k" ] || [ $1 == "--kill" ]
then
    shift
    PID=$1
    read -r "¿Quieres proseguir con la operación? (se eliminará el proceso $PID). Introduce S/n: "
    shift
    respuesta=$1
    if [ $respuesta == "S" ]
    then
        kill $PID
        echo El proceso se ha eliminado correctamente.
    else
        echo No se ha eliminado el proceso.
    fi

elif [ $1 == "-b" ] || [ $1 == "--backup" ]
then
    shift
    touch backup_file
    backup_file="backup_$(date +%Y%m%d_%H%M%S).zip"
    gzip -r "backup_file" ~/*

    if [ $? -eq 0 ]
    then
        echo "Copia de seguridad creada correctamente: $backup_file"
    else
        echo "Error al crear la copia de seguridad."
    fi

elif [ $1 == "-l" ] || [ $1 == "--log" ]
then
    shift
    while $1 == "-l" 
    do
        shift
        nuevaorden=$1
        echo "Introduce -list o -log: "
        if [[ $1 == "--log" ]]
        then
            `date` >> $fichero
        fi
    done
    
    

else
    echo Argumento no reconocido.
    salida=false


fi
done

      