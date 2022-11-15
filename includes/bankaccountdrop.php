<?php

  //project query
    $get_project="select* from bankandcashacc;";

    $run_project=mysqli_query($con, $get_project);

  while ($row_project=mysqli_fetch_array($run_project)){

  
  $name = $row_project['name'];

  echo  '<option>'.$name.'</option>';

}

?>