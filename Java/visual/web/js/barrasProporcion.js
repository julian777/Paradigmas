var matriz;
var b = 0, c = 0, d = 0, e = 0;
var t2 = " ",t3 = " ",t4 = " ",t5 = " ";

var numero = 0;


function initProporcion() {

    var patron1 = "[";
    var patron2 = '"';
    var patron3 = "]";

    var datos = document.getElementById("datosProporcion").value;
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

    cargarGraficoProporcion();

}

function cargarGraficoProporcion() {
var a;
var tema = [];
var cantidad_mensajes = [];
var t1 = " ";

    for (var i = 0; i < matriz.length; i++) {
        cantidad_mensajes[i] = matriz[i][0];
        tema[i] = matriz[i][1];
        if(i==0){a= cantidad_mensajes[i];};
    }

var barChartData = {
    labels: tema,
    datasets: [
        {
            fillColor: "#e9e225",
            strokeColor: "#ffffff",
            highlightFill: "#ee7f49",
            highlightStroke: "#ffffff",
            data: cantidad_mensajes
        }
    ]

}

var ctx = document.getElementById("chart-area2").getContext("2d");
window.myPie = new Chart(ctx).Bar(barChartData, {responsive: true});

}