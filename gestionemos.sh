#/bin/bash
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

elif [ $1 == "-d" ] || [ $1 == "--dir" ]; then ###
    directorio_creado=""
    for arg in "$@"; do
        if [ "$arg" = "-d" ] || [ "$arg" = "--dir" ]; then
            echo "Seleccionaste la opción -d o --dir"
        else
            if [ "$arg" = "+" ]; then
                if [ -z "$directorio_creado" ]; then
                echo "Error: No se puede usar '+' sin haber creado un directorio previamente"
                fi
            else
                if [ -z "$directorio_creado" ]; then
                    mkdir -p "$arg"
                    directorio_creado="$arg"
                else
                    mkdir -p "$directorio_creado/$arg" ### modificar aquí
                fi
            fi
        fi
    done

elif [ $1 == "-p" ] || [ $1 == "--process" ]
then
    shift
    user=$1
    touch "procesos_$user_`date`.log"
    top -u $user >> procesos_"$user"_"$date".log
    

elif [ $1 == "--list" ]
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

elif [ $1 == "--log" ]
then
    `date` >> $fichero

elif [ $1 == "-g" ] || [ $1 == "--group" ]
then
    if [ $# -eq 1 ]
    then
        groups
    else
        shift
        nombreGrupo=$1
        GID=$2

        if [ $@ == *"-r"* ]
        then
            shift
            nombreGrupo=$1
            GID=$2
            sudo delgroup -r $nombreGrupo
            echo "Se ha eliminado el grupo $nombreGrupo"
        else
            sudo groupadd -g $GID $nombreGrupo
            if [ -z $GID ] 
            then
            echo "Se ha creado el grupo $nombreGrupo (El grupo no tiene GID)"
            else
                echo "Se ha creado el grupo $nombreGrupo, con GID $GID"
            fi
        fi
    fi

elif [[ $1 == "-u" || $1 == "--user" ]]
then
    if [ $# -eq 1 ]
    then
        whoami
    else
        shift
        username=$1
        mainGroup=$2
        secGroup=$3
        randomPswd=$((RANDOM % 999999 + 100000))

        if [[ $@ == *"-r"* ]]
        then
            shift
            username=$1
            mainGroup=$2
            sudo deluser --remove-home $username
            echo "Se ha eliminado el usuario $username."
        else
            shift
            for ((i=0; i<$#; i++))
            do
                secGroup=$arg[$i]
            done
            sudo useradd -m -g $mainGroup -p $randomPswd -s /bin/bash $username
            echo "
             Se ha creado el usuario $username.
             Grupo principal asignado: $mainGroup.
             Contraseña: $randomPswd.
             Grupos secundarios: ${secGroup[*]}."
        fi
    fi
else 
    echo Argumento no reconocido.
    salida=false
fi
done

      