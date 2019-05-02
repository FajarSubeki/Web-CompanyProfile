<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- <link rel="preload" href="<?php echo base_url('lib/css/bootstrap.min.css'); ?>" as="style"> -->

    <link rel="stylesheet" type="text/css" href="<?php echo base_url('lib/css/bootstrap.min.css'); ?>">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url('lib/css/swiper.min.css'); ?>">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url('lib/css/plyr.css'); ?>">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url('lib/css/nivo-slider-theme.css') ?>">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url('lib/css/aos.css') ?>">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url('lib/css/core2.css'); ?>">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url('lib/css/core.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url('lib/css/venobox.css') ?>">

    <title>SARANA DEKETEKSI ENERGI</title>
  </head>
  <body>


    <?php $this->load->view('frontend/part/navbar'); ?>
    <?php $this->load->view('frontend/'.$content); ?>
    <?php $this->load->view('frontend/part/footer'); ?>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script type="text/javascript" src="<?php echo base_url('lib/js/jquery-3.2.1.slim.min.js'); ?>"></script>
    <script src="<?php echo base_url('lib/js/jquery.min.js') ?>"></script>
    <script type="text/javascript" src="<?php echo base_url('lib/js/bootstrap.min.js'); ?>"></script>
    <script type="text/javascript" src="<?php echo base_url('lib/js/popper.min.js'); ?>"></script>
    <script type="text/javascript" src="<?php echo base_url('lib/js/swiper.min.js'); ?>"></script>
    <script type="text/javascript" src="<?php echo base_url('lib/js/particles.min.js'); ?>"></script>
    <script type="text/javascript" src="<?php echo base_url('lib/js/jquery.hover3d.min.js'); ?>"></script>
    <script type="text/javascript" src="<?php echo base_url('lib/js/plyr.min.js'); ?>"></script>
    <script type="text/javascript" src="<?php echo base_url('lib/js/parallax.min.js'); ?>"></script>
    <script type="text/javascript" src="<?php echo base_url('lib/js/all.js'); ?>"></script>
    <script type="text/javascript" src="<?php echo base_url('lib/js/jquery.nivo.slider.js') ?>"></script>
    <script type="text/javascript" src="<?php echo base_url('lib/js/isotope.pkgd.min.js') ?>"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC3ZBjYFMZ3t74mqkiwUp_bbIJAU-P_Iz8"></script>
    <script type="text/javascript" src="<?php echo base_url('lib/js/aos.js') ?>"></script>
    <script src="<?php echo base_url('lib/js/venobox.min.js') ?>"></script>
 
    <script type="text/javascript">AOS.init();</script>
    <script type="text/javascript" src="<?php echo base_url('lib/js/core.js'); ?>"></script>
    <script src="<?php echo base_url('lib/js/contactForm.js') ?>"></script>
    <script src="<?php echo base_url('lib/js/main.js') ?>"></script>
  </body>
</html>