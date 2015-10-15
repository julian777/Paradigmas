var vector = [];
var vector1 = [];
var vector2 = [];
function init() {

    var patron1 = "[";
    var patron2 = '"';
    var patron3 = "]";

    var datos = document.getElementById("datosA").value;
    var datosJson = JSON.parse(datos);
    loco = datosJson;
    for (var i = 0; i < datosJson.length; i++) {
        st = JSON.stringify(datosJson[i]);
        var res = st.split(",");
        
          
        res[0] = res[0].replace(patron1, '');
        res[0] = res[0].replace(patron2, '');
        res[0] = res[0].replace(patron2, '');
        res[1] = res[1].replace(patron3, '');
 
        vector1[i] = res[1];
        vector2[i] = res[0];

    }

    cargarGrafico();

}

function cargarGrafico() {

    var mensaje = [];
    var cantidad_mensajes = [];
    
    for (var i = 0; i < vector1.length; i++) {
        
        cantidad_mensajes[i] = vector1[i];
        mensaje[i] = vector2[i];

         
    }
    

    var lineChartData = {
        labels: mensaje,
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
            }
        ]

    }


    var ctx4 = document.getElementById("chart-area8").getContext("2d");
    window.myPie = new Chart(ctx4).Line(lineChartData, {responsive: true});
}