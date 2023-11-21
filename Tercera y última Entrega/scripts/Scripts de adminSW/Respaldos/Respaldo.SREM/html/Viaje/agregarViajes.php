<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Remises pocitos</title>
    <link rel="icon" href="../img/Remises pocitos.png">
    <link rel="stylesheet" href="../css/inicioAdm.css">
</head>

<body>
    <?php
session_start();
error_reporting(0);
$ci = $_SESSION['ci'];
if (!isset($ci)) {
location ("index.php");
}
?>
    <?php
session_start();
require_once '../conexSql.php';

$ci = $_SESSION['ci'];

$sql = "SELECT tipo FROM Usuarios WHERE ci = '$ci'";

$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $tipo_usuario = $row['tipo'];

    // Redirige según el tipo de usuario
    if ($tipo_usuario === 'Administrador') {
        $resu = '../inicioAdm.php';
    } elseif ($tipo_usuario === 'Administrativo') {
        $resu = '../inicio.php';
    }
}
?>
    <script src="../js/script_salir.js"></script>
    <table class="navbar">
        <tr>
            <td width="50px"></td>
            <td width="10%">
                <a href="../inicioAdm.php" title="Volver al inicio"><img src="../img/Remises pocitos.png" alt=""
                        class="img1"></a>
            </td>
            <td>
                <div class="dropdown" title="Expandir">
                    <button class="dropdown-toggle"><img src="../img/hamburguesa.png" alt="" class="img2"></button>
                    <ul class="dropdown-menu">
                        <?php
session_start();

// Verificar si el usuario es un Administrador
if (isset($_SESSION['tipo']) && $_SESSION['tipo'] === 'Administrador') {
    $tipo_usuario = $_SESSION['tipo'];
?>
                        <li class="dropdown-op1">
                            <a href="#" id="showButtons">Empleados</a>
                            <div id="buttonContainer" class="hidden">
                                <a href="../Empleados/ver_emp.php" class="dropdown-op">Ver</a>
                                <a href="../Empleados/agregarEmp.php" class="dropdown-op">Agregar</a>
                            </div>
                        </li>
                        <li class="dropdown-op1">
                            <a href="#" id="showButtons1">Choferes</a>
                            <div id="buttonContainer1" class="hidden1">
                                <a href="../Chofer/ver_Chofer.php" class="dropdown-op">Ver</a>
                                <a href="../Chofer/agregarChofer.php" class="dropdown-op">Agregar</a>
                            </div>
                        </li>
                        <li class="dropdown-op1">
                            <a href="#" id="showButtons2">Clientes</a>
                            <div id="buttonContainer2" class="hidden2">
                                <a href="../Cliente/ver_Cli.php" class="dropdown-op">Ver</a>
                                <a href="../Cliente/agregarCli.php" class="dropdown-op">Agregar</a>
                            </div>
                        </li>
                        <li class="dropdown-op1">
                            <a href="#" id="showButtons3">Viajes</a>
                            <div id="buttonContainer3" class="hidden3">
                                <a href="../Viaje/ver_Viajes.php" class="dropdown-op">Ver</a>
                                <a href="../Viaje/agregarViajes.php" class="dropdown-op">Agregar</a>
                            </div>
                        </li>
                        <li class="dropdown-op1">
                            <a href="#" id="showButtons4">Coches</a>
                            <div id="buttonContainer4" class="hidden4">
                                <a href="../Coche/ver_Coche.php" class="dropdown-op">Ver</a>
                                <a href="#" class="dropdown-op"></a>
                            </div>
                        </li>
                        <li class="dropdown-op2">
                            <a href="#" id="showButtons5">Man. de coches</a>
                            <div id="buttonContainer5" class="hidden5">
                                <a href="../Man.coche/ver_ManCoche.php" class="dropdown-op">Ver</a>
                                <a href="../Man.coche/agregarManCoche.php" class="dropdown-op">Agregar</a>
                            </div>
                        </li>
                    </ul>
                    <?php
}
?>
                    <?php
session_start();

// Verificar si el usuario es un Administrador
if (isset($_SESSION['tipo']) && $_SESSION['tipo'] === 'Administrativo') {
    $tipo_usuario = $_SESSION['tipo'];
?>
                    <li class="dropdown-op1">
                        <a href="#" id="showButtons">Choferes</a>
                        <div id="buttonContainer" class="hidden">
                            <a href="../Chofer/ver_Chofer.php" class="dropdown-op">Ver</a>
                            <a href="../Chofer/agregarChofer.php" class="dropdown-op">Agregar</a>
                        </div>
                    </li>
                    <li class="dropdown-op1">
                        <a href="#" id="showButtons1">Clientes</a>
                        <div id="buttonContainer1" class="hidden1">
                            <a href="../Cliente/ver_Cli.php" class="dropdown-op">Ver</a>
                            <a href="../Cliente/agregarCli.php" class="dropdown-op">Agregar</a>
                        </div>
                    </li>
                    <li class="dropdown-op1">
                        <a href="#" id="showButtons2">Viajes</a>
                        <div id="buttonContainer2" class="hidden">
                            <a href="../Viaje/ver_Viajes.php" class="dropdown-op">Ver</a>
                            <a href="../Viaje/agregarViajes.php" class="dropdown-op">Agregar</a>
                        </div>
                    </li>
                    <li class="dropdown-op1">
                        <a href="#" id="showButtons3">Coches</a>
                        <div id="buttonContainer3" class="hidden3">
                            <a href="../Coche/ver_Coche.php" class="dropdown-op">Ver</a>
                            <a href="#" class="dropdown-op"></a>
                        </div>
                    </li>
                    <li class="dropdown-op2">
                        <a href="#" id="showButtons4">Man. de coches</a>
                        <div id="buttonContainer4" class="hidden4">
                            <a href="../Man.coche/ver_ManCoche.php" class="dropdown-op">Ver</a>
                            <a href="../Man.coche/agregarManCoche.php" class="dropdown-op">Agregar</a>
                        </div>
                    </li>
                    </ul>
                    <?php
}
?>
                </div>
                <script src="../js/hamburguesa2.js"></script>
            </td>
            <td width="1370px"></td>
            <td>
                <button class="btn2" id="mostrarModal">Salir</button>
            </td>
            <td width="50px"></td>
        </tr>
    </table>
    <div id="miModal" class="modal">
        <div class="modal-contenido">
            <h2>¡¡¡Atención!!!</h2>
            <hr>
            <p>¿Está seguro de que quiere salir?</p>
            <div class="modal-botones">
                <a href="../Viaje/agregarViajes.php" class="btn5"><button id="Cancelar"
                        class="btn3">Cancelar</button></a>
                <a href="../logout.php" class="btn5"><button id="Salir" class="btn4">Salir</button></a>

            </div>
        </div>
    </div>
    <script src="../js/jquery.min.js"></script>

    <form method="POST" action="guardarV.php">
        <div class="contenedor1">
            <div class="card3">
                <br><br><br>
                <label class="lebel" title="comentario">Comentario</label>
                <br><br>
                <input type="text" id="comentario" class="input1" placeholder="Comentario..." maxlength="50" required />
                <br><br>
                <label class="lebel" title="origen">Origen del viaje</label>
                <br><br>
                <input type="text" id="origen" class="input1" placeholder="Origen..." maxlength="60" required />
                <br><br>
                <label class="lebel" title="destino">Destino del viaje</label>
                <br><br>
                <input type="text" id="destino" class="input1" maxlength="60" placeholder="Destino..." required />
                <br><br>
                <label class="lebel" title="costo">Costo del viaje</label>
                <br><br>
                <input type="text" id="costo" class="input1" maxlength="6" placeholder="Costo..." required
                    oninput="validarNumero(this);" />
                <br><br>
                <label class="lebel" title="fecha">Fecha del viaje</label>
                <br><br>
                <input type="date" id="fecha" class="input1" required />
                <br><br>
                <label class="lebel" title="hora">Hora del viaje</label>
                <br><br>
                <input type="time" id="hora" class="input1" required />
                <br><br>
            </div>
            <script>
            function validarNumero(input) {
                input.value = input.value.replace(/\D/g, '');
            }
            </script>

            <?php
    require_once '../conexSql.php';
    
    $query = "SELECT RUT FROM Empresa";
    $result = mysqli_query($conn, $query);
    $RUT = array();

    if($result) {
        while($row = mysqli_fetch_assoc($result)) {
            $RUT[] = $row['RUT'];
        }
    }
?>
            <div class="card3">
                <br><br><br>
                <label class="lebel" title="tipo">Tipo de cliente</label>
                <br><br>
                <select id="concepto" name="concepto" title="concepto" class="input2" required
                    onchange="mostrarCampos()">
                    <option value="" disable selected> -- seleccione el tipo -- </option>
                    <option value="Empresa">Empresa</option>
                    <option value="Particular">Particular</option>
                </select>
                <br><br>
                <div id="camposEmpresa" style="display: none;" class="card3">
                <label class="lebel" title="Rut">RUT</label>
                    <br><br>
                    <select id="RUT" name="RUT" title="RUT" class="input2" required>
                        <option value="" disable selected> -- seleccione el RUT -- </option>
                        <?php
                        foreach ($RUT as $rutOption) {
                            echo "<option value='$rutOption'>$rutOption</option>";
                        }
                    ?>
                    </select>
                    <br><br>
                </div>
                <label class="lebel" title="nombre">Nombre</label>
                    <br><br>
                    <input type="text" id="Nombre" class="input1" placeholder="Nombre..." />
                    <br><br>
                    <label class="lebel" title="apellido">Apellido</label>
                    <br><br>
                    <input type="text" id="Apellido" class="input1" placeholder="Apellido..." />
                    <br><br>
                    <label class="lebel" title="telefono">Teléfono</label>
                    <br><br>
                    <input type="text" id="tel" class="input1" placeholder="Teléfono..." />
            </div>


            <button type="button" id="save" class="btn18" title="Agregar"> Agregar Viaje</button>
            <a href="ver_Viajes.php" style="text-decoration: none; color: black;">
                <div class="btn19"> Ver Viajes</div>
            </a>
        </div>
    </form>

    <script>
    function mostrarCampos() {
        var concepto = document.getElementById("concepto").value;

        var camposEmpresa = document.getElementById("camposEmpresa");
        var camposParticular = document.getElementById("camposParticular");

        if (concepto === 'Empresa') {
            camposEmpresa.style.display = 'block';
        } else {
            camposEmpresa.style.display = 'none';
        }
    }
    </script>

    <button type="button" id="save" class="btn18" title="Agregar"> Agregar Viaje</button>
    <a href="ver_Viajes.php" style="text-decoration: none; color: black;">
        <div class="btn19"> Ver Viajes</div>
    </a>
    </div>
    </form>


    <script src="../js/cedula.js"></script>
    <script src="../js/formatoTel.js"></script>
    <script src="Viajes.js"></script>


</body>

</html>