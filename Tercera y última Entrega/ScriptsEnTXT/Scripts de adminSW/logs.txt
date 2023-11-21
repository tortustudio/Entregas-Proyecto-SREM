#!/bin/bash

var=10
while [ $var -ne 0 ]
do	
	echo "Menu Logs"
	select opci in Apache Mysql Volver
	do
	case $REPLY in 
		1) 	clear
			sudo cat /var/log/apache2/error.log
		       	break;;
		2) 	clear
			sudo cat /var/log/mysql/error.log
			break;;
		3) var=0
			clear
			break;;	
		*) echo "Esa no es una opción"
			break;;

	esac
done
done
