var matriz;

function initDensoF() {

    var patron1 = "[";
    var patron2 = '"';
    var patron3 = "]";

    var datos = document.getElementById("datosDF").value;
    var datosJson = JSON.parse(datos);

    matriz = new Array(datosJson.length);
    for (var i = 0; i < datosJson.length; i++) {
        var str = JSON.stringify(datosJson[i]);
        var res = str.split(",");
     
        res[0] = res[0].replace(patron1, '');
        res[2] = res[2].replace(patron2, "'");
        res[2] = res[2].replace(patron2, "'");
        res[2] = res[2].replace(patron3, '');

        matriz[i] = new Array(3);

        matriz[i][0] = res[0];
        matriz[i][1] = res[1];
        matriz[i][2] = res[2];

    }

    cargarGraficoDensoF();

}

function cargarGraficoDensoF() {

    var hora = [];
    var cantidad_mensajes = [];
    var medio = [];
    for (var i = 0; i < matriz.length; i++) {
        hora[i] = matriz[i][0];
        cantidad_mensajes[i] = matriz[i][1];
        medio[i] = matriz[i][2]; 
    }

    var barChartData = {
        labels: medio,
        datasets: [
            {
                label: "Primera serie de datos",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "#6b9dfa",
                pointColor: "#1e45d7",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: cantidad_mensajes
            },
            {
                label: "Segunda serie de datos",
                fillColor: "rgba(151,187,205,0.2)",
                strokeColor: "#e9e225",
                pointColor: "#faab12",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(151,187,205,1)",
                data: hora
            }
        ]

    }

    var ctx3 = document.getElementById("chart-area7F").getContext("2d");
    window.myPie = new Chart(ctx3).Line(barChartData, {responsive: true});
}    