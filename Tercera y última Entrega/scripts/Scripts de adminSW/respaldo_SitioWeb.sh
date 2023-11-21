#!/bin/bash

echo "Realizando respaldo del sitio web"
cp -r /var/www/html Respaldos/Respaldo.SREM
sleep 3 
echo "Respaldo realizado"
