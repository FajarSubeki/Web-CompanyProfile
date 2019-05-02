<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Slodiagramalir extends CI_Controller {

	public function index()
	{
		$data['content'] = 'slo_diagramalir';
		$this->load->view('frontend/slo_diagramalir', $data);
	}

}

/* End of file Frontend.php */
/* Location: ./application/controllers/Frontend.php */