#!/bin/bash

read -p "Ingrese la cedula del chofer a inahbilitar 
" cedula

grep -w $cedula .lista.txt > /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo "Este chofer ya se encuentra dentro de la lista negra"
else
	echo "$cedula - Manual - Null" >> .lista.txt
	echo "Chofer inhabilitado correctamente"

fi
