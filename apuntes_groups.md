## Crear grupos
sudo groupadd 1010 (GID) {nombregrupo}

## Comprobar grupo
* cat /etc/group
* getent group

## Borrar grupo
sudo delgroup ...

# Modificar user
sudo deluser --force --remove-home {username}
sudo usermod -s /bin/bash {username} (p.e. cambia la shell al user esp.)

## Comandos SUDO
* -u: asigna id user
* -g: asigna id grupo
* -G: asigna otros grupos
* -m: crea carpeta personal del user, si todavía no existe. Por defecto, la crea en /home/{username}
* -d: personaliza la ruta de la carpeta de inicio
* -p: establece contraseña
* -s: shell (Intérprete de comandos que usa, los más comunes son bash y sh)
* -su: accede a un usuario
* sudo passwd User: crea una contraseña para el user especificado
* sudo usermod -aG personal {username}: asigna el grupo personal al user
