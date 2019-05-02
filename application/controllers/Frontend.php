<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Frontend extends CI_Controller {

	public function index()
	{
		$data['content'] = 'home';
		$this->load->view('frontend/index', $data);
	}

	public function gallery()
	{
		$data['content'] = 'gallery';
		$this->load->view('frontend/index', $data);
	}

	public function contact()
	{
		$data['content'] = 'contact';
		$this->load->view('frontend/index', $data);
	}

	public function dasarhukum()
	{
		$data['content'] = 'tentang_dasarhukum';
		$this->load->view('frontend/index', $data);
	}

	public function perwakilan()
	{
		$data['content'] = 'tentang_perwakilan';
		$this->load->view('frontend/index', $data);
	}

	public function daftar()
	{
		$data['content'] = 'tentang_daftar';
		$this->load->view('frontend/index', $data);
	}

	public function legalitas()
	{
		$data['content'] = 'tentang_legalitas';
		$this->load->view('frontend/index', $data);
	}

	public function visimisi()
	{
		$data['content'] = 'tentang_visimisi';
		$this->load->view('frontend/index', $data);
	}

	public function struktur()
	{
		$data['content'] = 'tentang_struktur';
		$this->load->view('frontend/index', $data);
	}

	public function lingkup()
	{
		$data['content'] = 'tentang_lingkup';
		$this->load->view('frontend/index', $data);
	}

	public function masaberlaku()
	{
		$data['content'] = 'slo_masaberlaku';
		$this->load->view('frontend/index', $data);
	}

	public function diagramalir()
	{
		$data['content'] = 'slo_diagramalir';
		$this->load->view('frontend/index', $data);
	}

	public function regulasi()
	{
		$data['content'] = 'slo_regulasi';
		$this->load->view('frontend/index', $data);
	}

	public function prosedur()
	{
		$data['content'] = 'slo_prosedur';
		$this->load->view('frontend/index', $data);
	}

	public function matauji()
	{
		$data['content'] = 'slo_matauji';
		$this->load->view('frontend/index', $data);
	}

}

/* End of file Frontend.php */
/* Location: ./application/controllers/Frontend.php */