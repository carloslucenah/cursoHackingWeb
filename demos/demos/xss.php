<html>
<head></head>

<body>
<form action="xss.php" method="get">
Introduce Nombre<input type="text" name="nombre">
<input type="submit">

<?php 
if (isset($_GET["nombre"]))
 echo "Hola ".$_GET["nombre"]; ?>

</form>
</body>

</html>