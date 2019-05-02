<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Tegangan_pengenal_model extends CI_Model {
    
    public $default_table = 't_tegangan_pengenal';
    public $id = 'id';
	
	
    public function __construct() {
        parent::__construct();
	}
	
   	function getData() {
        $this->db->select('id,tegangan');
		$this->db->from('t_tegangan_pengenal');
		
		$query = $this->db->get();
       
        return $query->result();
    }

}
