<html>
<head>
<link rel="stylesheet" type="text/css" href="table.css">
</head>

<body>
<?php 
$conexion = mysql_connect("localhost", "foro", "foro");
 mysql_select_db("sqli", $conexion);
 
$queEmp = "SELECT * FROM demos.articulos";

$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
$totEmp = mysql_num_rows($resEmp);

if ($totEmp> 0) {
echo '<div  class="table">';
echo '<table>';
echo "<tr><th>Artículo</th><th>Precio</th></tr>";
  while ($rowEmp = mysql_fetch_assoc($resEmp)) {
      echo "<tr><td> " .$rowEmp['Nombre']. "</td><td> ". $rowEmp['Precio']. "</td><td><form action=\"./comprar.php\" method=\"post\"><input type=\"hidden\" name=\"articulo\" value=\"".$rowEmp['Nombre']."\"><input type=\"hidden\" name=\"precio\" value=\"".$rowEmp['Precio']."\"><button type=\"submit\">Comprar</button></form></td></tr>";
   }
echo '</table>';
echo '</div>';
  }
 

 ?>

</form>
</form>
</body>

</html>
