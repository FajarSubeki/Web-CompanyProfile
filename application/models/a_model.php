<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Distribusi_model extends CI_Model {

    public $default_table = 't_distribusi';
    public $id = 'id_pemohon';

    public function __construct() {
        parent::__construct();
    }

    function count_by($id_user) {
        $this->db->select('*');
        $this->db->from('t_distribusi');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_distribusi.id_pemohon');
        $this->db->where('t_pemohon.id_user', $id_user);

        return $this->db->count_all_results();
    }

    function get_all_admin_proses() {
        $this->db->select('*');
        $this->db->from('t_distribusi');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_distribusi.id_pemohon');
		$this->db->join('t_instalasi', 't_pemohon.id_pemohon = t_instalasi.id_pemohon');
        $where = "t_pemohon.status='0' OR t_pemohon.status='1' OR t_pemohon.status='2' OR t_pemohon.status='3' OR t_pemohon.status='4'";
        $this->db->where($where);
        $this->db->order_by("t_pemohon.id_pemohon","desc");
        
        return $this->db->get()->result();
    }
    
    function get_all_proses($id_user) {
        $this->db->select('*');
        $this->db->from('t_distribusi');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_distribusi.id_pemohon');        
        $this->db->where('t_pemohon.id_user', $id_user); 
        $where = "t_pemohon.status='0' OR t_pemohon.status='1' OR t_pemohon.status='2' OR t_pemohon.status='3' OR t_pemohon.status='4'";
        $this->db->where($where);
        $this->db->order_by("t_pemohon.id_pemohon","desc");
        
        return $this->db->get()->result();
    }
    function get_all_admin_hasil() {
        $this->db->select('*');
        $this->db->from('t_distribusi');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_distribusi.id_pemohon');  
		$this->db->join('t_instalasi', 't_pemohon.id_pemohon = t_instalasi.id_pemohon');
        $this->db->join('t_hasil_permohonan_api ', 't_hasil_permohonan_api.nomorPermohonan = t_pemohon.api_nopermohonan ');
        $this->db->where('t_pemohon.status','5'); 
        $this->db->order_by("t_pemohon.id_pemohon","desc");
        
        return $this->db->get()->result();
    }
    
    function get_all_hasil($id_user) {
        $this->db->select('*');
        $this->db->from('t_distribusi');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_distribusi.id_pemohon');  
        $this->db->join('t_hasil_permohonan_api ', 't_hasil_permohonan_api.nomorPermohonan = t_pemohon.api_nopermohonan ');
        $this->db->where('t_pemohon.id_user', $id_user); 
        $this->db->where('t_pemohon.status','5'); 
        $this->db->order_by("t_pemohon.id_pemohon","desc");
        
        return $this->db->get()->result();
    }   
    function count_by_admin() {
        $this->db->select('*');
        $this->db->from('t_distribusi');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_distribusi.id_pemohon');
        
        return $this->db->count_all_results();
    }

    

    function get_by_id_distribusi($id) {
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
 function prov()
    {
        $this->db->order_by("provinsi.prov","asc");
        return $this->db->get('provinsi')->result();
    }
    function kab($prov)
    {
        $this->db->where('kode_prov', $prov);
		$this->db->order_by("kab.kab","asc");
        return $this->db->get('kab')->result();
    }
    function getprov($id)
    {
        $this->db->where('kode_prov', $id);
		$this->db->order_by("provinsi.prov","asc");
        return $this->db->get('provinsi')->row();
    }
    function getkab($id)
    {
        $this->db->where('kode_kab', $id);
		$this->db->order_by("kab.kab","asc");
        return $this->db->get('kab')->row();
    }
    function allprov()
    {
		$this->db->order_by("provinsi.prov","asc");
        return $this->db->get('provinsi')->result();
    }
    function allkab()
    {
		$this->db->order_by("kab.kab","asc");
        return $this->db->get('kab')->result();
    }
}
