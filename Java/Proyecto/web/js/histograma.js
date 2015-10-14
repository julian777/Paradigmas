var vector = [];
var vector1 = [];
var vector2 = [];
function init() {

    var patron1 = "[";
    var patron2 = '"';
    var patron3 = "]";

    var datos = document.getElementById("datos").value;
    var datosJson = JSON.parse(datos);
    loco = datosJson;
    for (var i = 0; i < datosJson.length; i++) {
        st = JSON.stringify(datosJson[i]);
        var res = st.split(",");
          
        res[0] = res[0].replace(patron1, '');
        res[0] = res[0].replace(patron2, '');
        res[0] = res[0].replace(patron2, '');
        res[2] = res[2].replace(patron3, '');
        alert(res[0]);
        vector1[i] = res[1];
        vector[i] = res[2]; 
        vector2[i] = res[0];

    }

    cargarGrafico();

}

function cargarGrafico() {

    var hora = [];
    var cantidad_mensajes = [];
    var tema = [];
    
    for (var i = 0; i < vector.length; i++) {
        
        tema[i] = vector[i];
        cantidad_mensajes[i] = vector1[i];
        f = vector2[i];
        var res = f.split(" ");
        hora[i]=res[0];
         
    }
    

    var lineChartData = {
        labels: tema,
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


    var ctx4 = document.getElementById("chart-area4").getContext("2d");
    window.myPie = new Chart(ctx4).Line(lineChartData, {responsive: true});
}