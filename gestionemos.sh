#/bin/bash
if [$1 == "-m" || $1 == "--manual"]
    then
    man ls
elif [$1 == "-d" || $1 == "--dir"]
    then
    mkdir $#
    for argumento in $@
    if [$argumento == "+"]
    do
        mkdir $argumento
    done
        






# ● -m o --manual: Muestra un manual de uso del script.
# ● -d o --dir: Crea directorios basados en los argumentos dados. Si un argumento es el
# carácter ‘+’, los directorios a partir de ese argumento se crean dentro del último
# directorio creado.
# ○ Ejemplo: Si proporcionas los argumentos dir1 dir2 + dir3, se crearán los
# directorios dir1 y dir2, y dentro de dir2 se creará dir3.
# ● -p o --process: Lista todos los procesos en funcionamiento del usuario
# especificado como argumento en un archivo
# procesos_{usuario}_{fecha_hora}.log y muestra por pantalla el total de
# procesos en funcionamiento.
# ● -l o --list: Lista todos los ficheros del directorio especificado como argumento en
# un archivo ficheros_{directorio}_{fecha_hora}.log y muestra el total de
# ficheros por pantalla. Si no se proporciona ningún argumento, se realiza el listado
# sobre el directorio ${HOME}.
# ● -k o --kill: Mata el proceso especificado como argumento (PID), solicitando
# confirmación antes de hacerlo (comando read).
# ● -b o --backup: Crea una copia del directorio ${HOME} y lo comprime en un archivo
# zip (comando zip) con el nombre backup_{fecha_hora}.zip .