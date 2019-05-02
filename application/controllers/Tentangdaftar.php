<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tentangdaftar extends CI_Controller {

	public function index()
	{
		$data['content'] = 'tentang_daftar';
		$this->load->view('frontend/tentang_daftar', $data);
	}

}

/* End of file Frontend.php */
/* Location: ./application/controllers/Frontend.php */