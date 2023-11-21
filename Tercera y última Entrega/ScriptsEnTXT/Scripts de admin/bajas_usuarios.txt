#!/bin/bash

read -p "Ingrese el nombre del usuario a eliminar
" nombre

id $nombre > /dev/null 2>&1;

if [ $? -eq 0 ] 
then
if [ $nombre = $USER ]
then
	clear
echo "No puedes borrar tu propio usuario"
else
sudo userdel -r $nombre > /dev/null 2>&1
	clear
echo "Usuario borrado correctamente"
fi
else 
	clear
echo "No existe un usuario con el nombre ingresado"
fi 

