<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.ModeloTwitter"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Grafico de Dona</title>
        <script src="js/Chart.js"></script>
    </head>
    <% ModeloTwitter.crearInstancia(getServletContext().getInitParameter("URL_servidor")); %>
    <% String datosHashtag = ModeloTwitter.getInstancia().getgUsuarios().datosGraficoCuatroToJSON();%>
    <body onload="init()">
        <h1>Cantidad de mensajes con Hashtag y sin Hashtag</h1><br>
        <a href="Twitter.jsp">volver a menu Twitter</a>
        <br>
        <a href="pag5.jsp">ir a Grafico siguiente...</a>


        <input id="datosHashtag" hidden name="datosHashtag" type="text" value='<%=datosHashtag%>'/>

        <div id="canvas-holder">
            <canvas id="chart-area4" width="600" height="300"></canvas>
        </div>
        <script src="js/donaHashtag.js"></script>
    </body>
</html>