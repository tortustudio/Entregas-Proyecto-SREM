#!/bin/bash
var=1
while [ $var -ne 0 ]
do
echo "Menu de usuarios"
select opci in Altas Bajas Modificaciones Volver
do
	case $REPLY in 
		1)./altas_usuarios.sh
			break;;
		2)./bajas_usuarios.sh
			break;;
		3)./modificar_usuarios.sh
			break;;
		4)var=0
			clear
			break;;
	esac
done
done		
