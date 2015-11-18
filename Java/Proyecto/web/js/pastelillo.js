var matriz;

function initAnimo() {

    var patron1 = "[";
    var patron2 = '"';
    var patron3 = "]";

    var datos = document.getElementById("animo").value;
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

    cargarGraficoAnimo();

}

function cargarGraficoAnimo() {

    var sinHastag = 0;
    var conHastag = 0;

    for (var i = 0; i < matriz.length; i++) {
        sinHastag = Number(matriz[i][0]);
        conHastag = Number(matriz[i][1]);
    }
    var total = sinHastag + conHastag;
    var x = (sinHastag*100)/total;
    var y = (conHastag*100)/total;



    var pieData = [{value: Math.floor(x), color: "#0b82e7", highlight: "#0c62ab", label: "Negatividad"},
        {
            value: Math.floor(y),
            color: "#e965db",
            highlight: "#a6429b",
            label: "Positivismo"
        }
    ];

var ctx2 = document.getElementById("chart-area10").getContext("2d");
window.myPie = new Chart(ctx2).Doughnut(pieData);

}



