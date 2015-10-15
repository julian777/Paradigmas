<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.ModeloTwitter"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Grafico de Lineas</title>
        <script src="js/Chart.js"></script>
        <script src="js/barrasFrecuencia.js"></script>
    </head>

    <% ModeloTwitter.crearInstancia(getServletContext().getInitParameter("URL_servidor"));%>
    <% String datosFrecuencia = ModeloTwitter.getInstancia().getgUsuarios().datosGraficoTresToJSON();%>

    <body onload="init()">
        <h1>Frecuencia de mensajes por hora independiente del tema</h1><br>

        <a href="Twitter.jsp">volver a menu Twitter</a>
        <br>
        <a href="pag4.jsp">ir a Grafico siguiente...</a>

        <input id="datosFrecuencia" hidden name="datosFrecuencia" type="text" value='<%=datosFrecuencia%>'/>

        <div id="canvas-holder">
            <canvas id="chart-area3" width="600" height="300"></canvas>
        </div>
        <script src="js/barrasFrecuencia.js"></script>
    </body>
</html>
