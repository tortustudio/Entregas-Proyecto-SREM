#!/bin/bash
var=1
clear
while [ $var -ne 0 ]
do 
echo "Seleccione la opcion a ingresar"	
select opci in Usuarios Grupos Actualizar_sistema Verificar_Internet Servicios Logs Salir
do
case $REPLY in 
	1)./usuarios.sh
		break;;
	2)./grupos.sh
		break;;
	3)./actualizar.sh
		break;;
	4)./verificar_internet.sh
		break;;
	5)./servicios.sh
		break;;
	6)./logs.sh
		break;;

	7)
	var=0
	break;;	
esac
done
done
exit
