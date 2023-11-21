<?php
	require_once '../conexSql.php';
    
    $tipo = $_POST['tipo'];
    $nom_usu = $_POST['nom_usu'];
    $apellido = $_POST['apellido'];
    $contrasena = $_POST['contrasena'];
	$ci = $_POST['ci'];	
    $tel = $_POST['tel'];
    $query = "UPDATE Usuarios u JOIN Usuarios_tel t ON u.ci = t.ci
        SET u.tipo = '$tipo',
            u.nom_usu = '$nom_usu',
            u.apellido = '$apellido',
            u.contrasena = '$contrasena',
            t.tel = '$tel'
        WHERE u.ci = $ci";
		$result = mysqli_query($conn, $query);
        if($result) {
            header("location: ver_emp.php");
        } else {
            echo "Error al ingresar los datos";
        }
?> 