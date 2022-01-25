<?php
class Libro{
    // private $isbn;
    // private $titulo;
    // private $autor;
    // private $portada; //Aquí tengo algunas dudas
    // private $descripcion;
    // private $f_publicacion;
    private $conexion;

    function __construct(){
        $this->conexion = new mysqli("localhost","root","","myshelf");
    }

    public function obtenerLibro($isbn){
        $sqlQuery = "SELECT * FROM libro AS l WHERE l.isbn = '$isbn'";
        $resultado = $this->conexion->query($sqlQuery)->fetch_assoc();
        $this->conexion->close();
        return $resultado;
    }

    public function obtenerLibros(){
        $sqlQuery = "SELECT * FROM libro;";
        $resultado = $this->conexion->query($sqlQuery)->fetch_assoc();
        $this->conexion->close();
        return $resultado;
    }
 	    
}


?>

