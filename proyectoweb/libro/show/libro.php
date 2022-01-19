<?php

    require_once '../../clases/Libro.php';

    $libro = new Libro();
    // Definimos el tipo de datos con los que vamos a tratar (en este caso, json para futuro mantenimiento y mostrar o gestionar datos)
    header("Content-Type: application/json");
    //Procesamos el tipo de petición (GET,POST,PUT,DELETE,UPDATE ...)
    switch ($_SERVER['REQUEST_METHOD']) {
        case 'GET':
            //Comprobamos si en la url existe el parámetro isbn
            if(isset($_GET['isbn'])){
                //Obtenemos el valor del parámetro del isbn
                $isbn = $_GET['isbn'];
                //Obtenemos el resultado de buscar ese libro por isbn
                $resultado = $libro->obtenerLibro($isbn);
                //Imprimimos lo que haya
                echo $resultado['titulo']." ". $resultado['autor'];

            }else {
                $libros = $libro->obtenerLibros();;
                $res = "";
                foreach ($libros as $key => $value) {
                    $res .= $value. " ";
                }
                echo $res;

            }
            break;
        
        default:
            # code...
            break;
    }

?>