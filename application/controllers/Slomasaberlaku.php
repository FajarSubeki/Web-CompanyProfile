<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Slomasaberlaku extends CI_Controller {

	public function index()
	{
		$data['content'] = 'slo_masaberlaku';
		$this->load->view('frontend/slo_masaberlaku', $data);
	}

}

/* End of file Frontend.php */
/* Location: ./application/controllers/Frontend.php */