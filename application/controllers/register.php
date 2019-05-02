<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Register extends CI_Controller {

	public function __construct() {
        parent::__construct();
        //isAuthorized();
        // load default model
        $this->load->library('form_validation');
        $this->load->model('auth_model');
        $this->load->model('user_model');
        $this->load->model('link_model');
        $this->load->model('option_model');
        $this->load->model('access_group_model');
        $this->load->model('permohonan_model');
        $this->load->model('instalasi_model');
        $this->load->model('pembangkit_model');
        $this->load->model('transmisi_model');
        $this->load->model('distribusi_model');
        $this->load->model('pemanfaatan_model');
        $this->load->model('trafo_distribusi_model');
        $this->load->model('pemasang_instalasi_model');
        $this->load->model('surat_perjanjian_model');
		$this->load->model('status_model');
		
		//Baru Di buat
		$this->load->model('jenis_pembangkit_model', 'jpm');
		$this->load->model('Jenis_usaha_model', 'jum');
		$this->load->model('bahan_bakar_model', 'bbm');
		$this->load->model('kepemilikan_sistem_model', 'ksm');
		$this->load->model('sistem_jaringan_model', 'sjm');
		$this->load->model('tegangan_pengenal_model', 'tpm');
		$this->load->model('jenis_instalasi_model', 'jim');
		$this->load->model('satuan_kapasitas_model', 'skm');
	}	

	public function index(){
			$this->data['csrf_name'] = $this->security->get_csrf_token_name();
			$this->data['csrf_hash'] = $this->security->get_csrf_hash();
			$this->access_group_model->cek_akses_user();
			// $this->data['sbu'] =$this->pemasang_instalasi_model->apiSBU();
			$this->data['prov'] = $this->pemanfaatan_model->prov();
			$this->data['jenis_pembangkit'] = $this->jpm->getData();
			$this->data['jenis_usaha'] = $this->jum->getData();
			$this->data['bahan_bakar'] = $this->bbm->getData();
			$this->data['kepemilikan_sistem'] = $this->ksm->getData();
			$this->data['sistem_jaringan'] = $this->sjm->getData();
			$this->data['tegangan_pengenal'] = $this->tpm->getData();
			$this->data['satuan_kapasitas'] = $this->skm->getData();
			$this->data['jenis_instalasi_distribusi'] = $this->jim->getData(2);
			$this->data['jenis_instalasi_pemanfaatan_tt'] = $this->jim->getData(3);
			$this->data['jenis_instalasi_pemanfaatan_tm'] = $this->jim->getData(4);

			$this->data['assets_path'] = base_url() . 'lib/';
			// print_r( base_url() . 'lib/');
			$this->load->view('Register/index', $this->data);
	}

	public function dev_index(){
		$this->data['csrf_name'] = $this->security->get_csrf_token_name();
		$this->data['csrf_hash'] = $this->security->get_csrf_hash();
		$this->access_group_model->cek_akses_user();
		// $this->data['sbu'] =$this->pemasang_instalasi_model->apiSBU();
		// $this->data['prov'] =$this->pemanfaatan_model->prov();

		$this->load->view('Register/index', $this->data);
	}

	public function getKab(){

		$kode_prov = 0;
		if(isset($_GET['provinsi_pembangkit'])){
			
			$kode_prov= $_GET['provinsi_pembangkit'];
		
		}else if(isset($_GET['provinsi_distribusi'])){
			
			$kode_prov= $_GET['provinsi_distribusi'];
		
		}else if(isset($_GET['provinsi_pemanfaatan'])){
			
			$kode_prov= $_GET['provinsi_pemanfaatan'];
		}

        $kab = $this->pemanfaatan_model->kab($kode_prov);
        foreach ($kab as $k) {
            $results_array[$k->kode_kab] = $k->kab;
        }
        
		echo json_encode($results_array);
		
	}
	
	public function saveRegister()
	{
			$this->access_group_model->cek_akses_user();
	
			//file upload pemohon
			$this->load->library('upload');
			date_default_timezone_set('asia/jakarta');
			
			$nmfile = md5(date('Y-m-d-H:i:s'));
			$config['upload_path'] = "repository/slo/permohonan/";
			$config['allowed_types'] = "pdf|jpg";
			$config['overwrite'] = TRUE;
			$config['file_name'] = $nmfile;
			$this->upload->initialize($config);
	
			//data pemohon
			if (!$this->upload->do_upload('file_permohonan')) {
				$this->session->set_flashdata('message', 'Gagal Upload');
				redirect(site_url('register'));

			} else {
				$upload_data = $this->upload->data();
				$gbr = $this->upload->data();
				$pemohon_id = $this->permohonan_model->get_next_id_pemohon();
	
				$data = array(
					'id_pemohon' => $pemohon_id,
					'tgl_pemohon' => $this->input->post('tgl_surat', TRUE),
					'nama' => $this->input->post('nama_pemohon', TRUE),
					'jabatan' => $this->input->post('no_surat', TRUE),
					// 'tlp' => $this->input->post('tlp', TRUE),
					'alamat' => $this->input->post('alamat_pemohon', TRUE),
					'id_user' => $this->session->logged_in->user_id,
					'no_register' => $this->permohonan_model->no_registrasi('t_pemohon'),
					'tgl_permohonan_verifikasi' => $this->input->post('tgl_permohonan_verifikasi'), 
					'status_permohonan' => 0,    
					'file_permohonan' => "repository/slo/permohonan/" . $gbr['file_name'],
					'created_at' => date('Y-m-d H:i:s'),
				);
				$this->permohonan_model->insert($data);
				//$pemohon_id = $this->db->insert_id();
	
				//data pemilik
				$data_pemilik = array(
					'id_pemohon' => $pemohon_id,
					'nama_instalasi' => $this->input->post('nama_pemilik_instansi', TRUE),
					'alamat_instalasi' => $this->input->post('alamat_pemilik', TRUE),
					'lokasi' => $this->input->post('lokasi_instansi', TRUE),
					'wilayah_kerja' => $this->input->post('wilayah_kerja', TRUE),
				);
				$this->instalasi_model->insert($data_pemilik);
	
				if ($this->input->post('pilih_instalasi') == "pembangkit") {
					//instalasi jika pembangkit
					$data_pembangkit = array(
						'id_pemohon' => $pemohon_id,
						'kode_provinsi' => $this->input->post('provinsi_pembangkit', TRUE),
						'kode_kota_kab' => $this->input->post('kota_kab_pembangkit', TRUE),
						'lokasi_pembangkit' => $this->input->post('lokasi_pembangkit', TRUE),
						'kode_jenis_pembangkit' => $this->input->post('jenis_pembangkit', TRUE),
						'kode_jenis_usaha' => $this->input->post('jenis_usaha_pembangkit', TRUE),
						'kode_bahan_bakar' => $this->input->post('bahan_bakar', TRUE),
						'kapasitas' => $this->input->post('kapasitas_pembangkit', TRUE),
						'satuan_kapasitas' => $this->input->post('satuan_pembangkit', TRUE),
					);
					$this->pembangkit_model->insert($data_pembangkit);
	
					//perjanjian jual beli
					//file upload File Jual Beli/SIT/ID Pelanggan            
	
					$nmfile3 = "filejb" . md5(date('Y-m-d-H:i:s'));
					$config3['upload_path'] = "repository/slo/fjb/";
					$config3['allowed_types'] = "pdf|jpg";
					$config3['overwrite'] = TRUE;
					$config3['file_name'] = $nmfile3;
					$this->upload->initialize($config3);
					$this->upload->do_upload('file_pendukung_pembangkit1');
					$filejb = $this->upload->data();
	
					//file upload File Single Line Diagram
	
					$nmfile4 = "filesld" . md5(date('Y-m-d-H:i:s'));
					$config4['upload_path'] = "repository/slo/fsld/";
					$config4['allowed_types'] = "pdf|jpg";
					$config4['overwrite'] = TRUE;
					$config4['file_name'] = $nmfile4;
					$this->upload->initialize($config4);
					$this->upload->do_upload('file_pendukung_pembangkit2');
					$filesld = $this->upload->data();
	
					//file upload File Gambar Instalasi dan Tata Letak
	
					$nmfile5 = "filegitl" . md5(date('Y-m-d-H:i:s'));
					$config5['upload_path'] = "repository/slo/fgitl/";
					$config5['allowed_types'] = "pdf|jpg";
					$config5['overwrite'] = TRUE;
					$config5['file_name'] = $nmfile5;
					$this->upload->initialize($config5);
					$this->upload->do_upload('file_pendukung_pembangkit3');
					$filegitl = $this->upload->data();
	
					//file upload File Jenis dan Kapasitas Instalasi
	
					$nmfile6 = "filejki" . md5(date('Y-m-d-H:i:s'));
					$config6['upload_path'] = "repository/slo/fjki/";
					$config6['allowed_types'] = "pdf|jpg";
					$config6['overwrite'] = TRUE;
					$config6['file_name'] = $nmfile6;
					$this->upload->initialize($config6);
					$this->upload->do_upload('file_pendukung_pembangkit4');
					$filejki = $this->upload->data();
	
					//file upload File Spesifikasi Peralatan Utama Instalasi
	
					$nmfile7 = "filespui" . md5(date('Y-m-d-H:i:s'));
					$config7['upload_path'] = "repository/slo/fspui/";
					$config7['allowed_types'] = "pdf|jpg";
					$config7['overwrite'] = TRUE;
					$config7['file_name'] = $nmfile7;
					$this->upload->initialize($config7);
					$this->load->library('upload', $config7);
					$this->upload->do_upload('file_pendukung_pembangkit5');
					$filespui = $this->upload->data();
	
					//file upload File Ijin Operasi
	
					$nmfile8 = "fileio" . md5(date('Y-m-d-H:i:s'));
					$config8['upload_path'] = "repository/slo/fio/";
					$config8['allowed_types'] = "pdf|jpg";
					$config8['overwrite'] = TRUE;
					$config8['file_name'] = $nmfile8;
					$this->upload->initialize($config8);
					$this->upload->do_upload('file_pendukung_pembangkit6');
					$fileio = $this->upload->data();
	
					//file upload File NPWP
	
					$nmfile9 = "filenpwp" . md5(date('Y-m-d-H:i:s'));
					$config9['upload_path'] = "repository/slo/fnpwp/";
					$config9['allowed_types'] = "pdf|jpg";
					$config9['overwrite'] = TRUE;
					$config9['file_name'] = $nmfile9;
					$this->upload->initialize($config9);
					$this->upload->do_upload('file_pendukung_pembangkit7');
					$filenpwp = $this->upload->data();
	
					//file upload File PKP
	
					$nmfile10 = "filepkp" . md5(date('Y-m-d-H:i:s'));
					$config10['upload_path'] = "repository/slo/fpkp/";
					$config10['allowed_types'] = "pdf|jpg";
					$config10['overwrite'] = TRUE;
					$config10['file_name'] = $nmfile10;
					$this->upload->initialize($config10);
					$this->upload->do_upload('file_pendukung_pembangkit8');
					$filepkp = $this->upload->data();
	
					//perjanjian act
	
					$data_perjanjian = array(
						'id_pemohon' => $pemohon_id,
						'nomor' => $this->input->post('nomor_surat_pendukung_pembangkit', TRUE),
						'tanggal' => $this->input->post('tgl_surat_pendukung_pembangkit', TRUE),
						'file_jual_beli' => "repository/slo/fjb/" . $filejb['file_name'],
						'file_sld' => "repository/slo/fsld/" . $filesld['file_name'],
						'file_gitl' => "repository/slo/fgitl/" . $filegitl['file_name'],
						'file_jki' => "repository/slo/fjki/" . $filejki['file_name'],
						'file_spui' => "repository/slo/fspui/" . $filespui['file_name'],
						'file_io' => "repository/slo/fio/" . $fileio['file_name'],
						'file_npwp' => "repository/slo/fnpwp/" . $filenpwp['file_name'],
						'file_pkp' => "repository/slo/fpkp/" . $filepkp['file_name'],
					);
	
					$this->surat_perjanjian_model->insert($data_perjanjian);
				} elseif ($this->input->post('pilih_instalasi') == "transmisi") {
					//instalasi jika trasmisi   
					$data_transmisi = array(
						'id_pemohon' => $pemohon_id,
						'kode_jenis_transmisi' => $this->input->post('jenisinstalasitransmisi', TRUE),
						'kode_jenis_usaha' => $this->input->post('jenisusahatransmisi', TRUE),
						'kode_kepemilikan' => $this->input->post('kepemilikanjaringantransmisi', TRUE),
						'kode_sistem_jaringan' => $this->input->post('sistemjaringantransmisi', TRUE),
						'kode_tegangan_pengenal' => $this->input->post('teganganpengenaltransmisi', TRUE),
						'p_saluran_sutet' => $this->input->post('panjangsaluransutet', TRUE),
						'p_saluran_sutt' => $this->input->post('panjangsaluransutt', TRUE),
						'kapasitas_travo' => $this->input->post('kapasitastrafo', TRUE),
						'jumlah_tower' => $this->input->post('jmltower', TRUE),
					);
					$this->transmisi_model->insert($data_transmisi);
	
					//perjanjian jual beli
					//file upload File Jual Beli/SIT/ID Pelanggan            
	
					$nmfile3 = "filejb" . md5(date('Y-m-d-H:i:s'));
					$config3['upload_path'] = "repository/slo/fjb/";
					$config3['allowed_types'] = "*";
					$config3['overwrite'] = TRUE;
					$config3['file_name'] = $nmfile3;
					$this->upload->initialize($config3);
					$this->upload->do_upload('jb2');
					$filejb = $this->upload->data();
	
					//file upload File Single Line Diagram
	
					$nmfile4 = "filesld" . md5(date('Y-m-d-H:i:s'));
					$config4['upload_path'] = "repository/slo/fsld/";
					$config4['allowed_types'] = "*";
					$config4['overwrite'] = TRUE;
					$config4['file_name'] = $nmfile4;
					$this->upload->initialize($config4);
					$this->upload->do_upload('sld2');
					$filesld = $this->upload->data();
	
					//file upload File Gambar Instalasi dan Tata Letak
	
					$nmfile5 = "filegitl" . md5(date('Y-m-d-H:i:s'));
					$config5['upload_path'] = "repository/slo/fgitl/";
					$config5['allowed_types'] = "*";
					$config5['overwrite'] = TRUE;
					$config5['file_name'] = $nmfile5;
					$this->upload->initialize($config5);
					$this->upload->do_upload('gitl2');
					$filegitl = $this->upload->data();
	
					//file upload File Jenis dan Kapasitas Instalasi
	
					$nmfile6 = "filejki" . md5(date('Y-m-d-H:i:s'));
					$config6['upload_path'] = "repository/slo/fjki/";
					$config6['allowed_types'] = "*";
					$config6['overwrite'] = TRUE;
					$config6['file_name'] = $nmfile6;
					$this->upload->initialize($config6);
					$this->upload->do_upload('jki2');
					$filejki = $this->upload->data();
	
					//file upload File Spesifikasi Peralatan Utama Instalasi
	
					$nmfile7 = "filespui" . md5(date('Y-m-d-H:i:s'));
					$config7['upload_path'] = "repository/slo/fspui/";
					$config7['allowed_types'] = "*";
					$config7['overwrite'] = TRUE;
					$config7['file_name'] = $nmfile7;
					$this->upload->initialize($config7);
					$this->load->library('upload', $config7);
					$this->upload->do_upload('spui2');
					$filespui = $this->upload->data();
	
					//file upload File Ijin Operasi
	
					$nmfile8 = "fileio" . md5(date('Y-m-d-H:i:s'));
					$config8['upload_path'] = "repository/slo/fio/";
					$config8['allowed_types'] = "*";
					$config8['overwrite'] = TRUE;
					$config8['file_name'] = $nmfile8;
					$this->upload->initialize($config8);
					$this->upload->do_upload('io2');
					$fileio = $this->upload->data();
	
					//file upload File NPWP
	
					$nmfile9 = "filenpwp" . md5(date('Y-m-d-H:i:s'));
					$config9['upload_path'] = "repository/slo/fnpwp/";
					$config9['allowed_types'] = "*";
					$config9['overwrite'] = TRUE;
					$config9['file_name'] = $nmfile9;
					$this->upload->initialize($config9);
					$this->upload->do_upload('npwp2');
					$filenpwp = $this->upload->data();
	
					//file upload File PKP
	
					$nmfile10 = "filepkp" . md5(date('Y-m-d-H:i:s'));
					$config10['upload_path'] = "repository/slo/fpkp/";
					$config10['allowed_types'] = "*";
					$config10['overwrite'] = TRUE;
					$config10['file_name'] = $nmfile10;
					$this->upload->initialize($config10);
					$this->upload->do_upload('pkp2');
					$filepkp = $this->upload->data();
	
					//perjanjian act
	
					$data_perjanjian = array(
						'id_pemohon' => $pemohon_id,
						'nomor' => $this->input->post('nomorspj2', TRUE),
						'tanggal' => $this->input->post('tglspj2', TRUE),
						'file_jual_beli' => "repository/slo/fjb/" . $filejb['file_name'],
						'file_sld' => "repository/slo/fsld/" . $filesld['file_name'],
						'file_gitl' => "repository/slo/fgitl/" . $filegitl['file_name'],
						'file_jki' => "repository/slo/fjki/" . $filejki['file_name'],
						'file_spui' => "repository/slo/fspui/" . $filespui['file_name'],
						'file_io' => "repository/slo/fio/" . $fileio['file_name'],
						'file_npwp' => "repository/slo/fnpwp/" . $filenpwp['file_name'],
						'file_pkp' => "repository/slo/fpkp/" . $filepkp['file_name'],
					);
	
					$this->surat_perjanjian_model->insert($data_perjanjian);
				} elseif ($this->input->post('pilih_instalasi') == "distribusi") {
					//instalasi jika a  
					$data_distribusi = array(
						'id_pemohon' => $pemohon_id,
						'nama_distribusi' => $this->input->post('nama_distribusi', TRUE),
						'alamat_distribusi' => $this->input->post('alamat_distribusi', TRUE),
						'tujuan_pemasangan' => $this->input->post('tujuan_pemasangan', TRUE),
						'kode_provinsi' => $this->input->post('provinsi_distribusi',TRUE),
						'kode_kota' => $this->input->post('kota_kab_distribusi',TRUE),
						'kode_jid' => $this->input->post('jenis_instalasi_distribusi', TRUE),
						'kode_uptl' => $this->input->post('jenis_usaha_distribusi', TRUE),
						'kode_ksj' => $this->input->post('kepemilikan_sistem_jaringan_distribusi', TRUE),
						'kode_sj' => $this->input->post('sistem_jaringan_distribusi', TRUE),
						'kode_tegangan_pengenal' => $this->input->post('tegangan_pengenal_distribusi', TRUE),
						//data baru
						'jgd' => $this->input->post('jumlah_gardu_distribusi',TRUE),
						'jp' => $this->input->post('jumlah_panel',TRUE),
						'kahs' => $this->input->post('kapasitas_arus_hub_singkat',TRUE),
						//data baru
						'jtr' => $this->input->post('panjang_jtr', TRUE),
						'sutr' => $this->input->post('panjang_sutr', TRUE),
						'sktr' => $this->input->post('panjang_sktr', TRUE),
						'jtm' => $this->input->post('panjang_jtm', TRUE),
						'sutm' => $this->input->post('panjang_sutm', TRUE),
						'sktm' => $this->input->post('panjang_sktm', TRUE),
						'cubicle' => $this->input->post('cubicle', TRUE),
						'tp' => $this->input->post('tegangan_pengenal', TRUE),
						'kgd' => $this->input->post('kapasitas_gardu_distribusi', TRUE),
						// 'unit2' => $this->input->post('unit2', TRUE),
					);

					$this->distribusi_model->insert($data_distribusi);
					$id_distribusi = $this->db->insert_id();	
					
					//perjanjian jual beli
					//file upload File Jual Beli/SIT/ID Pelanggan            
	
					$nmfile3 = "filejb" . md5(date('Y-m-d-H:i:s'));
					$config3['upload_path'] = "repository/slo/fjb/";
					$config3['allowed_types'] = "*";
					$config3['overwrite'] = TRUE;
					$config3['file_name'] = $nmfile3;
					$this->upload->initialize($config3);
					$this->upload->do_upload('jb3');
					$filejb = $this->upload->data();
	
					//file upload File Single Line Diagram
	
					$nmfile4 = "filesld" . md5(date('Y-m-d-H:i:s'));
					$config4['upload_path'] = "repository/slo/fsld/";
					$config4['allowed_types'] = "*";
					$config4['overwrite'] = TRUE;
					$config4['file_name'] = $nmfile4;
					$this->upload->initialize($config4);
					$this->upload->do_upload('sld3');
					$filesld = $this->upload->data();
	
					//file upload File Gambar Instalasi dan Tata Letak
	
					$nmfile5 = "filegitl" . md5(date('Y-m-d-H:i:s'));
					$config5['upload_path'] = "repository/slo/fgitl/";
					$config5['allowed_types'] = "pdf|jpg";
					$config5['overwrite'] = TRUE;
					$config5['file_name'] = $nmfile5;
					$this->upload->initialize($config5);
					$this->upload->do_upload('file_pendukung_distribusi1');
					$filegitl = $this->upload->data();
	
					//file upload File Jenis dan Kapasitas Instalasi
	
					$nmfile6 = "filejki" . md5(date('Y-m-d-H:i:s'));
					$config6['upload_path'] = "repository/slo/fjki/";
					$config6['allowed_types'] = "pdf|jpg";
					$config6['overwrite'] = TRUE;
					$config6['file_name'] = $nmfile6;
					$this->upload->initialize($config6);
					$this->upload->do_upload('file_pendukung_distribusi2');
					$filejki = $this->upload->data();
	
					//file upload File Spesifikasi Peralatan Utama Instalasi
	
					$nmfile7 = "filespui" . md5(date('Y-m-d-H:i:s'));
					$config7['upload_path'] = "repository/slo/fspui/";
					$config7['allowed_types'] = "pdf|jpg";
					$config7['overwrite'] = TRUE;
					$config7['file_name'] = $nmfile7;
					$this->upload->initialize($config7);
					$this->load->library('upload', $config7);
					$this->upload->do_upload('file_pendukung_distribusi3');
					$filespui = $this->upload->data();
	
					//file upload File Ijin Operasi
	
					$nmfile8 = "fileio" . md5(date('Y-m-d-H:i:s'));
					$config8['upload_path'] = "repository/slo/fio/";
					$config8['allowed_types'] = "pdf|jpg";
					$config8['overwrite'] = TRUE;
					$config8['file_name'] = $nmfile8;
					$this->upload->initialize($config8);
					$this->upload->do_upload('file_pendukung_distribusi4');
					$fileio = $this->upload->data();
	
					//file upload File NPWP
	
					$nmfile9 = "filenpwp" . md5(date('Y-m-d-H:i:s'));
					$config9['upload_path'] = "repository/slo/fnpwp/";
					$config9['allowed_types'] = "*";
					$config9['overwrite'] = TRUE;
					$config9['file_name'] = $nmfile9;
					$this->upload->initialize($config9);
					$this->upload->do_upload('npwp3');
					$filenpwp = $this->upload->data();
	
					//file upload File PKP
	
					$nmfile10 = "filepkp" . md5(date('Y-m-d-H:i:s'));
					$config10['upload_path'] = "repository/slo/fpkp/";
					$config10['allowed_types'] = "*";
					$config10['overwrite'] = TRUE;
					$config10['file_name'] = $nmfile10;
					$this->upload->initialize($config10);
					$this->upload->do_upload('pkp3');
					$filepkp = $this->upload->data();
	
					//perjanjian act
	
					$data_perjanjian = array(
						'id_pemohon' => $pemohon_id,
						'nomor' => $this->input->post('nomorspj3', TRUE),
						'tanggal' => $this->input->post('tglspj3', TRUE),
						'file_jual_beli' => "repository/slo/fjb/" . $filejb['file_name'],
						'file_sld' => "repository/slo/fsld/" . $filesld['file_name'],
						'file_gitl' => "repository/slo/fgitl/" . $filegitl['file_name'],
						'file_jki' => "repository/slo/fjki/" . $filejki['file_name'],
						'file_spui' => "repository/slo/fspui/" . $filespui['file_name'],
						'file_io' => "repository/slo/fio/" . $fileio['file_name'],
						'file_npwp' => "repository/slo/fnpwp/" . $filenpwp['file_name'],
						'file_pkp' => "repository/slo/fpkp/" . $filepkp['file_name'],
					);
	
					$this->surat_perjanjian_model->insert($data_perjanjian);
				} elseif ($this->input->post('pilihinstalasi') == "pemanfaatan") {
					//instalasi jika pemanfaatan  
					$data_pemanfaatan = array(
						'id_pemohon' => $pemohon_id,
						'kode_provinsi' => $this->input->post('provinsi_pemanfaatan', TRUE),
						'kode_kota' => $this->input->post('kota_pemanfaatan', TRUE),
						'kode_jip' => $this->input->post('jenis_instalasi_pemanfaatan', TRUE),
						'kode_pjup' => $this->input->post('jenis_usaha_pemanfaatan', TRUE),
						//kode baru
						'phbtm' => $this->input->post('phb_tegangan_menengah', TRUE),
						'phbtr' => $this->input->post('phb_tegangan_rendah', TRUE),
						//kode baru 
						'daya_tersambung' => $this->input->post('daya_tersambung', TRUE),
						'kapasitas_trafo' => $this->input->post('kapasitas_trafo', TRUE),
						'peyedia_tegangan_listik' => $this->input->post('peyedia_tegangan_listik', TRUE),
					);
					$this->pemanfaatan_model->insert($data_pemanfaatan);
	
					//perjanjian jual beli
					//file upload File Jual Beli/SIT/ID Pelanggan            
	
					$nmfile3 = "filejb" . md5(date('Y-m-d-H:i:s'));
					$config3['upload_path'] = "repository/slo/fjb/";
					$config3['allowed_types'] = "pdf|jpg";
					$config3['overwrite'] = TRUE;
					$config3['file_name'] = $nmfile3;
					$this->upload->initialize($config3);
					$this->upload->do_upload('file_pendukung_pemanfaatan1');
					$filejb = $this->upload->data();
	
					//file upload File Single Line Diagram
	
					$nmfile4 = "filesld" . md5(date('Y-m-d-H:i:s'));
					$config4['upload_path'] = "repository/slo/fsld/";
					$config4['allowed_types'] = "pdf|jpg";
					$config4['overwrite'] = TRUE;
					$config4['file_name'] = $nmfile4;
					$this->upload->initialize($config4);
					$this->upload->do_upload('file_pendukung_pemanfaatan2');
					$filesld = $this->upload->data();
	
					//file upload File Gambar Instalasi dan Tata Letak
	
					$nmfile5 = "filegitl" . md5(date('Y-m-d-H:i:s'));
					$config5['upload_path'] = "repository/slo/fgitl/";
					$config5['allowed_types'] = "pdf|jpg";
					$config5['overwrite'] = TRUE;
					$config5['file_name'] = $nmfile5;
					$this->upload->initialize($config5);
					$this->upload->do_upload('file_pendukung_pemanfaatan3');
					$filegitl = $this->upload->data();
	
					//file upload File Jenis dan Kapasitas Instalasi
	
					$nmfile6 = "filejki" . md5(date('Y-m-d-H:i:s'));
					$config6['upload_path'] = "repository/slo/fjki/";
					$config6['allowed_types'] = "pdf|jpg";
					$config6['overwrite'] = TRUE;
					$config6['file_name'] = $nmfile6;
					$this->upload->initialize($config6);
					$this->upload->do_upload('jki4');
					$filejki = $this->upload->data();
	
					//file upload File Spesifikasi Peralatan Utama Instalasi
	
					$nmfile7 = "filespui" . md5(date('Y-m-d-H:i:s'));
					$config7['upload_path'] = "repository/slo/fspui/";
					$config7['allowed_types'] = "pdf|jpg";
					$config7['overwrite'] = TRUE;
					$config7['file_name'] = $nmfile7;
					$this->upload->initialize($config7);
					$this->load->library('upload', $config7);
					$this->upload->do_upload('file_pendukung_pemanfaatan4');
					$filespui = $this->upload->data();
	
					//file upload File Ijin Operasi
	
					$nmfile8 = "fileio" . md5(date('Y-m-d-H:i:s'));
					$config8['upload_path'] = "repository/slo/fio/";
					$config8['allowed_types'] = "*";
					$config8['overwrite'] = TRUE;
					$config8['file_name'] = $nmfile8;
					$this->upload->initialize($config8);
					$this->upload->do_upload('io4');
					$fileio = $this->upload->data();
	
					//file upload File NPWP
	
					$nmfile9 = "filenpwp" . md5(date('Y-m-d-H:i:s'));
					$config9['upload_path'] = "repository/slo/fnpwp/";
					$config9['allowed_types'] = "*";
					$config9['overwrite'] = TRUE;
					$config9['file_name'] = $nmfile9;
					$this->upload->initialize($config9);
					$this->upload->do_upload('npwp4');
					$filenpwp = $this->upload->data();
	
					//file upload File PKP
	
					$nmfile10 = "filepkp" . md5(date('Y-m-d-H:i:s'));
					$config10['upload_path'] = "repository/slo/fpkp/";
					$config10['allowed_types'] = "*";
					$config10['overwrite'] = TRUE;
					$config10['file_name'] = $nmfile10;
					$this->upload->initialize($config10);
					$this->upload->do_upload('pkp4');
					$filepkp = $this->upload->data();
	
					//perjanjian act
	
					$data_perjanjian = array(
						'id_pemohon' => $pemohon_id,
						'nomor' => $this->input->post('nomor_surat_pendukung_pemanfaatan', TRUE),
						'tanggal' => $this->input->post('tgl_surat_pendukung_pemanfaatan', TRUE),
						'file_jual_beli' => "repository/slo/fjb/" . $filejb['file_name'],
						'file_sld' => "repository/slo/fsld/" . $filesld['file_name'],
						'file_gitl' => "repository/slo/fgitl/" . $filegitl['file_name'],
						'file_jki' => "repository/slo/fjki/" . $filejki['file_name'],
						'file_spui' => "repository/slo/fspui/" . $filespui['file_name'],
						'file_io' => "repository/slo/fio/" . $fileio['file_name'],
						'file_npwp' => "repository/slo/fnpwp/" . $filenpwp['file_name'],
						'file_pkp' => "repository/slo/fpkp/" . $filepkp['file_name'],
					);
	
					$this->surat_perjanjian_model->insert($data_perjanjian);
				}
	
				// //file upload sbu
	
				// $nmfile1 = "filesbu" . md5(date('Y-m-d-H:i:s'));
				// $config1['upload_path'] = "repository/slo/instalasi/";
				// $config1['allowed_types'] = "*";
				// $config1['overwrite'] = TRUE;
				// $config1['file_name'] = $nmfile1;
				// $this->upload->initialize($config1);
				// $this->upload->do_upload('filesbu');
				// $filesbu = $this->upload->data();
	
				// //file upload siujk
	
				// $nmfile2 = "filesiujk" . md5(date('Y-m-d-H:i:s'));
				// $config2['upload_path'] = "repository/slo/instalasi/";
				// $config2['allowed_types'] = "*";
				// $config2['overwrite'] = TRUE;
				// $config2['file_name'] = $nmfile2;
				// $this->upload->initialize($config2);
				// $this->upload->do_upload('filesiujk');
				// $filesiujk = $this->upload->data();
	
				//pasang instalasi
				$data_pemasangan_instalasi = array(
					'id_pemohon' => $pemohon_id,
					'kode_badan_usaha' => $this->input->post('kode_badan_usaha', TRUE),
					'nama_badan_usaha' => $this->input->post('nama_badan_usaha', TRUE),
					// 'tlp' => $this->input->post('tlpbadanusaha', TRUE),
					'alamat' => $this->input->post('alamat_badan_usaha', TRUE),
					// 'nomor_sbu' => $this->input->post('kodesbu', TRUE),
					// 'file_sbu' => "repository/slo/instalasi/" . $filesbu['file_name'],
					// 'tgl_sbu' => $this->input->post('tglberakhirsbu', TRUE),
					// 'nomor_siujk' => $this->input->post('nomorsiujk', TRUE),
					// 'file_siujk' => "repository/slo/instalasi/" . $filesiujk['file_name'],
					// 'tgl_siujk' => $this->input->post('tglberakhirsiujk', TRUE),
					'pj_badan_usaha' => $this->input->post('penanggung_jawab_badan_usaha', TRUE),
					'pj_teknik' => $this->input->post('penanggung_jawab_teknik', TRUE),
				);
	
				$this->pemasang_instalasi_model->insert($data_pemasangan_instalasi);
	
	
				$this->session->set_flashdata('message', 'Data Berhasil Disimpan');
				redirect(base_url('register'));
			}
	}
}
