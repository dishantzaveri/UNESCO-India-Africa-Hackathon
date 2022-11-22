<?php

include("includes/db.php");

?>
<!DOCTYPE html>
<html lang="en">


<!-- auth-login.html  21 Nov 2019 03:49:32 GMT -->
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>construction</title>
  <!-- General CSS Files -->
  <link rel="stylesheet" href="assets/css/app.min.css">
  <link rel="stylesheet" href="assets/bundles/bootstrap-social/bootstrap-social.css">
  <!-- Template CSS -->
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/components.css">
  <!-- Custom style CSS -->
  <link rel="stylesheet" href="assets/css/custom.css">
  <link rel='shortcut icon' type='image/x-icon' href='assets/img/favicon.ico' />
</head>

<body>
  <div class="loader"></div>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
        <!-- <div class="col-md-6 col-sm-6 col-12"> -->
        <div class="col-6 col-md-6 col-lg-5">
        <br>
                  <br>
                  <br>
                <div class="card">
                  
                  <div class="card-header">
                    <h1>Partogram Login</h1>
                  </div>
                  <div class="card-body">
                    
                  <form method="POST" action="#" class="needs-validation" novalidate="">
                  <div class="form-group">
                    <label for="email">Doctor's ID</label>
                    <input id="email" type="text" class="form-control" name="name" tabindex="1" required autofocus>
                    <div class="invalid-feedback">
                      Please fill in your email
                    </div>
                  </div>
                  <br>
                 
                  <div class="form-group">
                    <div class="d-block">
                      <label for="password" class="control-label">Password</label>
                      
                    
                    </div>
                    <input id="password" type="password" class="form-control" name="password" tabindex="2" required>
                    <div class="invalid-feedback">
                      please fill in your password
                    </div>
                  </div>
                  <br>
                  <div class="form-group">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" name="remember" class="custom-control-input" tabindex="3" id="remember-me">
                      <label class="custom-control-label" for="remember-me">Remember Me</label>
                    </div>
                    <br>
                    <div class="float-left">
                        <a href="auth-reset-password.php" class="text-small">
                          Fogort password?
                        </a>
                      </div>
                  </div>
                  <br>
                  <div class="form-group">
                    <button type="submit" name="submit" class="btn btn-primary btn-lg btn-block" tabindex="4">
                      Login
                    </button>
                  </div>
                  
                </form>
              
                
                  </div>
                </div>
              </div>
              <!-- <div class="col-md-6 col-sm-6 col-12"> -->
              <div class="col-6 col-md-6 col-lg-7 ">
                
                <br>
                <br>
                
               
                   
                   
              
                      
                      
                    
                      <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                   <lottie-player src="https://assets10.lottiefiles.com/packages/lf20_nmrwalqa.json"  background="transparent"  speed="1"  style="width: 700px; height: 600px;"  loop  autoplay></lottie-player>
              </div>
           
             
            </div>
        </div>
      </div>
    </section>
  </div>
  <!-- General JS Scripts -->
  <script src="assets/js/app.min.js"></script>
  <!-- JS Libraies -->
  <!-- Page Specific JS File -->
  <!-- Template JS File -->
  <script src="assets/js/scripts.js"></script>
  <!-- Custom JS File -->
  <script src="assets/js/custom.js"></script>
</body>


<!-- auth-login.html  21 Nov 2019 03:49:32 GMT -->
</html>

<?php
    // check whether the submit button is clicked or not
    if(isset($_POST['submit']))
    {
    // process for login
    // 1.Get the data from login form
     $name = $_POST['name'];
     $password = $_POST['password'];

    //  2 sql to check whether the user with username and password exist or not
    $sql ="SELECT * FROM adminlogin WHERE name='$name' AND password='$password'";

    // 3.Execute the query
    $res = mysqli_query($con, $sql);

    // 4.count rows to check whether the user exists or not
    $count = mysqli_num_rows($res);

    if($count==1)
    
    {
      echo"<script>window.open('log.php','_self')</script>";
      $url = "location:log.php?".$_GET['url'];
      header($url);
    } else
     {
      echo"<script>window.open('log.php','_self')</script>";
      $url = "location:log.php?".$_GET['url'];
      header($url);

    }
      }
?>
