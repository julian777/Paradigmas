<%@page import="modelo.gestorMensaje.GestorFeedFacebook"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.ModeloFacebook"%>
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
        ModeloFacebook m4 = ModeloFacebook.crearInstancia(null);
        GestorFeedFacebook gft4 = m4.getgUsuarios();
        ModeloFacebook.crearInstancia(getServletContext().getInitParameter("URL_servidor"));

        String datosFrecuenciaF = ModeloFacebook.getInstancia().getgUsuarios().datosGraficoTresToJSON();
        String datosUsuarioF = ModeloFacebook.getInstancia().getgUsuarios().datosGraficoCincoToJSON();
        String datosAF = gft4.datosGraficoSieteToJSON();
        String cantidadf = gft4.datosGraficoNueveToJSONF();
        String datosAnimoF = ModeloFacebook.getInstancia().getgUsuarios().datosGraficoDiezToJSONF();
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
                        <h1 class="page-header">Facebook Graficos 2</h1>
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

                            <input id="datosFrecuenciaF" hidden name="datosFrecuenciaF" type="text" value='<%=datosFrecuenciaF%>'/>

                            <div class="panel-body">
                                <div class="row">

                                    <div id="canvas-holder">
                                        <canvas id="chart-area3F" width="600" height="300"></canvas>
                                    </div>
                                    <script src="../js/barraFrecuenciaF.js"></script>
                                    <script src="../js/Chart.js"></script>


                                </div>
                                <!-- /.row -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <input id="datosAF" hidden name="datosAF" type="text" value='<%=datosAF%>'/>
                        <div class="panel panel-default">
                            <div class="panel-heading">

                            </div>
                            <i class="fa fa-bar-chart-o fa-fw"></i> Hashtag y su cantidad de apariciones
                            <!-- /.panel-heading -->
                            <div id="canvas-holder">
                                <canvas id="chart-area8F" width="600" height="300"></canvas>
                            </div>
                            <script src="../js/histogramaAparicionesF.js" type="text/javascript"></script>
                            <script src="../js/Chart.js"></script>
                            <!-- /.panel-body -->
                        </div>


                        <!-- /.panel -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-bar-chart-o fa-fw"></i> Usuarios con más mensajes
                            </div>
                            <!-- /.panel-heading -->
                            <input id="datosUsuarioF" hidden name="datosUsuarioF" type="text" value='<%=datosUsuarioF%>'/>

                            <div class="panel-body">
                                <div class="row">

                                    <div id="canvas-holder">
                                        <canvas id="chart-area6F" width="600" height="300"></canvas>
                                    </div>
                                    <script src="../js/usuarioBarrasF.js"></script>
                                    <script src="../js/Chart.js"></script>


                                </div>
                                <!-- /.row -->
                            </div>
                            <!-- /.panel-body -->
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-bar-chart-o fa-fw"></i> Grafico de Pastel
                            </div>
                            <input id="cantidadF" hidden name="cantidadF" type="text" value='<%=cantidadf%>'/>
                            <div class="panel-body">
                                <div class="row">
                                    <div id="canvas-holder">
                                        <canvas id="chart-area11F" width="600" height="300"></canvas>
                                    </div>
                                    <script src="../js/pastel2F.js" type="text/javascript"></script>
                                </div>
                            </div>
                        </div>


                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-bar-chart-o fa-fw"></i> Estado Animo Facebook
                            </div>
                            <input id="animoF" hidden name="animoF" type="text" value='<%=datosAnimoF%>'/>
                            <div class="panel-body">
                                <div class="row">
                                    <div id="canvas-holder">
                                        <canvas id="chart-area10F" width="600" height="300"></canvas>
                                    </div>
                                    <script src="../js/pastelilloF.js" type="text/javascript"></script>
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
        initFrecuenF();
        initAparicioF();
        initUsuarioF();
        initMiCantidadF();
        initAnimoF();

    </script>
    <script src="../js/barraFrecuenciaF.js"></script>
    <script src="../js/histogramaAparicionesF.js"></script>    
    <script src="../js/usuarioBarrasF.js"></script>
    <script src="../js/pastel2F.js" type="text/javascript"></script>
    <script src="../js/pastelilloF.js" type="text/javascript"></script>


    <script src="../js/Chart.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>