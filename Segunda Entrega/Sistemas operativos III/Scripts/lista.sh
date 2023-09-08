#!/bin/bash

select opci in habilitar_manual inhabilitar_manual inhabilitar_dias Lista volver
do
	case $REPLY in 
		1) ./lista_manual1.sh;;
		2)./lista_manual.sh;;
		3)./lista_dias.sh;;
		4)cat .lista.txt | more;;
		5)break;;
	esac
done

