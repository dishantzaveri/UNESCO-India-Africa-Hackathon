<?php
  //project query
    $get_project="select * from customeracc";

    $run_project=mysqli_query($con, $get_project);

  while ($row_project=mysqli_fetch_array($run_project)){

  
  $cname = $row_project['name'];

  echo  '<option>'.$cname.'</option>';

}
?>