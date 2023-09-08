#!/bin/bash

read -p "Ingrese el nombre del grupo a eliminar
" nombre

validar=`grep -w $nombre /etc/group`

validar1=$?

if [ $validar1 -eq 0 ]

then
if [ $nombre = "sudo" ]
then
echo "No puedes borrar el grupo administrador"
else
sudo groupdel $nombre	
echo $PASSWORD
echo "Borrado correctamente"
fi	

else

	echo "No se encontró un grupo con el nombre ingresado"

fi	
