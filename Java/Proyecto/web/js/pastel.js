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

var ctx = document.getElementById("chart-area11").getContext("2d");
window.myPie = new Chart(ctx).Pie(pieData);




