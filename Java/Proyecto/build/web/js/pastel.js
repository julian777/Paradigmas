var matriz;

function init() {

    var patron1 = "[";
    var patron2 = '"';
    var patron3 = "]";

    var datos = document.getElementById("datosPastel").value;
    var datosJson = JSON.parse(datos);
        alert(datos);
    matriz = new Array(datosJson.length);

    for (var i = 0; i < datosJson.length; i++) {
        var str = JSON.stringify(datosJson[i]);
        var res = str.split(",");

        res[0] = res[0].replace(patron1, '');
        res[0] = res[0].replace(patron2, '');
        res[0] = res[0].replace(patron2, '');
        res[1] = res[1].replace(patron3, '');
        res[2] = res[2].replace(patron1, '');
        res[2] = res[2].replace(patron2, '');
        res[2] = res[2].replace(patron2, '');

        matriz[i] = new Array(3);

        matriz[i][0] = res[0];
        matriz[i][1] = res[1];
        matriz[i][2] = res[2];

    }

    cargarGrafico();

}

function cargarGrafico() {

    var hora = [];
    var cantidad_mensajes = [];
    var tema = [];

    for (var i = 0; i < matriz.length; i++) {
        hora[i] = matriz[i][0];
        cantidad_mensajes[i] = matriz[i][1];
        tema[i] = matriz[i][2];
    }
    


var pieData = [{value: 40, color: "#0b82e7", highlight: "#0c62ab", label: "Google Chrome"},
    {
        value: 16,
        color: "#e3e860",
        highlight: "#a9ad47",
        label: "Android"
    },
    {
        value: 11,
        color: "#eb5d82",
        highlight: "#b74865",
        label: "Firefox"
    },
    {
        value: 10,
        color: "#5ae85a",
        highlight: "#42a642",
        label: "Internet Explorer"
    },
    {
        value: 8.6,
        color: "#e965db",
        highlight: "#a6429b",
        label: "Safari"
    }
];

var ctx = document.getElementById("chart-area").getContext("2d");
window.myPie = new Chart(ctx).Pie(pieData);


}