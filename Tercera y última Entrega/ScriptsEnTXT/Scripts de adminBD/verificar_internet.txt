#!/bin/bash
echo "Verificando acceso a Internet"
sudo ping -c 3 8.8.4.4 > /dev/null 2>&1

if [ $? -eq 0 ]; then
	clear
	echo "Tienes acceso a internet"
else
	clear
	echo "No tienes acceso a Internet"
fi


