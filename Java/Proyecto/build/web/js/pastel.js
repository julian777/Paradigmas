var matriz;
var b = 0, c = 0, d = 0, e = 0;
var t2 = " ",t3 = " ",t4 = " ",t5 = " ";

var numero = 0;


function init() {

    var patron1 = "[";
    var patron2 = '"';
    var patron3 = "]";

    var datos = document.getElementById("datosPastel").value;
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
var a;
var tema = [];
var cantidad_mensajes = [];
var t1 = " ";

    for (var i = 0; i < matriz.length; i++) {
        cantidad_mensajes[i] = matriz[i][0];
        tema[i] = matriz[i][1];
        if(i==0){a= cantidad_mensajes[i];};
    }



var pieData = [{value: 40, color: "#0b82e7", highlight: "#0c62ab", label: "Google Chrome"},
    {
        
        value: a,
        color: "#e3e860",
        highlight: "#a9ad47",
        label: "Android"
    },
    {
        value: 11,
        color: "#eb5d82",
        highlight: "#b74865",
        label: t1
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