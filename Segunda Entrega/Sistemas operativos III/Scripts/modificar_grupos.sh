#!/bin/bash

read -p "Ingrese el nombre del grupo a modificar 
" nombre 
validar=`grep -w $nombre /etc/group`
validar1=$?
if [ $validar1 -eq 0 ]
then
read -p "Ingrese el nuevo nombre del grupo 
" grup
validar2=`grep -w $grup /etc/group`
validar3=$?
if [ $validar3 -eq 0 ]
then
echo "el nombre ingresado ya existe"
else
sudo groupmod -n $grup $nombre
fi
else
	echo "El grupo a modificar no existe"
fi	
