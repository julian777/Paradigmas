<%-- 
    Document   : pag1
    Created on : 20-sep-2015, 11:01:07
    Author     : julian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Grafico de Lineas</title>
        <script src="js/Chart.js"></script>
    </head>
    <body>
        <h1>Grafico de lineas</h1><br>
<a href="index.jsp">ir a Grafico Barras</a>
<br>
<a href="pag1.jsp">ir a Grafico Pastel</a>
<br>
<a href="pag3.jsp">ir a Grafico Pastelillo</a>
        
        <div id="canvas-holder">
            <canvas id="chart-area4" width="600" height="300"></canvas>
        </div>
        <script src="js/histograma.js"></script>
    </body>
</html>
