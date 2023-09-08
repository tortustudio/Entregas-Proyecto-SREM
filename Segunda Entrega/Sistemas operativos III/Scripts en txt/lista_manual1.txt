#!/bin/bash

cat -n .lista.txt | more
read -p "Ingresa la linea del chofer que desea habilitar manualmente
" num

if [ $num -eq 1 ]; then
	echo " No puedes habilitar el encabezado"
else
	sed -i -e $num'd' .lista.txt
	echo "Chofer habilitado correctamente"
fi 
