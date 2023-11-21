#!/bin/bash
var=10
read -p "Ingrese el nombre del usuario a modificar
" nombre
validar=`id $nombre > /dev/null 2>&1`
validar1=$?
if [ $validar1 -eq 0 ]
then	
while [ $var -ne 1 ]
do
echo "Ingrese el campo a modificar del usuario $nombre"	
select opci in 	contraseña nombre grupo_secundario volver
do
	case $REPLY in
		1)	echo "Ingrese la nueva contraseña"
		       	sudo passwd $nombre
			clear
			echo "contraseña cambiada correctamente"
			break;;
		2) 	read -p "Ingrese el nuevo nombre del usuario
" nom
			validar2=`id $nom > /dev/null 2>&1`
			validar3=$?
			if [ $validar3 -eq 0 ]
			then
				clear
			echo "el nombre ingresado ya existe"
else
			sudo usermod -l $nom $nombre
			clear
echo "Nombre cambiado exitosamente"
			fi
			break;;
		3) read -p "Ingrese el nuevo grupo secundario del usuario
" grupo
validar4=`grep -w $grupo /etc/group`
validar5=$?
if [ $validar5 -eq 0 ] 
then	
		 	usermod -a -G $grupo $nombre
			clear
			echo "El grupo se cambio exitosamente"
else
			clear
echo "El grupo ingresado no existe"
fi
break;;
		4) var=1
			break;;
		
esac
done
done
else
	clear
echo "El nombre ingresado no existe"
fi
	
