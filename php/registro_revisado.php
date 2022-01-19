<!-- Autor: Manuel Santiago Vázquez Del Pino -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
</head>

<style>

/* TODO: Añadir CSS */

</style>

<body>
<?php

  if(!empty($_POST['submit'])){
    $servername = "localhost";
    $username = "root";
    $password = "";
    $bd_name = "myshelf";

    $conexion = new mysqli($servername,$username,$password,$bd_name);

    $alias = $_POST['alias'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'],PASSWORD_DEFAULT);
    $nombre = $_POST['nombre'];
    $apellidos = $_POST['apellidos'];
    // Comprobamos que los campos no estén vacíos (en este caso, en realidad, se comprueba desde el cliente, pero no está de más tener las condiciones preparadas en caso de que se modificase)
    $camposNoVacios = strlen($alias) > 0 && strlen($email) > 0 && strlen($password) > 0 && strlen($nombre) > 0 && strlen($apellidos) > 0;
    
    if($camposNoVacios){
      $sqlQuery = "INSERT INTO `usuario` (`email`, `alias`, `password`, `nombre`, `apellidos`) VALUES ('$email', '$alias', '$password', '$nombre', '$apellidos');";
    }else{
      echo "Todo los campos son obligatorios y no pueden estar vacíos";
    }
  }
?>
    <div class="center">
        <h1>Registro</h1>
        <form action="" method="post">
            <div class="inputbox">
                <input type="text" name="nombre" required="required">
                <span>Nombre</span>
            </div>
            <div class="inputbox">
                <input type="text" name="apellidos" required="required">
                <span>Apellidos</span>
            </div>
            <div class="inputbox">
                <input type="text" name="alias" required="required">
                <span>Nombre usuario</span>
            </div>
            <div class="inputbox">
                <input type="email" name="email" required="required">
                <span>Email</span>
            </div>
            <div class="inputbox">
                <input type="password" name="password" required="required">
                <span>Password</span>
            </div>
            <div class="inputbox">
                <input type="submit" name="submit" value="Registrarse">
            </div>
        </form>
        <?php
      if(isset($conexion)){
        //Ejecutamos la query
        if($conexion->query($sqlQuery)){
          echo "<span>Usuario creado con éxito!</span>";
        //TODO: Redireccionar 
        }
        //Cerramos la conexión
        $conexion->close();
      }
    ?>
    </div>
</body>

</html>