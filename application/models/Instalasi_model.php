<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Instalasi_model extends CI_Model {
    
    public $default_table = 't_instalasi';
    public $id = 'id_pemohon';
    
    public function __construct() {
        parent::__construct();
    }
    
   function get_all()
    {
        $this->db->order_by('id_instalasi', 'DESC');
        return $this->db->get($this->default_table)->result();
    }
    
       
    function get_by_id_instalasi($id)
    {
        $this->db->where($this->id, $id);
        return $this->db->get($this->default_table)->row();
    }
     
    // insert data
    function insert($data)
    {
        $this->db->insert($this->default_table, $data);
    }

    // update data
    function update($id, $data)
    {
        $this->db->where($this->id, $id);
        $this->db->update($this->default_table, $data);
    }

    // delete data
    function delete($id)
    {
        $this->db->where($this->id, $id);
        $this->db->delete($this->default_table);
    }

}
