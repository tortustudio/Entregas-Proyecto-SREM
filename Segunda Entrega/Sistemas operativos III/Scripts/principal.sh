#!/bin/bash
var=1
clear
while [ $var -ne 0 ]
do 
echo "Seleccione la opcion a ingresar"	
select opci in Usuarios Grupos Actualizar_sistema Verificar_Internet choferes Salir
do
case $REPLY in 
	1)./usuarios.sh;;
	2)./grupos.sh;;
	3)./actualizar.sh;;
	4)./verificar_internet.sh;;
	5)./lista.sh;;
	6)break;;	
esac
done
var=0
done
exit
