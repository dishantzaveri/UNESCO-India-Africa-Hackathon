<?php

include("includes/db.php");

?>



<!-- side bar -->
<div class="main-sidebar sidebar-style-2">
    <aside id="sidebar-wrapper">
      <div class="sidebar-brand">
        <a href="index.php"> <img alt="image" src="assets/img/logo.png" class="header-logo" /> <span
            class="logo-name">Otika</span>
        </a>
      </div>
      <ul class="sidebar-menu">

      <li class="dropdown">
            <a href="#" class="menu-toggle nav-link has-dropdown"><i
                  data-feather="user"></i><span>Manage Users</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="createemp.php">Create</a></li>
                <li><a class="nav-link" href="viewemp.php">View</a></li>
                
              </ul>
              <li class="dropdown">
            <a href="#" class="menu-toggle nav-link has-dropdown"><i
                  data-feather="users"></i><span>Employees</span></a>
              <ul class="dropdown-menu">
              <li><a class="nav-link" href="employees.php">Employees</a></li>              
              <li><a class="nav-link" href="payslip.php">Payslips</a></li>
              <li><a class="nav-link" href="payroll.php">Payroll</a></li>
              </ul>
              
</li>
<li class="dropdown">


      <li class="menu-header">PROJECTS</li>

      <?php


    //business query


    $get_business="select*from business ;";
		
		$run_business=mysqli_query($con, $get_business);
		
		while ($row_business=mysqli_fetch_array($run_business)){
			
			$bid = $row_business['bid'];
			$bname = $row_business['bname'];}

  //project query
    $get_project="select*from project;";

    $run_project=mysqli_query($con, $get_project);

  while ($row_project=mysqli_fetch_array($run_project)){

  $pid = $row_project['bid'];
  $name = $row_project['name'];
  
  



echo '<li class="dropdown active">
          <a href="index.php" class="nav-link"><i data-feather="monitor"></i><span>'.$name.'</span></a>
        </li>';

}
?>
        

        <li class="dropdown">
          <a href="settings.php" class="nav-link"><i data-feather="settings"></i><span>Settings</span></a>
        </li>
        
        
    </aside>
  </div>