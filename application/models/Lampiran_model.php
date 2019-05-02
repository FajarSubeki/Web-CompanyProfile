<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Lampiran_model extends CI_Model {
    
    public $default_table = 't_lampiran';
    public $id = 'id_pemohon';
    
    public function __construct() {
        parent::__construct();
    }
   function count_by($id_user) {
        $this->db->select('*');
        $this->db->from('t_lampiran');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_lampiran.id_pemohon');        
        $this->db->where('t_pemohon.id_user', $id_user);        
       
        return $this->db->count_all_results();
    }
    
   function get_all($id_user)
    {
        $this->db->select('*');
        $this->db->from('t_lampiran');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_lampiran.id_pemohon');        
        $this->db->where('t_pemohon.id_user', $id_user);    
        
        return $this->db->get()->result();
    }
    function count_by_admin() {
        $this->db->select('*');
        $this->db->from('t_lampiran');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_lampiran.id_pemohon');         
       
        return $this->db->count_all_results();
    }
    
   function get_all_admin()
    {
        $this->db->select('*');
        $this->db->from('t_lampiran');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_lampiran.id_pemohon');
        
        return $this->db->get()->result();
    }
    
       
    function get_by_id_lampiran($id)
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
