<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Pesan_model extends CI_Model {

    public $default_table = 't_pesan';
    public $id = 'id_pemohon';

    public function __construct() {
        parent::__construct();
    }

    function get_all() {
        $this->db->order_by('id_pesan', 'DESC');
        return $this->db->get($this->default_table)->result();
    }

    

    function get_by_id_admin() {
        return $this->db->get($this->default_table, 0, 10)->result();
    }

    function get_by_id_pemohon($id) {
        $this->db->where($this->id, $id);
        return $this->db->get($this->default_table)->result();
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
