<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sloprosedursertifikasi extends CI_Controller {

	public function index()
	{
		$data['content'] = 'slo_prosedur';
		$this->load->view('frontend/slo_prosedur', $data);
	}

}

/* End of file Frontend.php */
/* Location: ./application/controllers/Frontend.php */