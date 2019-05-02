    <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top navbar-home">
      <div class="container">
        <a class="navbar-brand" href="#"><img src="lib/img/logo.png"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="<?php echo base_url('') ?>">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown style-2">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">SLO <i class="fas fa-angle-down"></i></a>
              <div class="dropdown-menu style-2" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="<?php echo base_url('masaberlaku') ?>">Masa Berlaku SLO</a>
                <a class="dropdown-item" href="<?php echo base_url('diagramalir') ?>">Diagram Alir SLO</a>
                <a class="dropdown-item" href="<?php echo base_url('regulasi') ?>">Regulasi</a>
                <a class="dropdown-item" href="<?php echo base_url('prosedur') ?>">Prosedur Sertifikasi</a>
                <a class="dropdown-item" href="<?php echo base_url('matauji') ?>">Mata Uji Laik Operasi</a>
              </div>
            </li>
            <li class="nav-item dropdown style-2">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tentang Kami <i class="fas fa-angle-down"></i></a>
              <div class="dropdown-menu style-2" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="<?php echo base_url('dasarhukum') ?>">Dasar Hukum</a>
                <a class="dropdown-item" href="<?php echo base_url('perwakilan') ?>">Perwakilan Wilayah</a>
                <a class="dropdown-item" href="<?php echo base_url('daftar') ?>">Daftar PJT & TT</a>
                <a class="dropdown-item" href="<?php echo base_url('legalitas') ?>">Legalitas Perusahaan</a>
                <a class="dropdown-item" href="<?php echo base_url('visimisi') ?>">Visi & Misi</a>
                <a class="dropdown-item" href="<?php echo base_url('struktur') ?>">Struktur Organisasi</a>
                <a class="dropdown-item" href="<?php echo base_url('lingkup') ?>">Lingkup Usaha</a>
              </div>
            </li>
            <li class="nav-item"><a class="nav-link" href="<?php echo base_url('contact') ?>">Kontak</a></li>
            <li class="nav-item"><a class="nav-link" href="<?php echo base_url('gallery') ?>">Galeri</a></li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="navbar-home-box" style="height: 80px;"></div>