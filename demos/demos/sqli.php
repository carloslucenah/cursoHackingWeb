<html>
<head></head>
<body>
<form action="sqli.php" method="get">
Login: <input type="text" name="user">
Pass: <input type="text" name="pass">
<input type="submit">

<?php 
if (isset($_GET["user"]))
 {
 $conexion = mysql_connect("localhost", "foro", "foro");
 mysql_select_db("sqli", $conexion);
 
$queEmp = "SELECT * FROM demos.usuarios where user ='".$_GET["user"]."' and pass='".$_GET["pass"]."'";
$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
$totEmp = mysql_num_rows($resEmp);

if ($totEmp> 0) {
   $rowEmp = mysql_fetch_assoc($resEmp);
   $usuario=$rowEmp['User'];
   session_id($usuario);
   session_start();
   $_SESSION['username'] = $usuario;
   echo "<br></br>";
   echo "El usuario es: ".$usuario;
   echo "<br></br>";
   echo "<a href='sqliDatos.php'>Ver datos</a>";
   
  }
else{
	echo "Usuario o password incorrecto";
}

 }?>
</form>
</body>
</html>