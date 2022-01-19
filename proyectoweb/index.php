<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <!-- Llamamos mediante el action al archivo donde se encuentre el archivo php encargado de gestionar la query -->
    <form action="search/resultado_busqueda.php" method="get">
        <input type="text" name="q" id="" placeholder="buscador">
        <input type="submit" value="Enviar">
    </form>
</body>
</html>