//(hora,cantidad_mensajes,tema)

var matriz;

function init() {

    var patron1 = "[";
    var patron2 = '"';
    var patron3 = "]";

    var datos = document.getElementById("datos").value;
    var datosJson = JSON.parse(datos);

    matriz = new Array(datosJson.length);
    
    cargarGrafico();

}

function cargarGrafico() {
    
    var hora = [];
    var cantidad_mensajes = [];
    var tema = [];
    
    for(var i = 0; i<matriz.length; i++){
    }
    
    var barChartData = {
        labels: paises,
        datasets: [
            {
                fillColor: "#6b9dfa",
                strokeColor: "#ffffff",
                highlightFill: "#1864f2",
                highlightStroke: "#ffffff",
                data: hora
            }
        ]

    }
}

    var ctx3 = document.getElementById("chart-area3").getContext("2d");
    window.myPie = new Chart(ctx3).Bar(barChartData, {responsive: true});
    