//(sin_Hastag,con_Hastag)


var matriz;

function init() {

    var patron1 = "[";
    var patron2 = '"';
    var patron3 = "]";

    var datos = document.getElementById("datos").value;
    var datosJson = JSON.parse(datos);
    alert(datosJson);
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

    var sinHastag = [];
    var conHastag = [];

    for (var i = 0; i < matriz.length; i++) {
        sinHastag[i] = matriz[i][0];
        conHastag[i] = matriz[i][1];
    }



    var pieData = [{value: sinHastag, color: "#0b82e7", highlight: "#0c62ab", label: "Sin Hashtag"},
        {
            value: conHastag,
            color: "#e965db",
            highlight: "#a6429b",
            label: "ConHastag"
        }
    ];

    var ctx2 = document.getElementById("chart-area2").getContext("2d");
    window.myPie = new Chart(ctx2).Doughnut(pieData);


}