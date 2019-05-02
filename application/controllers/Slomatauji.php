<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Slomatauji extends CI_Controller {

	public function index()
	{
		$data['content'] = 'slo_matauji';
		$this->load->view('frontend/slo_matauji', $data);
	}

}

/* End of file Frontend.php */
/* Location: ./application/controllers/Frontend.php */