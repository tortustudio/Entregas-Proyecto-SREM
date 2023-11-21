#!/bin/bash
var=1
while [ $var -ne 0 ] 
do

echo "Menu de grupos"
select opci in Altas Bajas Modificar Volver
do
	case $REPLY in 

		1)./altas_grupos.sh
			break;;
		2)./bajas_grupos.sh
			break;;
		3)./modificar_grupos.sh
			break;;
		4)var=0
			clear
			break;;
	esac
done
done
