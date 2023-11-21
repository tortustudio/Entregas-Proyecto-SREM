#!/bin/bash


total_conductores=`mysql -u adminBD -p"admin1234" -D TortuStudioProyecto -se "SELECT COUNT(*) FROM chofer;"`


habilitados=`mysql -u adminBD -padmin1234 -D TortuStudioProyecto -se "SELECT COUNT(*) FROM chofer WHERE estado = 1;"`


inhabilitados=`mysql -u adminBD -padmin1234 -D TortuStudioProyecto -se "SELECT COUNT(*) FROM chofer WHERE estado = 0;"`


porcentaje_habilitados=`expr $habilitados \* 100 / $total_conductores`
porcentaje_inhabilitados=`expr $inhabilitados \* 100 / $total_conductores`

clear
echo "Porcentaje de conductores habilitados: $porcentaje_habilitados%"
echo "Porcentaje de conductores inhabilitados: $porcentaje_inhabilitados%"
