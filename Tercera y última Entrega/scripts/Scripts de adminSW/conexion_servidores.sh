#!/bin/bash
var=1
clear
while [ $var -ne 0 ]
do 
echo "Seleccione el servidor que desea revisar"	
select opci in Base_de_datos Respaldo Volver
do
case $REPLY in 
	1)
echo "Verificando..."
sudo ping -c 3 192.168.21.144 > /dev/null 2>&1

if [ $? -eq 0 ]; then
	clear
	echo "El servidor se encuentra conectado"
else
	clear
	echo "El servidor no se encuentra conectado"
fi
		break;;
	2)

echo "Verificando..."
sudo ping -c 3 192.168.21.144 > /dev/null 2>&1

if [ $? -eq 0 ]; then
	clear
	echo "El servidor se encuentra conectado"
else
	clear
	echo "El servidor no se encuentra conectado"
fi

		break;;
	3)
	var=0
	break;;	
esac
done
done
exit
