<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tentangvisimisi extends CI_Controller {

	public function index()
	{
		$data['content'] = 'tentang_visimisi';
		$this->load->view('frontend/tentang_visimisi', $data);
	}

}

/* End of file Frontend.php */
/* Location: ./application/controllers/Frontend.php */