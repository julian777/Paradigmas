<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.ModeloTwitter"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title></title>
        <script src="js/Chart.js"></script>
       
    </head>
    <% ModeloTwitter.crearInstancia(getServletContext().getInitParameter("URL_servidor"));%>
    <% String datosD = ModeloTwitter.getInstancia().getgUsuarios().datosGraficoSeisToJSON();%>

    <body onload="init()">
        <h1>Densidad de mensajes por hora </h1>
        <a href="Twitter.jsp">volver a menu Twitter</a>
        <br>
        <a href="pag8.jsp">ir a Grafico siguiente...</a>
        <input id="datosD" hidden name="datosD" type="text" value='<%=datosD%>'/>

        <div id="canvas-holder">
            <canvas id="chart-area2" width="600" height="300"></canvas>
        </div>
        
        <script src="js/histogramaDensidad.js"></script>
    </body>
</html>
