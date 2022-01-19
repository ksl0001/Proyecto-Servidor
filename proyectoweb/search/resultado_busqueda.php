<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado búsqueda</title>
    <style>
        .imagenes{
            float: left;
            width: 200px;
            height: 300px;
        }
    </style>
</head>
<body>
    <?php
        require_once '../clases/Libro.php';
    ?>

    <?php
        $libro = new Libro();

        //Obtenemos mediante GET la query que ha solicitado el usuario
        $resultado = $libro->obtenerLibro($_GET['q']);
          
        //Si existen resultados, mostramos
        if($resultado){
            $isbn = $resultado['isbn'];
            $portada = $resultado['portada'];
            echo "<a href='http://192.168.1.144/proyectoweb/libro/show/libro.php?isbn=$isbn'>$resultado[titulo]</a>";
            // Usad esto para copiar y pegar
            echo '<img class="imagenes" src="data:image/jpeg;base64,'.base64_encode( $portada ).' "/>';
        }else{
            echo "No hay resultados";
        }

    ?>
</body>
</html>