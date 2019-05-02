<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Sistem_jaringan_model extends CI_Model {
    
    public $default_table = 't_sistem_jaringan';
    public $id = 'id';
	
	
    public function __construct() {
        parent::__construct();
	}
	
   	function getData() {
        $this->db->select('id,sistem_jaringan');
		$this->db->from('t_sistem_jaringan');
		
		$query = $this->db->get();
       
        return $query->result();
    }

}
