<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sloregulasi extends CI_Controller {

	public function index()
	{
		$data['content'] = 'slo_regulasi';
		$this->load->view('frontend/slo_regulasi', $data);
	}

}

/* End of file Frontend.php */
/* Location: ./application/controllers/Frontend.php */