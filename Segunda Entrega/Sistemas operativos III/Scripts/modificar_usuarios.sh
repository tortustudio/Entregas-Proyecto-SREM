#!/bin/bash
var=10
read -p "Ingrese el nombre del usuario a modificar
" nombre
validar=`grep -w $nombre /etc/passwd`
validar1=$?
if [ $validar1 -eq 0 ]
then	
while [ $var -ne 1 ]
do
echo "Ingrese el campo a modificar"	
select opci in 	contraseña nombre grupo_secundario volver
do
	case $REPLY in
		1)	echo "Ingrese la nueva contraseña"
		       	sudo passwd $nombre;;
		2) 	read -p "Ingrese el nuevo nombre del usuario
" nom
			validar2=`id $nombre`
			validar3=$?
			if [ $validar3 -eq 0 ]
			then
			echo "el nombre ingresado ya existe"
			else
			sudo usermod -l $nom $nombre
echo "Nombre cambiado exitosamente"
			fi;;
		3) read -p "Ingrese el nuevo grupo secundario del usuario
" grupo
validar4=`grep -w $grupo /etc/group`
validar5=$?
if [ $validar5 -eq 0 ] 
then	
		 	usermod -a -G $grupo $nombre
			echo "El grupo se cambio exitosamente"
		else
echo "El grupo ingresado no existe"
fi;;
		4) break;;
		
esac
done
var=1
done
else
echo "El nombre ingresado no existe"
fi
	
