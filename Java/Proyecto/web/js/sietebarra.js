var matriz;

function init() {

    var patron1 = "[";
    var patron2 = '"';
    var patron3 = "]";

    var datos = document.getElementById("datosD").value;
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

    cargarGrafico();

}

function cargarGrafico() {

    var hora = [];
    var cantidad_mensajes = [];

    for (var i = 0; i < matriz.length; i++) {
        hora[i] = matriz[i][0];
        cantidad_mensajes[i] = matriz[i][1];
    }
    

    var barChartData = {
        labels: hora,
        datasets: [
            {
                fillColor: "#6b9dfa",
                strokeColor:  "#ffffff",
                highlightFill: "#1864f2",
                highlightStroke: "#ffffff",
                data: cantidad_mensajes
            }
        ]

    }

    var ctx3 = document.getElementById("chart-area2").getContext("2d");
    window.myPie = new Chart(ctx3).Bar(barChartData, {responsive: true});
}    