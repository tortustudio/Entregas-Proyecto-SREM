#!/bin/bash

var=10
while [ $var -ne 0 ]
do	
	echo "Menu Logs"
	select opci in Sistema Kernel Volver
	do
	case $REPLY in 
		1) 	clear
			sudo cat /var/log/auth.log
		       	break;;
		2) 	clear
			sudo cat /var/log/kern.log
			break;;
		3) var=0
			clear
			break;;	
		*) echo "Esa no es una opción"
			break;;

	esac
done
done
