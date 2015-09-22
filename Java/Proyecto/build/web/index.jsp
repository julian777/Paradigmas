<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Ejemplo Grafico</title>
<script src="js/Chart.js"></script>
</head>
<body>  	  
<h1>Grafico de barras</h1><br>

<a href="pag1.jsp">ir a Grafico Pastel</a>
<br>
<a href="pag2.jsp">ir a Grafico de Lineas</a>
<br>
<a href="pag3.jsp">ir a Grafico Pastelillo</a>

<div id="canvas-holder">
<canvas id="chart-area3" width="600" height="300"></canvas>
</div>
<script src="js/barras.js"></script>
</body>
</html>