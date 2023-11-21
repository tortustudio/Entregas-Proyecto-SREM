#!/bin/bash

if [ "$#" -lt 2 ]; then
    # setear valores por defecto para evitar error
    set -- 0 0
fi
# 1 para validar si es respaldo automático
fecha=`date "+%Y%m%d_%H"`
if [ $1 -eq 1 ]
then
    if [ $2 -eq 1 ]
    then
        # 1 para validar si es completo
        mysqldump -u adminBD -p"admin1234" --databases TortuStudioProyecto > /home/adminBD/Respaldos/Completos/RespaldoCompleto-$fecha.sql
        rsync -av /home/adminBD/Respaldos/Completos/RespaldoCompleto-$fecha.sql adminBD@localhost:/home/adminBD/Respaldo_servidor/RespaldoCompleto-$fecha.sql
        echo "Proceso de respaldo y envío completado."
        echo "Respaldo - $fecha - Completo" >> /var/log/respaldo.log
    else
        # nada para incrementativo
        mysqldump -u adminBD -p"admin1234" --single-transaction --flush-logs --databases TortuStudioProyecto > /home/adminBD/Respaldos/Incrementativo/RespaldoIncremental-$fecha.sql
        rsync -av /home/adminBD/Respaldos/Incrementativo/RespaldoIncremental-$fecha.sql adminBD@localhost:/home/adminBD/Respaldo_servidor/RespaldoIncremental-$fecha.sql
        echo "Proceso de respaldo y envío completado."
        echo "Respaldo - $fecha - Incrementativo" >> /var/log/respaldo.log
    fi
else
    # Elegir usuario
    var=10
    while [ $var -eq 10 ]
    do
        select opci in Incremental Completo Volver
        do
            case $REPLY in
                1)  mysqldump -u adminBD -p"admin1234" --single-transaction --flush-logs --databases TortuStudioProyecto > /home/adminBD/Respaldos/Incrementativo/RespaldoIncremental-$fecha.sql
                    rsync -av /home/adminBD/Respaldos/Incrementativo/RespaldoIncremental-$fecha.sql adminBD@localhost:/home/adminBD/Respaldo_servidor/RespaldoIncremental-$fecha.sql
                    echo "Proceso de respaldo y envío completado."
                    echo "Respaldo - $fecha - Incrementativo" >> /var/log/respaldo.log
                    break;;
                2)  mysqldump -u adminBD -p"admin1234" --databases "TortuStudioProyecto" > /home/adminBD/Respaldos/Completos/RespaldoCompleto-$fecha.sql
                    rsync -av /home/adminBD/Respaldos/Completos/RespaldoCompleto-$fecha.sql adminBD@localhost:/home/adminBD/Respaldo_servidor/RespaldoCompleto-$fecha.sql
                    echo "Proceso de respaldo y envío completado."
                 echo "Respaldo - $fecha - Completo" >> /var/log/respaldo.log
                    break;;
                3)  var=0
                    clear
                    break;;
                *)  echo "No es una opción"
                    break;;
            esac
        done
    done
fi

