<?php

  // //project query
  //   $get_project="select*from accounts;";

  //   $run_project=mysqli_query($con, $get_project);

  // while ($row_project=mysqli_fetch_array($run_project)){

  
  // $name = $row_project['name'];

  // echo  '<option>'.$name.'</option>';

// }


                    //Create a sql query to get all the books

                    $sql = "SELECT * FROM accounts";

                  //   Execution of the query 
                  $res = mysqli_query($con,$sql);

                  //count rows to check whether we have book or not
                  $count = mysqli_num_rows($res);
                 
                  if($count>0)
                  {
                    //we have book in the database
                    //get the data form the database and display
                    while($row=mysqli_fetch_assoc($res)) {
                   
                        $name= $row['name'];

                   echo  '<option>'.$name.'</option>';

                 }
            }
?>