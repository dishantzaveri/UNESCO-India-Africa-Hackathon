$(document).ready(function () {
  //get canvas
  var ctx = $("#line-chartcanvas");


  var options = {
    title: {
      display: true,
      position: "top",
      text: "Line Graphh",
      fontSize: 18,
      fontColor: "#111",
    },
    legend: {
      display: true,
      position: "bottom",
    },
  };

  var chart = new Chart(ctx, {
    type: "line",
    data: data,
    options: options,
  });
});
