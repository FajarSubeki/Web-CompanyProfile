<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Pembangkit_model extends CI_Model {

    public $default_table = 't_pembangkit';
    public $id = 'id_pemohon';

    public function __construct() {
        parent::__construct();
    }

    function count_by($id_user) {
        $this->db->select('*');
        $this->db->from('t_pembangkit');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_pembangkit.id_pemohon');        
        $this->db->where('t_pemohon.id_user', $id_user);        
       
        return $this->db->count_all_results();
    }

    
    
    function count_by_admin() {
        $this->db->select('*');
        $this->db->from('t_pembangkit');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_pembangkit.id_pemohon');        
        
        return $this->db->count_all_results();
    }

    function get_all_admin_proses() {
        $this->db->select('*');
        $this->db->from('t_pembangkit');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_pembangkit.id_pemohon');
        $where = "t_pemohon.status='0' OR t_pemohon.status='1' OR t_pemohon.status='2' OR t_pemohon.status='3' OR t_pemohon.status='4'";
        $this->db->where($where);

        
        return $this->db->get()->result();
    }
    
    function get_all_proses($id_user) {
        $this->db->select('*');
        $this->db->from('t_pembangkit');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_pembangkit.id_pemohon');        
        $this->db->where('t_pemohon.id_user', $id_user); 
        $where = "t_pemohon.status='0' OR t_pemohon.status='1' OR t_pemohon.status='2' OR t_pemohon.status='3' OR t_pemohon.status='4'";
        $this->db->where($where);
        
        return $this->db->get()->result();
    }
    function get_all_admin_hasil() {
        $this->db->select('*');
        $this->db->from('t_pembangkit');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_pembangkit.id_pemohon');        
        $this->db->where('t_pemohon.status','5'); 
        
        return $this->db->get()->result();
    }
    
    function get_all_hasil($id_user) {
        $this->db->select('*');
        $this->db->from('t_pembangkit');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_pembangkit.id_pemohon');        
        $this->db->where('t_pemohon.id_user', $id_user); 
        $this->db->where('t_pemohon.status','5'); 
        
        return $this->db->get()->result();
    }   
    
    
    

    function get_by_id_pembangkit($id) {
        $this->db->where($this->id, $id);
        return $this->db->get($this->default_table)->row();
    }

    // insert data
    function insert($data) {
        $this->db->insert($this->default_table, $data);
    }

    // update data
    function update($id, $data) {
        $this->db->where($this->id, $id);
        $this->db->update($this->default_table, $data);
    }

    // delete data
    function delete($id) {
        $this->db->where($this->id, $id);
        $this->db->delete($this->default_table);
    }

}
