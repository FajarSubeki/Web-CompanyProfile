<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Bahan_bakar_model extends CI_Model {
    
    public $default_table = 't_bahan_bakar';
    public $id = 'id';
	
	
    public function __construct() {
        parent::__construct();
	}
	
   	function getData() {
        $this->db->select('id,nama');
		$this->db->from('t_bahan_bakar');
		
		$query = $this->db->get();
       
        return $query->result();
    }

}
