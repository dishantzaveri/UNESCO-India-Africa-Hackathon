<?php

  //project query
    $get_project="select*from overtime;";

    $run_project=mysqli_query($con, $get_project);

  while ($row_project=mysqli_fetch_array($run_project)){

  
  $amount = $row_project['amount'];

  echo  '<option>'.$amount.'</option>';

}
?>