<?php

//include("includes/db.php");

?>
<!DOCTYPE html>
<html lang="en">
  <head>
       <style>
      * {
        margin: 0;
        padding: 0;
        font-family: sans-serif;
      }
      .chartMenu {
        width: 100vw;
        height: 40px;
        background: #1A1A1A;
        color: rgba(255, 26, 104, 1);
      }
      .chartMenu p {
        padding: 10px;
        font-size: 20px;
      }
      /* .chartCard {
        width: 100vw;
        height: calc(100vh - 40px);
        background: white;
        display: flex;
        align-items: center;
        justify-content: center;
      } */
      .chartBox {
        width: 1oo%;
        padding: 20px;
        border-radius: 20px;
        border: solid 3px rgba(255, 26, 104, 1);
        background: white;
      }
    </style>
  </head>

<?php //include 'includes/header.php'?>
 <!-- General CSS Files -->
  <link rel="stylesheet" href="assets/css/app.min.css">
  <!-- Template CSS -->
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/components.css">
  <!-- Custom style CSS -->
  <link rel="stylesheet" href="assets/css/custom.css">
  <link rel='shortcut icon' type='image/x-icon' href='assets/img/favicon.ico' />

  <!-- General CSS Files -->
  <link rel="stylesheet" href="assets/css/app.min.css">
  <link rel="stylesheet" href="assets/bundles/datatables/datatables.min.css">
  <link rel="stylesheet" href="assets/bundles/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="assets/bundles/datatables/Select-1.2.4/css/select.bootstrap4.min.css">
  <!-- Template CSS -->
<body>
<?php include 'includes/sidebar.php'?>


      <!-- Main Content -->
      <div class="main-content">

      <?php include 'includes/topnav.php'?>

      <!-- Paste Your Code Here -->
       <section class="section">
          <div class="section-body">
              <div class="col-12 col-md-6 col-lg-12 ">
                <div class="card">
                <form method="POST">
                    <div class="card-header">
                      <h1>Patient Details</h1>
                    </div>
                    <div class="card-body">
                    <div class="form-group">
                   


                      <div class="form-row">
                            <div class="form-group col-md-2">
                            <label>Full Name</label>
                           <input type="text" name= "a"class="form-control" required="">
                            </div>
                            
                            <div class="form-group col-md-6">
                              <label>Gravida</label>
                              <input type="text" name="itemname" class="form-control" required="">
                            </div>
                           
                            <div class="form-group col-md-4">
                              <label>Para</label>
                              <input type="text" name="unitname" class="form-control" required="">
                            </div>


                          </div>

                           <div class="form-row">
                            <div class="form-group col-md-2">
                            <label>Hospital Number</label>
                           <input type="text" name= "code"class="form-control" required="">
                            </div>
                            
                            <div class="form-group col-md-6">
                              <label for="inputEmail4">Date</label>
                              <input type="date" name="date" class="form-control" id="inputEmail4" placeholder="Email">
                           </div>
                           
                           
                            <div class="form-group col-md-4">
                               <label for="inputEmail4">Time for admission</label>
                              <input type="time" name="date" class="form-control" id="inputEmail4" placeholder="Email">
                            </div>

                             <div class="form-group col-md-6">
                              <label>Raptured membranes</label>
                              <input type="text" name="itemname" class="form-control"placeholder="Hours">
                            </div>

                          </div>


                            <!-- <button name="submit">submit</button> -->
         
</form>
<?php
if(isset($_POST['submit'])){
	  
//text data variables
$a=$_POST['a'];


}
    	


?>
</div>
</div>


<!-- /////////////////////// -->


 <!-- //////////////////// -->

     <!-- <canvas id="chartcanvas"></canvas> -->

    <!-- javascript -->
    <!-- <script src="/chartj/js/jquery.min.js"></script>
    <script src="/chartj/js/Chart.min.js"></script>

    <script type="text/javascript">
      var ctx = $("#chartcanvas");


      var a = 10;

      var chart = new Chart(ctx, {
        type: "line",
        data: {
          labels: ["", "", "", "", "", "", "", "", "", "", ""],
          datasets: [
            {
              label: "TeamA score",
              data: [a, 80, 80, 80, 80,80,80, 80, 80, 80,80],
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
              data: [a, 35, 40, 90, 50],
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
 <?php 
	
         
?>
 ///////////////////////////////////////////////////////////////// -->
    
          <!-- //////////////////////////////////////////////////////////////////////////////////// -->
      <!-- <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                     <h3>Plot Fetal Heart Rate below</h3> -->
                  <!-- </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table id="mainTable" class="table table-striped">
                          <tbody>

                          
                       <tr>
                            <td>Amniotic fluid</td>
                             <td>R</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                          </tr>
                        <tr>
                            <td>Moulding</td>
                             <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                          </tr>

                        </tbody>
                        <tfoot>
                          <tr>
                            <th>
                              <strong></strong>
                            </th>
                           
                          </tr>
                        </tfoot>
                      </table>
                    </div>
                  </div>
                </div> --> 

<!--    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                      -->


   
     <?php// include 'chartj/line.html'?>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
     <script>
// window.onload = function () {

// var chart = new CanvasJS.Chart("chartContainer", {
// 	animationEnabled: true,
// 	theme: "light2",
// 	title:{
// 		text: "Contractions per 10 minutes"
// 	},
// 	data: [{        
// 		type: "line",
//       	indexLabelFontSize: 16,
// 		dataPoints: [
// 			{ y: 450 },
// 			{ y: 414},
// 			{ y: 520, indexLabel: "\u2191 highest",markerColor: "red", markerType: "triangle" },
// 			{ y: 460 },
// 			{ y: 450 },
// 			{ y: 500 },
// 			{ y: 480 },
// 			{ y: 480 },
// 			{ y: 410 , indexLabel: "\u2193 lowest",markerColor: "DarkSlateGrey", markerType: "cross" },
// 			{ y: 500 },
// 			{ y: 480 },
// 			{ y: 510 }
// 		]
// 	}]

  
// });


// chart.render();

// }
</script>
  


<br>
   <div class="chartCard">
      <div class="chartBox">
        <canvas id="myChart"></canvas>
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChart(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChart1(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChart2(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChart3(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChart4(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChart5(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChart6(this)" type="number"> 
     
       </div>
    </div>

 <br>
        <!-- //////////////////////////////////////////////////////////////////////////////////// -->
      <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <!-- <h3>Cervix(PLOT x)  Descent of head (PLOT o)</h3> -->
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table id="mainTable" class="table table-striped">
                          <tbody>
                       <tr>
                            <td>Amnotic fluid</td>
                             <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                          </tr>
                        <tr>
                            <td>Moulding</td>
                             <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                          </tr>
                          
                      
                        </tbody>
                        <tfoot>
                          <tr>
                            <th>
                              <strong></strong>
                            </th>
                           
                          </tr>
                        </tfoot>
                      </table>
                    </div>
                  </div>
                </div>

<!--    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                      -->

     
     <div class="chartCard">
       <div class="chartBox">
        <canvas id="myChart1"></canvas>
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChartt(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChartt1(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChartt2(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChartt3(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChartt4(this)" type="number"> 
        <input id= "barvalue" placeholder= "enter amount to plot" onkeyup="updateChartt5(this)" type="number"> 
        <input id= "barvalue" placeholder= "enter amount to plot" onkeyup="updateChartt6(this)" type="number">
   

      <br>
      <br>
                    <div class="form-row">
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4">Hours</label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                        

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="mumber" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>

                          </div>
                          

                  <!-- time slots -->
                        
                    <div class="form-row">
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4">Time</label>
                              <input type="time" name="date" class="form-control" id="inputEmail4" placeholder="Email">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="time" name="reference" class="form-control" id="inputPassword4" placeholder="Optional">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="time" name="date" class="form-control" id="inputEmail4" placeholder="Email">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="time" name="reference" class="form-control" id="inputPassword4" placeholder="Optional">
                            </div>
                        

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="time" name="date" class="form-control" id="inputEmail4" placeholder="Email">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="time" name="reference" class="form-control" id="inputPassword4" placeholder="Optional">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="time" name="date" class="form-control" id="inputEmail4" placeholder="Email">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="time" name="reference" class="form-control" id="inputPassword4" placeholder="Optional">
                            </div>
                          

                           <div class="form-group col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="time" name="date" class="form-control" id="inputEmail4" placeholder="Email">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="time" name="reference" class="form-control" id="inputPassword4" placeholder="Optional">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="time" name="date" class="form-control" id="inputEmail4" placeholder="Email">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="time" name="reference" class="form-control" id="inputPassword4" placeholder="Optional">
                            </div>
                            
                        </div>
                          <!-- end of time slots -->
                    </div>
                    </div>

    
 <br>
      <br>
<!--    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                      -->

     
     <div class="chartCard">
       <div class="chartBox">
        <canvas id="myChart2"></canvas>
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateCharttt(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateCharttt1(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateCharttt2(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateCharttt3(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateCharttt4(this)" type="number"> 
        <input id= "barvalue" placeholder= "enter amount to plot" onkeyup="updateCharttt5(this)" type="number"> 
        <input id= "barvalue" placeholder= "enter amount to plot" onkeyup="updateCharttt6(this)" type="number">
        
   

      <br>
      <br>
      
      <br>
      <br>

      
      <br>
      <br>
                    <div class="form-row">
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4">Oxytocin U/L</label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                        

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="mumber" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>

                          </div>

                          
                    <div class="form-row">
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <!-- <label for="inputEmail4">Hours</label> -->
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                        

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="mumber" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>

                          </div>
                          

                          

                  <div class="form-row">
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4">Drops/min</label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                        

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="mumber" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>

                          </div>

                          
                    <div class="form-row">
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <!-- <label for="inputEmail4">Hours</label> -->
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                        

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="mumber" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="number" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>

                          </div>
                               
                          
                    </div>
                    </div>
     <br>
     <br>
    

 



<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

 <div class="chartCard">
      <div class="chartBox">

       <!-- //////////////////////////////////////////////////////////////////////////////////// -->
      <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <!-- <h3>Cervix(PLOT x)  Descent of head (PLOT o)</h3> -->
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table id="mainTable" class="table table-striped">
                          <tbody>

                            <label for="inputEmail4">Drugs Given and IV fluids</label>
                        <div class="form-row">
                            <div class="form-group col-1 col-md-1 col-lg-1">
                                <label for="inputEmail4">.</label>
                            
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                        

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>

                          </div>

                      </table>
                    </div>
                  </div>
                </div>

<!--    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                      -->

        <canvas id="myChart3"></canvas>
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChartttt(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChartttt1(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChartttt2(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChartttt3(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChartttt4(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChartttt5(this)" type="number"> 
        <input id= "barvalue"placeholder= "enter amount to plot" onkeyup="updateChartttt6(this)" type="number"> 
     
       </div>
    </div>

<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
  
                   </div>
                   <br>
                   <br>


  <!-- //////////////////////////////////////////////////////////////////////////////////// -->
      <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <!-- <h3>Cervix(PLOT x)  Descent of head (PLOT o)</h3> -->
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table id="mainTable" class="table table-striped">
                          <tbody>

                              <h3> <strong>Tempreture</strong></h3>
                        <div class="form-row">
                            <div class="form-group col-1 col-md-1 col-lg-1">
                                <label for="inputEmail4">.</label>
                            
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                        

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>

                          </div>

                      </table>
                    </div>
                  </div>
                </div>

<!--    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                      -->



  <!-- //////////////////////////////////////////////////////////////////////////////////// -->
      <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                   <h3> <strong>Urine Sample</strong></h3>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table id="mainTable" class="table table-striped">
                          <tbody>

                            <label for="inputEmail4">Protein</label>
                        <div class="form-row">
                            <div class="form-group col-1 col-md-1 col-lg-1">
                                <label for="inputEmail4">.</label>
                            
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                        

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>

                          </div>

                             <div class="form-row">
                            <div class="form-group col-1 col-md-1 col-lg-1">
                                <label for="inputEmail4">Acetone</label>
                            
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                        

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>

                          </div>

                             <div class="form-row">
                            <div class="form-group col-1 col-md-1 col-lg-1">
                                <label for="inputEmail4">Volume</label>
                            
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="number" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                        

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>
                          

                           <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputEmail4"></label>
                              <input type="text" name="date" class="form-control" id="inputEmail4" placeholder="">
                            </div>
                            
                            <div class="form-group  col-1 col-md-1 col-lg-1">
                              <label for="inputPassword4"></label>
                              <input type="text" name="reference" class="form-control" id="inputPassword4" placeholder="">
                            </div>

                          </div>



                      </table>
                    </div>
                  </div>
                </div>

<!--    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                      -->
                  
    </div>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>


    // setup 
    const data = {
      labels: ['', '', '', '', '','', '', '', '', '','', '', '', '', '','', '', '', '', '','', '', '', '', '' ],
      datasets: [{
        label: 'Fetal Heart rate',
        data: [20, 90, 100, 110, 120, 130, 140,150, 160, 180, 190, 200 ],
        backgroundColor: [
          'rgba(255, 26, 104, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)',
          'rgba(0, 0, 0, 0.2)'
        ],
        borderColor: [
          'rgba(255, 26, 104, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(0, 0, 0, 1)'
        ],
        borderWidth: 1
      },
    ]
      
    };

      // setup 
    const data2 = {
      labels: ['', '', '', '', '','', '', '', '', '','', '', '', '', '','', '', '', '', '','', '', '', '', '' ],
      datasets: [{
        label: 'Fetal Heart rate',
        data: [0, 1, 2, 3, 4, 5, 6,7, 8, 9, 10],
        backgroundColor: [
          'rgba(255, 26, 104, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)',
          'rgba(0, 0, 0, 0.2)'
        ],
        borderColor: [
          'rgba(255, 26, 104, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(0, 0, 0, 1)'
        ],
        borderWidth: 1
      },
    ]
      
    };

    // setup 
    const data3 = {
      labels: ['', '', '', '', '','', '', '', '', '','', '', '', '', '','', '', '', '', '','', '', '', '', '' ],
      datasets: [{
        label: 'Fetal Heart rate',
        data: [0, 1, 2, 3, 4, 5],
        backgroundColor: [
          'rgba(255, 26, 104, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)',
          'rgba(0, 0, 0, 0.2)'
        ],
        borderColor: [
          'rgba(255, 26, 104, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(0, 0, 0, 1)'
        ],
        borderWidth: 1
      },
    ]
      
    };

    
  // setup 
    const data4 = {
      labels: ['', '', '', '', '','', '', '', '', '','', '', '', '', '','', '', '', '', '','', '', '', '', '' ],
      datasets: [{
        label: 'Fetal Heart rate',
        data: [20, 90, 100, 110, 120, 130, 140,150, 160, 180, 190, 200 ],
        backgroundColor: [
          'rgba(255, 26, 104, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)',
          'rgba(0, 0, 0, 0.2)'
        ],
        borderColor: [
          'rgba(255, 26, 104, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(0, 0, 0, 1)'
        ],
        borderWidth: 1
      },
    ]
      
    };


      

    // config 
    const config = {
      type: 'line',
      data,
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    };

    // config 
    const config2 = {
      type: 'line',
      data: data2,
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    };

      // config 
    const config3 = {
      type: 'line',
      data: data3,
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    };

       // config 
    const config4 = {
      type: 'line',
      data: data4,
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    };


   

    // render init block
    const myChart = new Chart(
      document.getElementById('myChart'),
      config
    );


    



// function for manipulating the first element
    function updateChart(barvalues) {
        console.log(barvalues.value)
        myChart.config.data.datasets[0].data[0] = barvalues.value;
        myChart.update();
    }
    // function to manipulate the second element
     function updateChart1(barvalues) {
        console.log(barvalues.value)
        myChart.config.data.datasets[0].data[1] = barvalues.value;
        myChart.update();
    }

     // function to manipulate the third elemnt element
     function updateChart2(barvalues) {
        console.log(barvalues.value)
        myChart.config.data.datasets[0].data[2] = barvalues.value;
        myChart.update();
    }
       // function to manipulate the fourth elemnt element
     function updateChart3(barvalues) {
        console.log(barvalues.value)
        myChart.config.data.datasets[0].data[3] = barvalues.value;
        myChart.update();
    }

     // function to manipulate the fifth elemnt element
     function updateChart4(barvalues) {
        console.log(barvalues.value)
        myChart.config.data.datasets[0].data[4] = barvalues.value;
        myChart.update();
    }
     // function to manipulate the sixth elemnt element
     function updateChart5(barvalues) {
        console.log(barvalues.value)
        myChart.config.data.datasets[0].data[5] = barvalues.value;
        myChart.update();
    }

     // function to manipulate the seventh elemnt element
     function updateChart6(barvalues) {
        console.log(barvalues.value)
        myChart.config.data.datasets[0].data[6] = barvalues.value;
        myChart.update();
    }



    // render init block
    const myChart1 = new Chart(
      document.getElementById('myChart1'),
      config2
    );

 //  element for the second graph  
    // function for manipulating the second element
    function updateChartt(barvalues) {
        console.log(barvalues.value)
        myChart1.config.data.datasets[0].data[0] = barvalues.value;
        myChart1.update();
    }
    // function to manipulate the second element
     function updateChartt1(barvalues) {
        console.log(barvalues.value)
        myChart1.config.data.datasets[0].data[1] = barvalues.value;
        myChart1.update();
    }

     // function to manipulate the third elemnt element
     function updateChartt2(barvalues) {
        console.log(barvalues.value)
        myChart1.config.data.datasets[0].data[2] = barvalues.value;
        myChart1.update();
    }
       // function to manipulate the fourth elemnt element
     function updateChartt3(barvalues) {
        console.log(barvalues.value)
        myChart1.config.data.datasets[0].data[3] = barvalues.value;
        myChart1.update();
    }

     // function to manipulate the fifth elemnt element
     function updateChartt4(barvalues) {
        console.log(barvalues.value)
        myChart1.config.data.datasets[0].data[4] = barvalues.value;
        myChart1.update();
    }
     // function to manipulate the sixth elemnt element
     function updateChartt5(barvalues) {
        console.log(barvalues.value)
        myChart1.config.data.datasets[0].data[5] = barvalues.value;
        myChart1.update();
    }

     // function to manipulate the seventh elemnt element
     function updateChartt6(barvalues) {
        console.log(barvalues.value)
        myChart1.config.data.datasets[0].data[6] = barvalues.value;
        myChart1.update();
    }



    
    // render init block
    const myChart2 = new Chart(
      document.getElementById('myChart2'),
      config3
    );





 //  element for the third graph  
    // function for manipulating the third element
    function updateCharttt(barvalues) {
        console.log(barvalues.value)
        myChart2.config.data.datasets[0].data[0] = barvalues.value;
        myChart2.update();
    }
    // function to manipulate the second element
     function updateCharttt1(barvalues) {
        console.log(barvalues.value)
        myChart2.config.data.datasets[0].data[1] = barvalues.value;
        myChart2.update();
    }

     // function to manipulate the third elemnt element
     function updateCharttt2(barvalues) {
        console.log(barvalues.value)
        myChart2.config.data.datasets[0].data[2] = barvalues.value;
        myChart2.update();
    }
       // function to manipulate the fourth elemnt element
     function updateCharttt3(barvalues) {
        console.log(barvalues.value)
        myChart2.config.data.datasets[0].data[3] = barvalues.value;
        myChart2.update();
    }

     // function to manipulate the fifth elemnt element
     function updateCharttt4(barvalues) {
        console.log(barvalues.value)
        myChart2.config.data.datasets[0].data[4] = barvalues.value;
        myChart2.update();
    }
     // function to manipulate the sixth elemnt element
     function updateCharttt5(barvalues) {
        console.log(barvalues.value)
        myChart2.config.data.datasets[0].data[5] = barvalues.value;
        myChart2.update();
    }

     // function to manipulate the seventh elemnt element
     function updateCharttt6(barvalues) {
        console.log(barvalues.value)
        myChart2.config.data.datasets[0].data[6] = barvalues.value;
        myChart2.update();
    }


    
    
    // render init block
    const myChart3 = new Chart(
      document.getElementById('myChart3'),
      config3
    );





 //  element for the third graph  
    // function for manipulating the third element
    function updateChartttt(barvalues) {
        console.log(barvalues.value)
        myChart3.config.data.datasets[0].data[0] = barvalues.value;
        myChart3.update();
    }
    // function to manipulate the second element
     function updateChartttt1(barvalues) {
        console.log(barvalues.value)
        myChart3.config.data.datasets[0].data[1] = barvalues.value;
        myChart3.update();
    }

     // function to manipulate the third elemnt element
     function updateChartttt2(barvalues) {
        console.log(barvalues.value)
        myChart3.config.data.datasets[0].data[2] = barvalues.value;
        myChart3.update();
    }
       // function to manipulate the fourth elemnt element
     function updateChartttt3(barvalues) {
        console.log(barvalues.value)
        myChart3.config.data.datasets[0].data[3] = barvalues.value;
        myChart3.update();
    }

     // function to manipulate the fifth elemnt element
     function updateChartttt4(barvalues) {
        console.log(barvalues.value)
        myChart3.config.data.datasets[0].data[4] = barvalues.value;
        myChart3.update();
    }
     // function to manipulate the sixth elemnt element
     function updateChartttt5(barvalues) {
        console.log(barvalues.value)
        myChart3.config.data.datasets[0].data[5] = barvalues.value;
        myChart3.update();
    }

     // function to manipulate the seventh elemnt element
     function updateChartttt6(barvalues) {
        console.log(barvalues.value)
        myChart3.config.data.datasets[0].data[6] = barvalues.value;
        myChart3.update();
    }



    </script>
     <!-- element for the first graph  -->

 <!-- //////////////////////////////////////////////////////////////////////////////////// -->
    
<!--    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                      -->
     
<!-- /////////////////////////////////////////////////////////////////////////////////// -->



<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////// -->


        </form>
                      </div>
                      
              </div>
          </div>
        </section>

         <script src="assets/bundles/editable-table/mindmup-editabletable.js"></script>

        
        <?php include 'includes/settingbar.php'?>
          
   <?php include 'includes/js.php'?>
    <!-- General JS Scripts -->
  <script src="assets/js/app.min.js"></script>
  <!-- JS Libraies -->
  <script src="assets/bundles/editable-table/mindmup-editabletable.js"></script>
  <!-- Page Specific JS File -->
  <script src="assets/js/page/editable-table.js"></script>
  <!-- Template JS File -->
  <script src="assets/js/scripts.js"></script>
  <!-- Custom JS File -->
  <script src="assets/js/custom.js"></script>



</body>


<!-- index.html  21 Nov 2019 03:47:04 GMT -->
</html>
<?php
  
if(isset($_POST['submit'])){
	  
	  //text data variables
$code=$_POST['code'];
$itemname=$_POST['itemname'];
$uname=$_POST['uname'];
$unitname=$_POST['unitname'];
$quantity=$_POST['quantity'];
$average=$_POST['average'];


// 	code	itemname	unitname	quantity	averageCost	

$total = $quantity*$average;
	  
	  
	   
$insert_invitem="insert into inventory (code,itemname,unitname,quantity,averageCost,total)values('$code','$itemname','$unitname','$quantity','$average','$totyal')";
	  
$run_cos = mysqli_query($con, $insert_invitem);
    if($run_cos){
         
        echo"<script>window.open('inventoryitem.php','_self')</script>";
        $url = "location:inventoryitem.php?".$_GET['url'];
        header($url);
    }
    	
}		
?>