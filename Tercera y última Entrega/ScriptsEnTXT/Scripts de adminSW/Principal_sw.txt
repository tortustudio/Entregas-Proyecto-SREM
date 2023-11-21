#!/bin/bash
var=1
clear
while [ $var -ne 0 ]
do 
echo "Seleccione la opcion a ingresar"	
select opci in CuentasLogs Respaldo Servicios_SW Conexión_servidores Logs Acceso_internet Salir
do
case $REPLY in 
	1)./cuentaslogsw.sh
		break;;
	2)./respaldo_SitioWeb.sh
		break;;
	3)./Servicios_sw.sh
		break;;
	4)./conexion_servidores.sh
		break;;
	5)./logs.sh
		break;;	
	6)./verificar_internet.sh
		break;;	
	7)
	var=0
	break;;	
esac
done
done
exit
