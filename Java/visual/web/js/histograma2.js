var lineChartData2 = {
    labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio"],
    datasets: [
        {
            label: "Primera serie de datos",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "#6b9dfa",
            pointColor: "#1e45d7",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [90, 30, 10, 80, 15, 5, 15]
        },
        {
            label: "Segunda serie de datos",
            fillColor: "rgba(151,187,205,0.2)",
            strokeColor: "#e9e225",
            pointColor: "#faab12",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [40, 50, 70, 40, 85, 55, 15]
        }
    ]

}


var ctx5 = document.getElementById("chart-area5").getContext("2d");
window.myPie = new Chart(ctx5).Line(lineChartData2, {responsive: true});