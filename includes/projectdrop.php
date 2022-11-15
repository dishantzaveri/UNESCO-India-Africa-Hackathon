<?php

  //project query
    $get_project="select*from projects;";

    $run_project=mysqli_query($con, $get_project);

  while ($row_project=mysqli_fetch_array($run_project)){

  
  $rname = $row_project['name'];

  echo  '<option>'.$rname.'</option>';

}
?>