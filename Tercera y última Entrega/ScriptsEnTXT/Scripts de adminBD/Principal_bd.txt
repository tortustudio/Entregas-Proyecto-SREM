#!/bin/bash
var=1
clear
while [ $var -ne 0 ]
do 
echo "Seleccione la opcion a ingresar"	
select opci in Choferes Servicios Verificar_Internet Logs Respaldos Promedio_viajes Salir
do
case $REPLY in 
	1)./lista.sh
		break;;
	2)./Servicios_bd.sh
		break;;
	3)./verificar_internet.sh
		break;;
	4)./logs.sh
		break;;
	5)./Respaldo.sh
		break;;	
	6)./promedio_viaje.sh
		break;;	
	7)
	var=0
	break;;	
esac
done
done
exit
