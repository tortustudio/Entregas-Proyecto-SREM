#!/bin/bash

var=1
while [ $var -ne 10 ]
do
select opci in habilitar_manual inhabilitar_manual inhabilitar_dias Porcentaje_choferes Volver
do
	case $REPLY in 
		1) 	clear
			./lista_manualhab.sh
			break;;
		2)	clear
			./lista_manualinhab.sh
			break;;
		3)	clear
			./lista_dias.sh
			break;;
		4) clear
			./PorcentajeChofer.sh
			break;;		
		5)	clear
			var=10
			break;;
	esac
done
done

