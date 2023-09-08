#!/bin/bash


echo "Menu de grupos"
select opci in Altas Bajas Modificar Volver
do
	case $REPLY in 
		1)./altas_grupos.sh;;
		2)./bajas_grupos.sh;;
		3)./modificar_grupos.sh;;
		4)break;;
	esac
done
