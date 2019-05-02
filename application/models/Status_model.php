<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Status_model extends CI_Model {
    
    public $default_table = 't_status';
    public $id = 'id_status';
    
    public function __construct() {
        parent::__construct();
    }
   function count_by($id_user) {
        $this->db->select('*');
        $this->db->from('t_status');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_status.id_pemohon');        
        $this->db->where('t_pemohon.id_user', $id_user);        
       
        return $this->db->count_all_results();
    }
    
   function get_all($id_user)
    {
        $this->db->select('*');
        $this->db->from('t_status');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_status.id_pemohon');        
        $this->db->where('t_pemohon.id_user', $id_user);    
        
        return $this->db->get()->result();
    }
    function count_by_admin() {
        $this->db->select('*');
        $this->db->from('t_status');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_status.id_pemohon');         
       
        return $this->db->count_all_results();
    }
    
   function get_all_admin()
    {
        $this->db->select('*');
        $this->db->from('t_status');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_status.id_pemohon');
        
        return $this->db->get()->result();
    }
    
       
    function get_by_id_status($id)
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
