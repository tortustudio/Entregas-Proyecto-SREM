#!/bin/bash

mysql -u "adminBD" -p"admin1234" -D "TortuStudioProyecto" -e "Select CI, nombre, apellido, estado from chofer";
read -p "Ingresa la cedula del chofer que desea inhabilitar manualmente (recuerde usar formato x.xxx.xxx-x y que 1 es habilitado y 0 inhabilitado)
" cedula

mysql -u "adminBD" -p"admin1234" -D "TortuStudioProyecto" -e "Update chofer SET estado = 0 WHERE CI = '$cedula'";
echo "Chofer inhabilitado correctamente"
