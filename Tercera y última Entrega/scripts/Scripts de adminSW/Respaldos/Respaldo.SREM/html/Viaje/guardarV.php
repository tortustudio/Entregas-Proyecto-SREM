<?php
require_once '../conexSql.php';

$comentario = $_POST['comentario'];
$fecha = $_POST['fecha'];
$hora = $_POST['hora'];
$origen = $_POST['origen'];
$destino = $_POST['destino'];
$costo = $_POST['costo'];
$tipo = $_POST['tipo'];
$Nombre = $_POST['Nombre'];
$Apellido = $_POST['Apellido'];
$tel = $_POST['tel'];
$RUT = $_POST['RUT'];

$query = "SELECT cod_reserva FROM reserva";
$result = mysqli_query($conn, $query);

if ($result) {
    $cod_reserva = 0;
    while ($row = mysqli_fetch_assoc($result)) {
        $cod_reserva = $row['cod_reserva'];
        $cod_reserva = $cod_reserva + 1;
    }
}

$queryRe = "INSERT INTO `reserva` (`cod_reserva`, `comentario`, `fecha`, `hora`, `origen`, `destino`, `costo`, `tipo`) 
            VALUES ('$cod_reserva', '$comentario', '$fecha', '$hora', '$origen', '$destino', '$costo', '$tipo')";
$resultRe = mysqli_query($conn, $queryRe);

$queryRe2 = "INSERT INTO `reserva_pasajero` (`Nombre`, `Apellido`, `tel`, `cod_reserva`) 
VALUES ('$Nombre', '$Apellido', '$tel', '$cod_reserva')";
$resultRe2 = mysqli_query($conn, $queryRe2);

// Verifica si $RUT no está vacío antes de hacer la inserción
if (!empty($RUT)) {
    $queryRe3 = "INSERT INTO `genera` (`RUT`, `cod_reserva`)
    VALUES ('$RUT', '$cod_reserva')";
    $resultRe3 = mysqli_query($conn, $queryRe3);
}

if ($resultRe && $resultRe2) {
    header("Location: agregarViaje.php");
} else {
    echo "Ha ocurrido un error al insertar los datos: " . mysqli_error($conn);
}
?>
