<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.ModeloTwitter"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title></title>
        <script src="js/Chart.js"></script>
        <script type="text/javascript" src=""></script>
    </head>
    <% ModeloTwitter.crearInstancia(getServletContext().getInitParameter("URL_servidor"));%>
    
    <body onload="init()">
        <h1>Grafico Hastag mas utiizados por hora </h1>
        <a href="Twitter.jsp">volver a menu Twitter</a>
        <br>
        <a href="pag6.jsp">ir a Grafico siguiente...</a>
    </body>
</html>
