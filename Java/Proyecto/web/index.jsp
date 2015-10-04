<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.ModeloErlang"%>
<%@page import="Modelo.ModeloFacebook"%>
<%@page import="Modelo.ModeloTwitter"%>

<!DOCTYPE html>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Ejemplo Grafico</title>
        <script src="js/Chart.js"></script>
        <script type="text/javascript" src="js/scriptGrafico.js"></script>
    </head>

    <% ModeloTwitter.crearInstancia(getServletContext().getInitParameter("URL_servidor")); %>
    <% String datos = ModeloTwitter.getInstancia().getgUsuarios().datosGraficoUnoToJSON();%>

    <body onload="init()">       
        <h1>Grafico de barras</h1><br>
        <a href="pag1.jsp">ir a Grafico Pastel</a>
        <br>
        <a href="pag2.jsp">ir a Grafico de Lineas</a>
        <br>
        <a href="pag3.jsp">ir a Grafico de Dona</a>

        <input id="datos" hidden name="datos" type="text" value='<%=datos%>'/>

        <div id="canvas-holder">
            <canvas id="chart-area3" width="600" height="300"></canvas>
        </div>
        <script src="js/scriptGrafico.js"></script>
    </body>
    <html/>