
     <canvas id="chartcanvas"></canvas>

    <!-- javascript -->
    <script src="/chartj/js/jquery.min.js"></script>
    <script src="/chartj/js/Chart.min.js"></script>

    <script type="text/javascript">
      var ctxx = $("#chartcanvas");

      var chart = new Chart(ctxx,
       {
        type: "line",
        data: {
          labels: ["", "", "", "", "", "", "", "", "", "", ""],
          datasets: [
            {
              label: "TeamA score",
              data: [80, 80, 80, 80, 80,80,80, 80, 80, 80,80],
              backgroundColor: "blue",
              borderColor: "black",
              fill: false,
              lineTension: 0,
              pointRadius: 5,
            },

             {
              label: "TeamA score",
              data: [20, 20, 20, 20, 20,20, 20, 20, 20, 20,20],
              backgroundColor: "blue",
              borderColor: "black",
              fill: false,
              lineTension: 0,
              pointRadius: 5,
            },


            {
              label: "TeamB score",
              data: [0, 35, 40, 90, 50],
              backgroundColor: "green",
              borderColor: "lightgreen",
              fill: false,
              lineTension: 0,
              pointRadius: 5,
            },
          ],
          
        },
    
      });

     

    </script>
                
