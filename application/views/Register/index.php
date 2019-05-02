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

        <style>
            .instalasi_grub { display: none; }
        </style>

    </head>

    <body>

        <!-- Header -->
        <section>
			<!-- <h4><?php echo base_url() ?></h4> -->
        </section>
        <!--   Big container   -->
        <div class="container">
           
            <form action="<?php echo base_url() ?>Register/saveRegister" method="post" enctype="multipart/form-data">
                <h3>
					<b>Registrasi SLO<br>
               	 	<small>Silakan Mengisi data data di bawah ini</small>
				</h3>

				<br>

				<div id="box1">
					<h4>Isi Data Pemohon</h4>

					<div class="form-group">
						<label>Nama Pemohon</label>
                        <input name="nama_pemohon" type="text" class="form-control" placeholder="Nama Pemohon" required/>	
					</div>

					<div class="form-group">
						<label>No. Surat</label>
                        <input name="no_surat" type="text" class="form-control" placeholder="No. surat" required/>	
					</div>

					<div class="form-group">
						<label>Tanggal Surat</label>
                        <div class='input-group date form_datetime' id='datetimepickertanggalsurat'>
                                <!-- <input type='text' name="tgl_surat" class="form-control" readonly />
                                <span class="input-group-addon">
        	                        <span class="glyphicon glyphicon-calendar"></span>
    	                        </span> -->
								<input type="date" name="tgl_surat" placeholder="Tanggal Surat" class="form-control" required/>
                        </div>
					</div>

					<div class="form-group">
						<label>Tanggal Permohonan Verifikasi</label>
                        <div class='input-group date form_datetime' id='datetimepickerverifikasi'>
                                <!-- <input type='text' name="tgl_surat" class="form-control" readonly />
                                <span class="input-group-addon">
        	                        <span class="glyphicon glyphicon-calendar"></span>
    	                        </span> -->
								<input type="date" name="tgl_permohonan_verifikasi" placeholder="Tanggal Permohonan Verifikasi" class="form-control" required/>
                        </div>
					</div>

					<div class="form-group">
						<label>Alamat</label>
                        <input name="alamat_pemohon" type="text" class="form-control" placeholder="Alamat" required>	
					</div>

					<div class="form-group">
                    	<label>File Permohonan</label>
						<br>
						<input name="file_permohonan" type="file" required>
                    </div>

					<br>

					<h4>Isi Data Pemilik</h4>

					<div class="form-group">
						<label>Nama Pemilik Instansti</label>
                        <input name="nama_pemilik_instansi" type="text" class="form-control" placeholder="Nama Pemilik" required>	
					</div>

					<div class="form-group">
						<label>Alamat</label>
                        <input name="alamat_pemilik" type="text" class="form-control" placeholder="Alamat Pemilik" required>	
					</div>

					<div class="form-group">
						<label>Lokasi Instansi</label>
                        <input name="lokasi_instansi" type="text" class="form-control" placeholder="Lokasi Instansi" required>	
					</div>

					<div class="form-group">
						<label>Wilayah Kerja</label>
                        <input name="wilayah_kerja" type="text" class="form-control" placeholder="Wilayah Kerja" required>	
					</div>

					<br>

					<div class="tab-pane" id="pilih_instalasi">
                        <h4 class="info-text">Pilih Instalasi</h4>
                            <div class="row">
                            	
                                    
									<div class="col-sm-4">
                                        <div class="choice" data-toggle="wizard-checkbox" id="pembangkit_a">

											
                                            <input type="radio" id="radio1" name="pilih_instalasi" value="pembangkit" >
                                                <div class="ico">
                                                    <i class="fa fa-blackboard"></i>
                                                    <!-- <img src="<?php echo $assets_path ?>img/register/pembangkit.png" width="100" height="100"> -->
                                                </div>
                                             <label for="radio1">Pembangkit</label>
                                        </div>
                                    </div>
									<!--
                                    <div class="col-sm-3">
        	                            <div class="choice" data-toggle="wizard-checkbox" id="transmisi_a">
                                            <input type="radio" id="radio2" name="pilihinstalasi" value="transmisi">
                                                <div class="ico">
                                                    <i class="fa fa-blackboard"></i>
                                                    <img src="<?php echo $assets_path ?>img/register/transmisi.png" width="100" height="100">
                                                </div>
                                            <h6>Transmisi</h6>
                                        </div>
                                    </div>-->
                                    
									<div class="col-sm-4">
                                        <div class="choice" data-toggle="wizard-checkbox" id="distribusi_a">
                                            <input type="radio" id="radio3" name="pilih_instalasi" value="distribusi">
                                                <div class="ico">
                                                    <i class="fa fa-blackboard"></i>
                                                    <!-- <img src="<?php echo $assets_path ?>img/register/distribusi.png" width="100" height="100"> -->
                                                </div>
                                            <label for=radio3>Distribusi</h6>
                                        </div>
									</div>

                                    <div class="col-sm-4">
                                        <div class="choice" data-toggle="wizard-checkbox" id="pemanfaatan_a">
                                            <input type="radio" id="radio4" name="pilih_instalasi" value="pemanfaatan">
                                                <div class="ico">
                                                    <i class="fa fa-blackboard"></i>
                                                    <!-- <img src="<?php echo $assets_path ?>img/register/pemanfaatan.png" width="100" height="100"> -->
                                                </div>
                                            <h6>Pemanfaatan</h6>
                                        </div>
									</div>

                            </div>
                    </div>

					<br>

					<!-- Pembangkit -->
					<div class="instalasi_grub" id="pembangkit">
						
						<center><h5>PEMBANGKIT</h5></center>
						
							
						<div class="form-group">
							<label>Pilih Provinsi</label>
							<select class="form-control" name="provinsi_pembangkit" id="propinsi1">
                                <option value="">Pilih Provinsi</option>
								<?php foreach ($prov as $pr) { ?>
                                    <option value="<?php echo $pr->kode_prov ?>"><?php echo $pr->prov ?></option>
                                <?php } ?>
                            </select>
						</div>

						<div class="form-group">
							<label>Pilih Kota/Kab</label>
							<select class="form-control" name="kota_kab_pembangkit" id="kabupaten1">
                                <option value="">Pilih Kota/Kab</option>
                                    <!-- <?php foreach ($prov as $pr) { ?> -->
                                        <!-- <option value="<?php echo $pr->kode_prov ?>"><?php echo $pr->prov ?></option> -->
                                    <!-- <?php } ?> -->
                                </select>
						</div>

						<div class="form-group">
							<label>Lokasi Pembangkit</label>
                        	<input name="lokasi_pembangkit" type="text" class="form-control" placeholder="Lokasi Pembangkit">	
						</div>

						<div class="form-group">
							<label>Jenis Pembangkit</label>
							<select class="form-control" name="jenis_pembangkit">
                                <option value="">--Pilih Jenis Pembangkit--</option>

                                    <?php foreach ($jenis_pembangkit as $v) { ?>
                                        <option value="<?php echo $v->id ?>"><?php echo $v->nama ?></option>
                                    <?php } ?>
                                </select>
						</div>

						<div class="form-group">
							<label>Jenis Usaha Penyedia Tenaga Listrik</label>
							<select class="form-control" name="jenis_usaha_pembangkit">
                                <option value="">--Pilih Jenis Usaha Penyedia Tenaga Listrik--</option>
									<?php foreach ($jenis_usaha as $v) { ?>
                                        <option value="<?php echo $v->id ?>"><?php echo $v->nama ?></option>
                                    <?php } ?>
                                </select>
						</div>
	
						<div class="form-group">
							<label>Bahan Bakar</label>
							<select class="form-control" name="bahan_bakar">
                                <option value="">--Pilih Bahan Bakar--</option>
									<?php foreach ($bahan_bakar as $v) { ?>
                                        <option value="<?php echo $v->id ?>"><?php echo $v->nama ?></option>
                                    <?php } ?>
                                </select>
						</div>
									

						<label>Kapasitas</label>

						<div class="row">
							
							<div class="col-sm-10">
								<div class="form-group">
                        			<input name="kapasitas_pembangkit" type="text" class="form-control" placeholder="Kapasitas">	
								</div>
							</div>
							
							<div class="col-sm-2">
								<div class="form-group">
										<select class="form-control" name="satuan_pembangkit">
											<option value="">--Pilih Satuan--</option>
											<?php foreach ($satuan_kapasitas as $v) { ?>
                                       			<option value="<?php echo $v->id ?>"><?php echo $v->nama ?></option>
                                    		<?php } ?>
										</select>
								</div>
							</div>

						</div>
						
						<br>
						<center><h5>Surat Pendukung Perizinan</h5></center>

						<div class="form-group">
							<label>Nomor</label>
                        	<input name="nomor_surat_pendukung_pembangkit" type="text" class="form-control" placeholder="Nomor Surat Pendukung">	
						</div>

						<div class="form-group">
						<label>Tanggal Surat</label>
                        <div class='input-group date form_datetime' id='datetimepicker1'>
                                <!-- <input type='text' name="tgl_surat" class="form-control" readonly />
                                <span class="input-group-addon">
        	                        <span class="glyphicon glyphicon-calendar"></span>
    	                        </span> -->
								<input type="date" name="tgl_surat_pendukung_pembangkit" placeholder="Tanggal" class="form-control"/>
                        </div>

						<div class="form-group">
                    		<label>File Jual Beli/SIT/ID Pelanggan</label>
							<br>
							<input name="file_pendukung_pembangkit1" type="file">
                    	</div>

						<div class="form-group">
                    		<label>File Single Line Diagram</label>
							<br>
							<input name="file_pendukung_pembangkit2" type="file">
                    	</div>

						<div class="form-group">
                    		<label>File Gambar Instalasi dan Tata Letak</label>
							<br>
							<input name="file_pendukung_pembangkit3" type="file">
                    	</div>

						<div class="form-group">
                    		<label>File Jenis dan Kapasitas Instalasi</label>
							<br>
							<input name="file_pendukung_pembangkit4" type="file">
                    	</div>

						<div class="form-group">
                    		<label>File Spesifikasi Peralatan Utama Instalasi</label>
							<br>
							<input name="file_pendukung_pembangkit5" type="file">
                    	</div>

						<div class="form-group">
                    		<label>File Ijin Operasi</label>
							<br>
							<input name="file_pendukung_pembangkit6" type="file">
                    	</div>

						<div class="form-group">
                    		<label>File NPWP</label>
							<br>
							<input name="file_pendukung_pembangkit7" type="file">
                    	</div>

						<div class="form-group">
                    		<label>File PKP</label>
							<br>
							<input name="file_pendukung_pembangkit8" type="file">
                    	</div>

						</div>
					</div>

					<!-- Distribusi -->
					<div class="instalasi_grub" id="distribusi">
						
						<center><h5>DISTRIBUSI</h5></center>

						<div class="form-group">
							<label>Nama Distribusi</label>
                        	<input name="nama_distribusi" type="text" class="form-control" placeholder="Nama Distribusi">	
						</div>

						<div class="form-group">
							<label>Alamat Distribusi</label>
                        	<input name="alamat_distribusi" type="text" class="form-control" placeholder="Alamat Distribusi">	
						</div>
							
						<div class="form-group">
							<label>Pilih Provinsi</label>
							<select class="form-control" name="provinsi_distribusi" id="propinsi2">
                                <option value="">Pilih Provinsi</option>
								<?php foreach ($prov as $pr) { ?>
                                    <option value="<?php echo $pr->kode_prov ?>"><?php echo $pr->prov ?></option>
                                <?php } ?>
                            </select>
						</div>

						<div class="form-group">
							<label>Pilih Kota/Kab</label>
							<select class="form-control" name="kota_kab_distribusi" id="kabupaten2">
                                <option value="">Pilih Kota/Kab</option>
                                    <!-- <?php foreach ($prov as $pr) { ?> -->
                                        <!-- <option value="<?php echo $pr->kode_prov ?>"><?php echo $pr->prov ?></option> -->
                                    <!-- <?php } ?> -->
                                </select>
						</div>

						<div class="form-group">
							<label>Lokasi Pembangkit</label>
                        	<input name="lokasi_pembangkit" type="text" class="form-control" placeholder="Lokasi Pembangkit">	
						</div>

						<div class="form-group">
							<label>Tujuan Pemasangan</label>
                        	<input name="tujuan_pemasangan" type="text" class="form-control" placeholder="Tujuan Pemasangan">	
						</div>

						<div class="form-group">
							<label>Jenis Instalasi Distribusi</label>
							<select class="form-control" name="jenis_instalasi_distribusi">
                                <option value="">--Pilih Jenis Instalasi Distribusi--</option>
                                    <?php foreach ($jenis_instalasi_distribusi as $v) { ?>
                                        <option value="<?php echo $v->id ?>"><?php echo $v->nama ?></option>
                                    <?php } ?>
                                </select>
						</div>

						<div class="form-group">
							<label>Jenis Usaha Penyedia Tenaga Listrik</label>
							<select class="form-control" name="jenis_usaha_distribusi">
                                <option value="">--Pilih Jenis Usaha Penyedia Tenaga Listrik--</option>
									<?php foreach ($jenis_usaha as $v) { ?>
                                        <option value="<?php echo $v->id ?>"><?php echo $v->nama ?></option>
                                    <?php } ?>
                                </select>
						</div>

						<div class="form-group">
							<label>Kepemilikan Sistem Jaringan</label>
							<select class="form-control" name="kepemilikan_sistem_jaringan_distribusi">
                                <option value="">--Pilih Kepemilikan Sistem Jaringan--</option>
									<?php foreach ($kepemilikan_sistem as $v) { ?>
                                        <option value="<?php echo $v->id ?>"><?php echo $v->pemilik ?></option>
                                    <?php } ?>
                                </select>
						</div>

						<div class="form-group">
							<label>Sistem Jaringan</label>
							<select class="form-control" name="sistem_jaringan_distribusi">
                                <option value="">--Pilih Sistem Jaringan--</option>
									<?php foreach ($sistem_jaringan as $v) { ?>
                                        <option value="<?php echo $v->id ?>"><?php echo $v->sistem_jaringan ?></option>
                                    <?php } ?>
                                </select>
						</div>

						<div class="form-group">
							<label>Tegangan Pengenal</label>
							<select class="form-control" name="tegangan_pengenal_distribusi">
                                <option value="">--Pilih Tegangan Pengenal--</option>
									<?php foreach ($tegangan_pengenal as $v) { ?>
                                        <option value="<?php echo $v->id ?>"><?php echo $v->tegangan ?></option>
                                    <?php } ?>
                                </select>
						</div>

						<div class="form-group">
							<label>Jumlah Gardu Distribusi</label>
                        	<input name="jumlah_gardu_distribusi" type="text" class="form-control" placeholder="Jumlah Gardu Distribusi">	
						</div>

						<div class="form-group">
							<label>Jumlah Panel</label>
                        	<input name="jumlah_panel" type="text" class="form-control" placeholder="Jumlah Panel">	
						</div>

						<label>Kapasitas Arus Hub Singkat</label>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<input name="kapasitas_arus_hub_singkat" type="text" class="form-control" placeholder="Kapasitas Arus Hub Singkat">	
								</div>
							</div>
								
							<div class="col-sm-1">
								<label>kA</label>
							</div>
						</div>

						<label>Panjang JTR</label>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<input name="panjang_jtr" type="text" class="form-control" placeholder="Panjang JTR">	
								</div>
							</div>
								
							<div class="col-sm-1">
								<label>kms</label>
							</div>
						</div>

						<label>Panjang SUTR</label>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<input name="panjang_sutr" type="text" class="form-control" placeholder="Panjang SUTR">	
								</div>
							</div>
								
							<div class="col-sm-1">
								<label>kms</label>
							</div>
						</div>

						<label>Panjang SKTR</label>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<input name="panjang_sktr" type="text" class="form-control" placeholder="Panjang SKTR">	
								</div>
							</div>
								
							<div class="col-sm-1">
								<label>kms</label>
							</div>
						</div>

						<label>Panjang JTM</label>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<input name="panjang_jtm" type="text" class="form-control" placeholder="Panjang JTM">	
								</div>
							</div>
								
							<div class="col-sm-1">
								<label>kms</label>
							</div>
						</div>

						<label>Panjang SUTM</label>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<input name="panjang_sutm" type="text" class="form-control" placeholder="Panjang SUTM">	
								</div>
							</div>
								
							<div class="col-sm-1">
								<label>kms</label>
							</div>
						</div>

						<label>Panjang SKTM</label>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<input name="panjang_sktm" type="text" class="form-control" placeholder="Panjang SKTM">	
								</div>
							</div>
								
							<div class="col-sm-1">
								<label>kms</label>
							</div>
						</div>

						<label>Cubicle</label>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<input name="cubicle" type="text" class="form-control" placeholder="Cubicle">	
								</div>
							</div>
								
							<div class="col-sm-1">
								<label>unit</label>
							</div>
						</div>

						<label>Tegangan Pengenal(kV)</label>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<input name="tegangan_pengenal" type="text" class="form-control" placeholder="kV">	
								</div>
							</div>
								
							<div class="col-sm-1">
								<label>kV</label>
							</div>
						</div>

						<label>Kapasitas Gardu Distribusi(kVa)</label>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<input name="kapasitas_gardu_distribusi" type="text" class="form-control" placeholder="kVa">	
								</div>
							</div>
								
							<div class="col-sm-1">
								<label>kVa</label>
							</div>
						</div>
						
						<br>
						<center><h5>Surat Pendukung Perizinan</h5></center>

						<div class="form-group">
							<label>Nomor</label>
                        	<input name="nomor_surat_pendukung" type="text" class="form-control" placeholder="Nomor Surat Pendukung">	
						</div>

						<div class="form-group">
						<label>Tanggal Surat</label>
                        <div class='input-group date form_datetime' id='datetimepicker1'>
                                <!-- <input type='text' name="tgl_surat" class="form-control" readonly />
                                <span class="input-group-addon">
        	                        <span class="glyphicon glyphicon-calendar"></span>
    	                        </span> -->
								<input type="date" name="tgl_surat_pendukung" placeholder="Tanggal" class="form-control"/>
                        </div>

						<div class="form-group">
                    		<label>File Jual Beli/SIT/ID Pelanggan</label>
							<br>
							<input name="file_pendukung_distribusi1" type="file">
                    	</div>

						<div class="form-group">
                    		<label>File Single Line Diagram</label>
							<br>
							<input name="file_pendukung_distribusi2" type="file">
                    	</div>

						<div class="form-group">
                    		<label>File Gambar Instalasi dan Tata Letak</label>
							<br>
							<input name="file_pendukung_distribusi3" type="file">
                    	</div>

						<div class="form-group">
                    		<label>File Spesifikasi Peralatan Utama Instalasi</label>
							<br>
							<input name="file_pendukung_distribusi4" type="file">
                    	</div>

					</div>
					</div>
					
				    <!-- Pemanfaatan -->
					<div class="instalasi_grub" id="pemanfaatan">
						
						<center><h5>PEMANFAATAN</h5></center>
						
							
						<div class="form-group">
							<label>Pilih Provinsi</label>
							<select class="form-control" name="provinsi_pemanfaatan" id="propinsi3">
                                <option value="">Pilih Provinsi</option>
								<?php foreach ($prov as $pr) { ?>
                                    <option value="<?php echo $pr->kode_prov ?>"><?php echo $pr->prov ?></option>
                                <?php } ?>
                            </select>
						</div>

						<div class="form-group">
							<label>Pilih Kota/Kab</label>
							<select class="form-control" name="kota_kab_pemanfaatan" id="kabupaten3">
                                <option value="">Pilih Kota/Kab</option>
                                    <!-- <?php foreach ($prov as $pr) { ?> -->
                                        <!-- <option value="<?php echo $pr->kode_prov ?>"><?php echo $pr->prov ?></option> -->
                                    <!-- <?php } ?> -->
                                </select>
						</div>

						<div class="form-group">
							<label>Jenis Instalasi Pemanfaatan</label>
							<select class="form-control" name="jenis_instalasi_pemanfaatan">
                                <option value="">--Pilih Jenis Instalasi Pemanfaatan--</option>
								<option value="" disabled >-- Instalasi Pemanfaatan TT --</option>
									<?php foreach ($jenis_instalasi_pemanfaatan_tt as $v) { ?>
                                        <option value="<?php echo $v->id ?>"><?php echo $v->nama ?></option>
                                    <?php } ?>
								<option value="" disabled >-- Instalasi Pemanfaatan TM --</option>
									<?php foreach ($jenis_instalasi_pemanfaatan_tm as $v) { ?>
                                        <option value="<?php echo $v->id ?>"><?php echo $v->nama ?></option>
                                    <?php } ?>
                                </select>
						</div>

						<div class="form-group">
							<label>Jenis Usaha Penyedia Tenaga Listrik</label>
							<select class="form-control" name="jenis_usaha_pemanfaatan">
                                <option value="">--Pilih Jenis Usaha Penyedia Tenaga Listrik--</option>
									<?php foreach ($jenis_usaha as $v) { ?>
                                        <option value="<?php echo $v->id ?>"><?php echo $v->nama ?></option>
                                    <?php } ?>
                                </select>
						</div>

						<div class="form-group">
							<label>PHB Tegangan Menengah</label>
                        	<input name="phb_tegangan_menengah" type="text" class="form-control" placeholder="PHB Tegangan Menengah">	
						</div>

						<div class="form-group">
							<label>PHB Tegangan Rendah</label>
                        	<input name="phb_tegangan_rendah" type="text" class="form-control" placeholder="PHB Tegangan Rendah">	
						</div>

						<div class="form-group">
							<label>Daya Tersambung</label>
                        	<input name="daya_tersambung" type="text" class="form-control" placeholder="Daya Tersambung">	
						</div>

						<div class="form-group">
							<label>Kapasitas Trafo</label>
                        	<input name="kapasitas_trafo" type="text" class="form-control" placeholder="Kapasitas Trafo">	
						</div>

						<div class="form-group">
							<label>Penyedia Tegangan Listrik</label>
                        	<input name="penyedia_tegangan_listrik" type="text" class="form-control" placeholder="Penyedia Tegangan Listrik">	
						</div>
						
						<br>
						<center><h5>Surat Pendukung Perizinan</h5></center>

						<div class="form-group">
							<label>Nomor</label>
                        	<input name="nomor_surat_pendukung_pemanfaatan" type="text" class="form-control" placeholder="Nomor Surat Pendukung">	
						</div>

						<div class="form-group">
						<label>Tanggal Surat</label>
                        <div class='input-group date form_datetime' id='datetimepicker1'>
                                <!-- <input type='text' name="tgl_surat" class="form-control" readonly />
                                <span class="input-group-addon">
        	                        <span class="glyphicon glyphicon-calendar"></span>
    	                        </span> -->
								<input type="date" name="tgl_surat_pendukung_pemanfaatan" placeholder="Tanggal" class="form-control"/>
                        </div>

						<div class="form-group">
                    		<label>File Jual Beli/SIT/ID Pelanggan</label>
							<br>
							<input name="file_pendukung_pemanfaatan1" type="file">
                    	</div>

						<div class="form-group">
                    		<label>File Single Line Diagram</label>
							<br>
							<input name="file_pendukung_pemanfaatan2" type="file">
                    	</div>

						<div class="form-group">
                    		<label>File Gambar Instalasi dan Tata Letak</label>
							<br>
							<input name="file_pendukung_pemanfaatan3" type="file">
                    	</div>

						<div class="form-group">
                    		<label>File Spesifikasi Peralatan Utama Instalasi</label>
							<br>
							<input name="file_pendukung_pemanfaatan4" type="file">
                    	</div>

					</div>
					</div>

					<div class="instalasi_pemasang" id="pemasang">
						
						<center><h5>Pemasangan Instalasi</h5></center>
						
						<div class="form-group">
							<label>Kode Badan Usaha</label>
                        	<input name="kode_badan_usaha" type="text" class="form-control" placeholder="Kode Badan Usaha" required>	
						</div>

						<div class="form-group">
							<label>Nama Badan Usaha</label>
                        	<input name="nama_badan_usaha" type="text" class="form-control" placeholder="Nama Badan Usaha" required>	
						</div>

						<div class="form-group">
							<label>Alamat</label>
							<textarea cols="23" rows="5" class="form-control" name="alamat_badan_usaha" required></textarea>
						</div>

						<div class="form-group">
							<label>Penanggung Jawab Badan Usaha</label>
                        	<input name="penanggung_jawab_badan_usaha" type="text" class="form-control" placeholder="Penanggung Jawab Badan Usaha" required>	
						</div>

						<div class="form-group">
							<label>Penanggung Jawab Teknik</label>
                        	<input name="penanggung_jawab_teknik" type="text" class="form-control" placeholder="Penanggung Jawab Teknik" required>	
						</div>

					</div>
					</div>

					<input type="hidden" name="<?php echo $csrf_name ?>" value="<?php echo $csrf_hash ?>"/>
                    <div class="wizard-footer">
                            <div class="pull-right">
                            <center><input type='submit' class='btn btn-primary' name='simpan' value='Simpan' onclick="javascript: return confirm('Yakin Data Sudah Di isi dengan benar ?')" /></center>
	                        </div>
					</div>
                    
					<div class="clearfix"></div>

				</div>

			</form>
                           
        </div> 
		<!--  Big container -->

		<!-- jQuery -->
        <script src="<?php echo $assets_path ?>js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="<?php echo $assets_path ?>js/bootstrap.min.js"></script>
		
		<!-- Chained Select -->
		<script src="<?php echo $assets_path ?>js/jquery.chained.remote.js"></script>

		<script>
            $(document).ready(function () {

				
				var idprov1 = $('#propinsi1').val();
				var idprov2 = $('#propinsi2').val();
				var idprov3 = $('#propinsi3').val();

                $("#kabupaten1").remoteChained({
                    parents: "#propinsi1",
                    url: "<?php echo base_url() ?>Register/getkab",
                    loading: "Loading..."
                });

				 $("#kabupaten2").remoteChained({
                    parents: "#propinsi2",
                    url: "<?php echo base_url() ?>Register/getKab",
                    loading: "Loading..."
                });

				 $("#kabupaten3").remoteChained({
                    parents: "#propinsi3",
                    url: "<?php echo base_url() ?>Register/getKab",
                    loading: "Loading..."
                });

				//pembangkit
				$('#pembangkit_a').click(function () {
                        // $('#instalasi').css({"z-index": "-1", "position": "relative", "display": "none"});
                        $('#pembangkit').css({"z-index": "100", "position": "relative", "display": "block"});
                        $('#pemanfaatan').css({"z-index": "-1", "position": "relative", "display": "none"});
                        $('#distribusi').css({"z-index": "-1", "position": "relative", "display": "none"});
                        $('#radio1').attr('checked', true);
                        $('#radio2').removeAttr('checked');
                		$('#radio3').removeAttr('checked');
                        $('#radio4').removeAttr('checked');
				});
                
				//trasmisi
                $('#transmisi_a').click(function () {
                        // $('#instalasi').css({"z-index": "-1", "position": "relative", "display": "none"});
                        $('#transmisi').css({"z-index": "100", "position": "relative", "display": "block"});
                        $('#radio2').attr('checked', true);
                        $('#radio1').removeAttr('checked');
                        $('#radio3').removeAttr('checked');
                        $('#radio4').removeAttr('checked');
                });
                
				//distribusi
                $('#distribusi_a').click(function () {
                        $('#distribusi').css({"z-index": "100", "position": "relative", "display": "block"});
						console.log($('#distribusi'));
                        $('#pemanfaatan').css({"z-index": "-1", "position": "relative", "display": "none"});
                        $('#pembangkit').css({"z-index": "-1", "position": "relative", "display": "none"});
                        $('#radio3').attr('checked', true);
                        $('#radio2').removeAttr('checked');
                        $('#radio1').removeAttr('checked');
                        $('#radio4').removeAttr('checked');
                });
				
				//pemanfaatan
                $('#pemanfaatan_a').click(function () {
                        // $('#instalasi').css({"z-index": "-1", "position": "relative", "display": "none"});
						console.log($('#pemanfaatan'));
                        $('#pemanfaatan').css({"z-index": "100", "position": "relative", "display": "block"});
                        $('#distribusi').css({"z-index": "-1", "position": "relative", "display": "none"});
                        $('#pembangkit').css({"z-index": "-1", "position": "relative", "display": "none"});
                        $('#radio4').attr('checked', true);
                        $('#radio2').removeAttr('checked');
                        $('#radio3').removeAttr('checked');
                        $('#radio1').removeAttr('checked');
                });

            });

        </script>

</body>

</html>
