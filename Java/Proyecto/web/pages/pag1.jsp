<%@page import="modelo.gestorMensaje.GestorFeedTwitter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.ModeloTwitter"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <script src="js/barras.js"></script>
        <script src="js/Chart.js"></script>

        <title>ParseadorTwitterFacebook</title>

        <!-- Bootstrap Core CSS -->
        <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="../dist/css/timeline.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="../bower_components/morrisjs/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <%
        ModeloTwitter m1 = ModeloTwitter.crearInstancia(null);
        GestorFeedTwitter gft2 = m1.getgUsuarios();
        ModeloTwitter.crearInstancia(getServletContext().getInitParameter("URL_servidor"));

        String datosFrecuencia = ModeloTwitter.getInstancia().getgUsuarios().datosGraficoTresToJSON();
        String datosUsuario = ModeloTwitter.getInstancia().getgUsuarios().datosGraficoCincoToJSON();
        String datosA = gft2.datosGraficoSieteToJSON();
        String cantidad = gft2.datosGraficoNueveToJSON();
        String datosAnimo = ModeloTwitter.getInstancia().getgUsuarios().datosGraficoDiezToJSON();
    %>

    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Parseador</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">Parseador Twitter&Facebook</a>
                </div>

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">

                            <li>
                                <a href="index.jsp"><i class="fa fa-dashboard fa-fw"></i> Inicio</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Graficos<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="index.jsp">Twitter Graficos 1<span class="fa arrow"></span></a>

                                    </li>
                                    <li>
                                        <a href="pag1.jsp">Twitter Graficos 2<span class="fa arrow"></span></a>

                                    </li>
                                    <li>
                                        <a href="pag2.jsp">Facebook Grafico 1<span class="fa arrow"></span></a>
                                        <!-- /.nav-second-level -->
                                    </li>
                                    <li>
                                        <a href="pag3.jsp">Facebook Grafico 2<span class="fa arrow"></span></a>
                                        <!-- /.nav-second-level -->
                                    </li>
                                    <li>
                                        <!-- /.nav-third-level -->
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Twitter Graficos 2</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>

                <div class="row">



                    <div class="col-lg-8">



                        <!-- /.panel -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-bar-chart-o fa-fw"></i> Frecuencia de mensajes por hora independiente del tema
                            </div>
                            <!-- /.panel-heading -->

                            <input id="datosFrecuencia" hidden name="datosFrecuencia" type="text" value='<%=datosFrecuencia%>'/>

                            <div class="panel-body">
                                <div class="row">

                                    <div id="canvas-holder">
                                        <canvas id="chart-area3" width="600" height="300"></canvas>
                                    </div>
                                    <script src="../js/barrasFrecuencia.js"></script>
                                    <script src="../js/Chart.js"></script>


                                </div>
                                <!-- /.row -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <input id="datosA" hidden name="datosA" type="text" value='<%=datosA%>'/>
                        <div class="panel panel-default">
                            <div class="panel-heading">

                            </div>
                            <i class="fa fa-bar-chart-o fa-fw"></i> Hashtag y su cantidad de apariciones
                            <!-- /.panel-heading -->
                            <div id="canvas-holder">
                                <canvas id="chart-area8" width="600" height="300"></canvas>
                            </div>
                            <script src="../js/histogramaApariciones.js" type="text/javascript"></script>
                            <script src="../js/Chart.js"></script>
                            <!-- /.panel-body -->
                        </div>


                        <!-- /.panel -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-bar-chart-o fa-fw"></i> Usuarios con más mensajes
                            </div>
                            <!-- /.panel-heading -->
                            <input id="datosUsuario" hidden name="datosUsuario" type="text" value='<%=datosUsuario%>'/>

                            <div class="panel-body">
                                <div class="row">

                                    <div id="canvas-holder">
                                        <canvas id="chart-area6" width="600" height="300"></canvas>
                                    </div>
                                    <script src="../js/usuarioBarras.js"></script>
                                    <script src="../js/Chart.js"></script>


                                </div>
                                <!-- /.row -->
                            </div>
                            <!-- /.panel-body -->
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-bar-chart-o fa-fw"></i> Cantidad de mensajes por lugar
                            </div>
                            <input id="cantidad" hidden name="cantidad" type="text" value='<%=cantidad%>'/>
                            <div class="panel-body">
                                <div class="row">
                                    <div id="canvas-holder">
                                        <canvas id="chart-area11" width="600" height="300"></canvas>
                                    </div>
                                    <script src="../js/pastel.js" type="text/javascript"></script>
                                </div>
                            </div>
                        </div>


                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-bar-chart-o fa-fw"></i> Estado de Animo Twitter
                            </div>
                            <input id="animo" hidden name="animo" type="text" value='<%=datosAnimo%>'/>
                            <div class="panel-body">
                                <div class="row">
                                    <div id="canvas-holder">
                                        <canvas id="chart-area10" width="600" height="300"></canvas>
                                    </div>
                                    <script src="../js/pastelillo.js" type="text/javascript"></script>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.col-lg-8 -->





                </div>
                <!-- cccccccccccccccccccccccccccccccccccccccccccccccccccccccccc4 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../bower_components/raphael/raphael-min.js"></script>
    <script src="../bower_components/morrisjs/morris.min.js"></script>
    <!--
   <script src="../js/morris-data.js"></script>
   <script src="../js/barras.js"></script>
   <script src="../js/barras2.js"></script>
   <script src="../js/barras3.js"></script>
   <script src="../js/histograma.js"></script>
   <script src="../js/histograma1.js"></script>
   <script src="../js/histograma2.js"></script>
   <script src="../js/histograma3.js"></script>
   <script src="../js/pastel.js"></script>
   <script src="../js/pastel2.js"></script>
   <script src="../js/pastelillo.js"></script>
   <script src="../js/pastelillo2.js"></script>
    -->
    <script>
        initFrecuen();
        initAparicio();
        initUsuario();
        initMiCantidad();
        initAnimo();
        alert("jja");
    </script>
    <script src="../js/barrasFrecuencia.js"></script>
    <script src="../js/donaHashtag.js"></script>
    <script src="../js/usuarioBarras.js"></script>
    <script src="../js/Chart.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
    <script src="../js/pastel.js" type="text/javascript"></script>
</body>