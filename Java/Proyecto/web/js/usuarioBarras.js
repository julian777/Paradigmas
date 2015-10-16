 //devuelve (usuario,cantidad), una muestra de 10
var matriz;

function initUsuario() {

    var patron1 = "[";
    var patron2 = '"';
    var patron3 = "]";

    var datos = document.getElementById("datosUsuario").value;
    var datosJson = JSON.parse(datos);

    matriz = new Array(datosJson.length);
    for (var i = 0; i < datosJson.length; i++) {
        var str = JSON.stringify(datosJson[i]);
        var res = str.split(",");

        res[0] = res[0].replace(patron1, '');
        res[1] = res[1].replace(patron3, '');

        matriz[i] = new Array(2);

        matriz[i][0] = res[0];
        matriz[i][1] = res[1];

    }

    cargarGraficoUsuario();

}

function cargarGraficoUsuario() {

    var IDusuario = [];
    var cantidad_mensajes = [];

    for (var i = 0; i < 10; i++) {
        IDusuario[i] = matriz[i][0];
        cantidad_mensajes[i] = matriz[i][1];
    }
    

    var barChartData = {
        labels: IDusuario,
        datasets: [
            {
                    fillColor: "#FF0000",
                strokeColor: "#ffffff",
                highlightFill: "#1864f2",
                highlightStroke: "#ffffff",
                data: cantidad_mensajes
            }
        ]

    }

    var ctx3 = document.getElementById("chart-area6").getContext("2d");
    window.myPie = new Chart(ctx3).Bar(barChartData, {responsive: true});
}    