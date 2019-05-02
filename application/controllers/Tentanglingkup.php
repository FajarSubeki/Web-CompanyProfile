<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tentanglingkup extends CI_Controller {

	public function index()
	{
		$data['content'] = 'tentang_lingkup';
		$this->load->view('frontend/tentang_lingkup', $data);
	}

}

/* End of file Frontend.php */
/* Location: ./application/controllers/Frontend.php */