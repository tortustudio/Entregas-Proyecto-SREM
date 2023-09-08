#!/bin/bash


read -p "Ingrese la cedula del chofer a deshabilitar
" cedula
read -p "Ingrese la cantidad de dias a deshabilitar
" dias

grep -w $cedula .lista.txt > /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo "Ese chofer ya se encuentra en la lista"
else

var="$cedula - Automatico - $dias"
echo $var >> .lista.txt
var1=$(echo "$dias * 86400" | bc) 
echo $var1
(sleep "$var1" && sed -i "/$var/d" ".lista.txt") &
fi
