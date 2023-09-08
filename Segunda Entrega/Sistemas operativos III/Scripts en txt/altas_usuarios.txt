#!/bin/bash

read -p "Ingrese el nombre del usuario a crear
 " nombre 
id $nombre > /dev/null 2>&1

if [ $? -eq 0 ]
then
echo "El usuario ingresado ya existe"
else

 sudo useradd -m -s /bin/bash $nombre 

## read -p "El usuario debe tener permisos de administrador? [s/n]
## " confi

##  if [ $confi = "s" ] 
##	then
##      		usermod -g sudo $nombre
##  fi 

 echo "proceda a ingresar la contraseña del nuevo usuario"
  sudo passwd $nombre

echo "Usuario creado correctamente"  
fi
