<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tentanglegalitas extends CI_Controller {

	public function index()
	{
		$data['content'] = 'tentang_legalitas';
		$this->load->view('frontend/tentang_legalitas', $data);
	}

}

/* End of file Frontend.php */
/* Location: ./application/controllers/Frontend.php */