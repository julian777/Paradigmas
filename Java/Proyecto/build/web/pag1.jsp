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
        <title>Grafico Pastel</title>
        <script src="js/Chart.js"></script>
    </head>
    <body>
        <h1>Grafico de Pastel</h1><br>
<a href="index.jsp">ir a Grafico Barras</a>
<br>
<a href="pag2.jsp">ir a Grafico de Lineas</a>
<br>
<a href="pag3.jsp">ir a Grafico Pastelillo</a>

        <div id="canvas-holder">
            <canvas id="chart-area" width="600" height="300"></canvas>
        </div>
        <script src="js/pastel.js"></script>
    </body>
</html>
