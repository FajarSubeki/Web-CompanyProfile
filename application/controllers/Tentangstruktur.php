<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tentangstruktur extends CI_Controller {

	public function index()
	{
		$data['content'] = 'tentang_struktur';
		$this->load->view('frontend/tentang_struktur', $data);
	}

}

/* End of file Frontend.php */
/* Location: ./application/controllers/Frontend.php */