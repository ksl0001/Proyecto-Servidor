<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN- Ana Cabezas</title>
</head>

<body>

<!-- TODO: Añadir estilos CSS -->

<?php 

$resultado = null;
if(!empty($_POST['submit'])){
    $servername = "localhost";
    $username = "root";
    $password = "";
    $bd_name = "GOODREADS";

    //Abrimos la conexión
    $conexion = new mysqli($servername,$username,$password,$bd_name);

    $user_name = $_POST['user_name'];
    $password = $_POST['password'];

    $camposNoVacios = strlen($user_name) > 0 && strlen($password) > 0;

    if($camposNoVacios){
        echo password_hash($password,PASSWORD_DEFAULT);
        $sqlQuery = "SELECT u.alias, u.email, u.password
                     FROM usuario u
                     WHERE u.alias = '$user_name'
                     OR u.email = '$user_name'
                     ;";

        //Recogemos los datos que haya podido devolver la query
        $resultado = $conexion->query($sqlQuery)->fetch_assoc();

      }else{
        echo "Todo los campos son obligatorios y no pueden estar vacíos";
      }
      $conexion->close();
    }

?>

    <!--Formulario de entrada de datos-->
    <div class="center">
        <h1>Login</h1>
        <form action="" method="post">
            <div class="inputbox">
                <!-- <span>nombre usuario</span> -->
                <input type="text" name="user_name" required="required" placeholder="nombre usuario">
            </div>
            <div class="inputbox">
                <!-- <span>Password</span> -->
                <input type="password" name="password" required="required" placeholder="password">
            </div>
            <div class="inputbox">
                <input type="submit" name="submit" value="Loguearse">
            </div>
        </form>
        <div class="resultados">
            <span>
                <?php 
                    if(isset($resultado)){
                      // Si la consulta ha devuelto el valor que buscamos (por tanto no está vacía) y
                      // la contraseña hasheada coincide con la contraseña introducida localmente
                      // mediante la función password_verify, entonces se le concede el acceso
                            if(password_verify($password,$resultado['password'])){
                              // Usamos sesiones, ya que ocultan en el navegador del cliente la información
                              // relativa a su usuario y contraseña, a diferencia de las cookies.
                                session_start();
                                $_SESSION['nombre_usuario'] = $resultado['alias'];
                                $_SESSION['password'] = $resultado['password'];
                                //Redireccionamos a home.php para mostrar los datos
                                header("Location: home.php");
                            }else{
                              echo "<span class='error-msg'>
                                    Error en el usuario/contraseña
                                  </span>";
                            }
                    }else{
                      //Mostramos error en el usuario/contraseña si la query no devuelve nada
                        if(!empty($_POST['submit']) && $resultado == null){
                            echo "<span class='error-msg'>
                                    Error en el usuario/contraseña
                                 </span>";
                        }
                    }
                ?>
            </span>
        </div>
    </div>
</body>

</html>