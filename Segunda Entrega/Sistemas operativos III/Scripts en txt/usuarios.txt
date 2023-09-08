#!/bin/bash
echo "Menu de usuarios"
select opci in Altas Bajas Modificaciones Volver
do
	case $REPLY in 
		1)./altas_usuarios.sh;;
		2)./bajas_usuarios.sh;;
		3)./modificar_usuarios.sh;;
		4)break;;
	esac
done
		
