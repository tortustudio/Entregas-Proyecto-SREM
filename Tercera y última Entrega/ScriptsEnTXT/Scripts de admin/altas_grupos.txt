#!/bin/bash

read -p "Ingrese el nombre del grupo a crear
" nombre 

validar=`grep -w $nombre /etc/group`

validar1=$?

if [ $validar1 -eq 0 ] 
	then 
		clear
		echo "Ya existe un grupo con ese nombre"

	else

		sudo groupadd $nombre
		echo $PASSWORD
		clear
		echo "Grupo creado correctamente"
fi
