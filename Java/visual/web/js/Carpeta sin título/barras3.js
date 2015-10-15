var barChartData3 = {
    labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio"],
    datasets: [
        {
            fillColor: "#6b9dfa",
            strokeColor: "#ffffff",
            highlightFill: "#1864f2",
            highlightStroke: "#ffffff",
            data: [90, 30, 10, 80, 15, 5, 15]
        },
        {
            fillColor: "#e9e225",
            strokeColor: "#ffffff",
            highlightFill: "#ee7f49",
            highlightStroke: "#ffffff",
            data: [40, 50, 70, 40, 85, 55, 15]
        }
    ]

}

var ctx9 = document.getElementById("chart-area66").getContext("2d");
window.myPie = new Chart(ctx9).Bar(barChartData3, {responsive: true});
