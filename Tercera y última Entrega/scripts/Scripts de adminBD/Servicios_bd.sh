#!/bin/bash
var=1
while [ $var -ne 0 ] 
do
echo "En que servicio desea trabajar ? "
select opci in MYSQL Volver
do
    case $REPLY in 
        1)	clear	
            echo "MYSQL"
            select o in Estado Iniciar Reiniciar Detener Volver	
            do
            case $REPLY in 
                1)	clear 
                    sudo systemctl status mysql
                    break;;
                2) 	clear
                    sudo systemctl start mysql
                    break;;
                3)	clear 
                    sudo systemctl restart mysql
                    break;;
                4)	clear 
                    sudo systemctl stop mysql
                    break;;
                5) break;;
            esac
            done
            break;;
        2)	var=0
            clear
            break;;
    esac
done	
done

