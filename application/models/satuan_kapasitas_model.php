<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Satuan_kapasitas_model extends CI_Model {
    
    public $default_table = 't_satuan_kapasitas';
    public $id = 'id';
	
	
    public function __construct() {
        parent::__construct();
	}
	
   	function getData() {
        $this->db->select('id,nama');
		$this->db->from('t_satuan_kapasitas');
		
		$query = $this->db->get();
       
        return $query->result();
    }

}
