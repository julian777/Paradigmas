var matriz;

function initMiPastel() {

    var patron1 = "[";
    var patron2 = '"';
    var patron3 = "]";

    var datos = document.getElementById("pastell").value;
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

    cargarGraficoMiPastel();

}

function cargarGraficoMiPastel() {

    var cantidad = [];
    var tema = [];

    for (var i = 0; i < matriz.length; i++) {
        cantidad[i] = matriz[i][0];
        tema[i] = matriz[i][1];
    }

    var pieData2 = [{value: 40, color: "#0b82e7", highlight: "#0c62ab", label: "Chistes"},
        {
            value: 12,
            color: "#e3e860",
            highlight: "#a9ad47",
            label: "Politica"
        },
        {
            value: 2,
            color: "#eb5d82",
            highlight: "#b74865",
            label: "Religion"
        },
        {
            value: 98,
            color: "#5ae85a",
            highlight: "#42a642",
            label: "Futbol"
        },
        {
            value: 45,
            color: "#e965db",
            highlight: "#a6429b",
            label: "Desconocido"
        }
    ];

    var ctx3 = document.getElementById("chart-area6").getContext("2d");
    window.myPie = new Chart(ctx3).Pie(pieData2);
}