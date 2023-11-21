#!/bin/bash


total_viajes=`mysql -u adminBD -p"admin1234" -D TortuStudioProyecto -se "SELECT count(*) FROM Reserva WHERE YEARWEEK(fecha, 1) = YEARWEEK(DATE_SUB(CURDATE(), INTERVAL 1 WEEK), 1) AND DAYOFWEEK(fecha) BETWEEN 1 AND 7;"`

promedio_viajes=`expr $total_viajes / 7`


clear
echo "Promedio de viajes realizados en la ultima semana: $promedio_viajes"

