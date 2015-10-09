<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.ModeloTwitter"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Grafico de Pastelillo</title>
        <script src="js/Chart.js"></script>
    </head>
    <% ModeloTwitter.crearInstancia(getServletContext().getInitParameter("URL_servidor")); %>
    <% String datos = ModeloTwitter.getInstancia().getgUsuarios().datosGraficoCuatroToJSON();%>
    <body onload="init()">
        <h1>Cantidad de mensajes con Hashtag y sin Hashtag</h1><br>
        <a href="Twitter.jsp">volver a menu Twitter</a>
        <br>
        <a href="pag5.jsp">ir a Grafico siguiente...</a>


        <input id="datos" hidden name="datos" type="text" value='<%=datos%>'/>

        <div id="canvas-holder">
            <canvas id="chart-area2" width="600" height="300"></canvas>
        </div>
        <script src="js/pastelillo.js"></script>
    </body>
</html>