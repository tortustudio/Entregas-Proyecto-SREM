#!/bin/bash

mysql -u "adminBD" -p"admin1234" -D "TortuStudioProyecto" -e "Select CI, nombre, apellido, estado from chofer";
read -p "Ingresa la cedula del chofer que desea habilitar manualmente (recuerde usar formato x.xxx.xxx-x y que 1 es habilitado y 0 inhabilitado)
" cedula

mysql -u "adminBD" -p"admin1234" -D "TortuStudioProyecto" -e "Update chofer SET estado = 1 WHERE CI = '$cedula'";
echo "Chofer habilitado correctamente"
