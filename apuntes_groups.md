## Crear grupos
sudo groupadd 1010 (GID) {nombregrupo}

## Comprobar grupo
* cat /etc/group
* getent group

## Borrar grupo
sudo delgroup ...

## Comandos SUDO
* -u: asigna id user
* -g: asigna id grupo
* -G: asigna otros grupos
* -m: crea carpeta personal del user, si todavía no existse. Por defecto, la crea en /home/{username}
* -d: personaliza la ruta de la carpeta de inicio
* -p: establece contraseña
* -s: shell (Intérprete de comandos que usa, los más comunes son bash y sh)
