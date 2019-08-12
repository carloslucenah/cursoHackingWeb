<html>
<head>
<link rel="stylesheet" type="text/css" href="table.css">
</head>

<body>
<?php 
if (isset($_POST["articulo"]))
 {
echo 'Comprado el artículo: ' . $_POST["articulo"] . ' con precio: ' . $_POST["precio"] ;
}

 ?>
</body>

</html>
