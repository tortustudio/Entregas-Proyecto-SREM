#!/bin/bash


mysql -u "adminBD" -p"admin1234" -D "TortuStudioProyecto" -e "Select CI, nombre, apellido, estado from chofer"
read -p "Ingresa la cedula del chofer que desea inhabilitar (recuerde usar formato x.xxx.xxx-x)
" cedula
read -p "Ingrese el mes en que debe volver el chofer (1-12): 
"  mes
read -p "Ingrese el día en que debe volver el chofer (1-31): 
" dia

if [ $mes -lt 1 -o $mes -gt 12 ] || [ $dia -lt 1 -o $dia -gt 31 ] 
then
  echo "Fecha ingresada no válida."
else
  mysql -u "adminBD" -p"admin1234" -D "TortuStudioProyecto" -e "Update chofer SET estado = 0 WHERE CI = '$cedula'"
  fecha="$dia-$mes"
  echo "$cedula - $fecha" >> lista.txt
    identificador=`date +"%Y%m%d%H%M%S"`
	echo "$cedula - $fecha"
 (crontab -l ; echo "0 0 $dia $mes * /home/adminBD/alta_chofer_dias.sh $cedula $fecha $identificador") | crontab -

fi
