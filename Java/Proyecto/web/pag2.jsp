<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.ModeloTwitter"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Grafico Pastel</title>
        <script src="js/Chart.js"></script>
        <script type="text/javascript" src="js/barrasProporcion.js"></script>
    </head>

    <% ModeloTwitter.crearInstancia(getServletContext().getInitParameter("URL_servidor")); %>
    <% String datosProporcion = ModeloTwitter.getInstancia().getgUsuarios().datosGraficoDosToJSON();%>
    
    

    <body onload="init()">
        
        <h1>Proporciones de cada tema </h1><br>
        
        <a href="Twitter.jsp">volver a menu Twitter</a>
        <br>
        <a href="pag3.jsp">ir a Grafico siguiente...</a>
        
        <input id="datosProporcion" hidden name="datosProporcion" type="text" value='<%=datosProporcion%>'/>

        <div id="canvas-holder">
            <canvas id="chart-area" width="600" height="300"></canvas>
        </div>
        <script src="js/pastel.js"></script>
        
    </body>
</html>