#!/bin/bash
clear
mysql -u "adminBD" -p"admin1234" -D "TortuStudioProyecto" -e "Select ci_u as Usuarios_logueados from Sesiones";

