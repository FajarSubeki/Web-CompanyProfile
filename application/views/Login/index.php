<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>PT. SARANA DETEKSI ENERGI</title>

	<!-- Bootstrap Core CSS -->
	<link href="<?php echo $assets_path ?>css/bootstrap.min.css" rel="stylesheet">
		<!-- <link href="<?php echo $assets_path ?>css/style.css" rel="stylesheet"> -->

</head>

<body>

    <!-- Header -->
    <section>
        
    </section>

	<!--   Big container   -->
	<center>
	<div class="container">
        <div class="row">
        <div class="col-sm-12">
           
            <!--      Wizard container        -->   
            <div class="wizard-container"> 
                
            	<div class="card wizard-card ct-wizard-orange" id="wizardProfile">
				<form action="<?php echo ('login/loginaction') ?>" method="post">
                <!--        You can switch "ct-wizard-orange"  with one of the next bright colors: "ct-wizard-blue", "ct-wizard-green", "ct-wizard-orange", "ct-wizard-red"             -->
                
                    <div id="header">
                        <h3>
                    	   <b>Sistem Informasi Registrasi SLO TM<br>
                    	</h3>
                    </div>
                    	
					
                    <h2>Login</h2>                           
                    
						<?php
                        if ($this->session->userdata('message') != '') {
                            echo '<div class="alert alert-danger" align="center"><button type="button" class="close" data-dismiss="alert">&times;</button>';
                            echo $this->session->userdata('message');
                            echo '</div>';
                        }
                        ?> 

					<div id="id1">
                        <div id="login">
							
                                <h4 class="info-text"> Silakan Login untuk Registrasi SLO</h4> 
                                  	<div class="col-sm-7" >
                                      <div class="form-group">
                                        <label>Username</label>
                                        <input name="username" type="text" class="form-control" placeholder="User Name" required>
                                      </div>
                                      <div class="form-group">
                                        <label>Password</label>
                                        <input name="password" type="password" class="form-control" placeholder="Password" required>
                                      </div>
                                      <div class="form-group">
                                          <input type="hidden" name="<?php echo $csrf_name ?>" value="<?php echo $csrf_hash ?>"/>
                                          <input type='submit' class='btn btn-fill btn-primary btn-wd btn-sm' name='login' value='Login' />
                                      </div>
                                  	</div>
                           
                        </div>
					</div>
                </form>
            	</div>
			</div> <!-- wizard container -->
        </div>
        </div><!-- end row -->
    </div> <!--  big container -->
	</center>
    
	<footer>
        
    </footer>

</body>

</html>
