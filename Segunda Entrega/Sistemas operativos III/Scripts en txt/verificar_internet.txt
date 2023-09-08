#!/bin/bash
echo "Verificando acceso a Internet"
sudo ping -c 3 google.com > /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo "Tienes acceso a internet"
else
	echo "No tienes acceso a Internet"
fi


