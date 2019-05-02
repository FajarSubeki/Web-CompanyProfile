<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Jenis_instalasi_model extends CI_Model {
    
    public $default_table = 't_instalasi_jenis';
    public $id = 'id';
	
	
    public function __construct() {
        parent::__construct();
	}
	
   	function getData($id_jenis_instalasi = "") {
        $this->db->select('id,nama,id_jenis_instalasi');
		$this->db->from('t_instalasi_jenis');
		
		if($id_jenis_instalasi != ""){
			$this->db->where('id_jenis_instalasi', $id_jenis_instalasi);
		}

		$query = $this->db->get();
        return $query->result();
	}
	


}
