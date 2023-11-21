#!/bin/bash
sed -i "/^$1 - $2/d" lista.txt 2>> archivo.txt
mysql -u 'adminBD' -p'admin1234' -D 'TortuStudioProyecto' -e "Update chofer SET estado = 1 WHERE CI = '$1'"
crontab -l | grep -v "$3" | crontab -
