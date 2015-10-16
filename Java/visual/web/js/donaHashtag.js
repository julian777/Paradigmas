//(sin_Hastag,con_Hastag)


var matriz;

function initDona() {

    var patron1 = "[";
    var patron2 = '"';
    var patron3 = "]";

    var datos = document.getElementById("datosHashtag").value;
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

    cargarGraficoDona();

}

function cargarGraficoDona() {

    var sinHastag = [];
    var conHastag = [];

    for (var i = 0; i < matriz.length; i++) {
        sinHastag[i] = matriz[i][0];
        conHastag[i] = matriz[i][1];
    }
    var total = sinHastag * conHastag;
    var x = (sinHastag*100)/total;
    var y = (conHastag*100)/total;



    var pieData = [{value: Math.floor(x), color: "#0b82e7", highlight: "#0c62ab", label: "Sin Hashtag"},
        {
            value: Math.floor(y),
            color: "#e965db",
            highlight: "#a6429b",
            label: "ConHastag"
        }
    ];

    var ctx2 = document.getElementById("chart-area4").getContext("2d");
    window.myPie = new Chart(ctx2).Doughnut(pieData);


}