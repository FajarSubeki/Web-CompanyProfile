<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Jenis_usaha_model extends CI_Model {
    
    public $default_table = 't_jenis_usaha';
    public $id = 'id';
	
	
    public function __construct() {
        parent::__construct();
	}
	
   	function getData() {
        $this->db->select('id,nama');
		$this->db->from('t_jenis_usaha');
		
		$query = $this->db->get();
       
        return $query->result();
    }

}
