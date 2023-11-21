#!/bin/bash
var=1
while [ $var -ne 0 ] 
do
echo "En que servicio desea trabajar ? "
select opci in FTP MYSQL APACHE Volver
do
	case $REPLY in 
		1)	clear
			echo "FTP"
		       	select opc in Estado Iniciar Reiniciar Detener Volver
			do
			case $REPLY in	
				1)	clear 
				systemctl status vsftpd
					break;;
				2) 	clear
				systemctl start vsftpd
					break;;
				3)	clear 
				systemctl restart vsftpd
					break;;
				4)	clear 
				systemctl stop vsftpd
					break;;
				5) break;;	
			esac	
			done
			break;;	
		2)	clear	
			echo "MYSQL"
		      	select o in Estado Iniciar Reiniciar Detener Volver	
			do
			case $REPLY in 
				1)	clear 
				systemctl status mysql
					break;;
				2) 	clear
				systemctl start mysql
					break;;
				3)	clear 
				systemctl restart mysql
					break;;
				4)	clear 
				systemctl stop mysql
					break;;
				5) break;;
			esac
			done
			break;;
		3) 	clear
			echo "APACHE"
			select op in Estado Iniciar Reiniciar Detener Volver
			do
			case $REPLY in
				1)	clear 
				systemctl status apache2
					break;;
				2)	clear 
				systemctl start apache2
					break;;
				3)	clear 
				systemctl restart apache2
					break;;
				4)	clear 
				systemctl stop apache2
					break;;
				5) break;;
			esac
			done
			break;;
		4)	var=0
			clear
		       	break;;
		esac
		done	
	done	
