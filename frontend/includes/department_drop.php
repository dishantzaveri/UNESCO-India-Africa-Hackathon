<?php

  //project query
    $get_project="select*from department;";

    $run_project=mysqli_query($con, $get_project);

  while ($row_project=mysqli_fetch_array($run_project)){

  
  $departmentname = $row_project['departmentname'];

  echo  '<option>'.$departmentname.'</option>';

}
?>