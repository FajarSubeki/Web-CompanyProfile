<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tentangdasarhukum extends CI_Controller {

	public function index()
	{
		$data['content'] = 'tentang_dasarhukum';
		$this->load->view('frontend/tentang_dasarhukum', $data);
	}

}

/* End of file Frontend.php */
/* Location: ./application/controllers/Frontend.php */