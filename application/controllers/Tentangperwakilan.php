<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tentangperwakilan extends CI_Controller {

	public function index()
	{
		$data['content'] = 'tentang_perwakilan';
		$this->load->view('frontend/tentang_perwakilan', $data);
	}

}

/* End of file Frontend.php */
/* Location: ./application/controllers/Frontend.php */