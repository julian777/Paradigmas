<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.ModeloTwitter"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Grafico de Lineas</title>
        <script src="js/Chart.js"></script>
        <script type="text/javascript" src="js/scriptGrafico.js"></script>
    </head>
    
    <% ModeloTwitter.crearInstancia(getServletContext().getInitParameter("URL_servidor"));%>
    <% String datos = ModeloTwitter.getInstancia().getgUsuarios().datosGraficoTresToJSON();%>

    <body onload="init()">
        <h1>Frecuencia de mensajes por hora independiente del tema</h1><br>

        <a href="Twitter.jsp">volver a menu Twitter</a>
        <br>
        <a href="pag4.jsp">ir a Grafico siguiente...</a>

        <input id="datos" hidden name="datos" type="text" value='<%=datos%>'/>

        <div id="canvas-holder">
            <canvas id="chart-area3" width="600" height="300"></canvas>
        </div>
        <script src="js/scriptGrafico.js"></script>
    </body>
</html>
