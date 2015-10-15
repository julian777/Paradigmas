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
     <% String datosUsuario = ModeloTwitter.getInstancia().getgUsuarios().datosGraficoCincoToJSON();%>
    <body onload="init()">
        <h1>Usuarios con más mensajes</h1>
        <a href="Twitter.jsp">volver a menu Twitter</a>
        <br>
        <a href="pag7.jsp">ir a Grafico siguiente...</a>
        
                <input id="datosUsuario" hidden name="datosUsuario" type="text" value='<%=datosUsuario%>'/>

        <div id="canvas-holder">
            <canvas id="chart-area6" width="600" height="300"></canvas>
        </div>
                <script src="js/usuarioBarras.js"></script>
    </body>
</html>
