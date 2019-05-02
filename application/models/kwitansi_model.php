<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class kwitansi_model extends CI_Model {

    public $default_table = 't_kwitansi';
    public $id = 'nokwitansi1';

    public function __construct() {
        parent::__construct();
    }
   public function __construct() {
        parent::__construct();
    }
   function count_by($id_user) {
        $this->db->select('*');
        $this->db->from('t_kwitansi');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_kwitansi.id_pemohon');        
        $this->db->where('t_pemohon.id_user', $id_user);        
       
        return $this->db->count_all_results();
    }
    
   function get_all($id_user)
    {
        $this->db->select('*');
        $this->db->from('t_kwitansi');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_kwitansi.id_pemohon');        
        $this->db->where('t_pemohon.id_user', $id_user);    
        
        return $this->db->get()->result();
    }
    function count_by_admin() {
        $this->db->select('*');
        $this->db->from('t_kwitansi');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_kwitansi.id_pemohon');         
       
        return $this->db->count_all_results();
    }
    
   function get_all_admin()
    {
        $this->db->select('*');
        $this->db->from('t_kwitansi');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_kwitansi.id_pemohon');
        
        return $this->db->get()->result();
    }
    
       
    function get_by_id_status($id)
    {
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

    function no_registrasi($table) {
        $q = $this->db->query("SELECT MAX(RIGHT(no_register,4)) AS idmax FROM " . $table);
        $kd = ""; //kode awal
        if ($q->num_rows() > 0) { //jika data ada
            foreach ($q->result() as $k) {
                $tmp = ((int) $k->idmax) + 1; //string kode diset ke integer dan ditambahkan 1 dari kode terakhir
                $kd =  sprintf("%s", $tmp); //kode ambil 4 karakter terakhir
            }
        } else { //jika data kosong diset ke kode awal
            $kd = "0001";
        }
        $kar = "SDE-".date("dmy"); //karakter depan kodenya
        //gabungkan string dengan kode yang telah dibuat tadi
        return $kar . $kd;
    }


}
