<?php

  //project query
    $get_project="select*from charges;";

    $run_project=mysqli_query($con, $get_project);

  while ($row_project=mysqli_fetch_array($run_project)){

  
  $amount = $amount['amount'];

  echo  '<option>'.$amount.'</option>';
  

}
?>