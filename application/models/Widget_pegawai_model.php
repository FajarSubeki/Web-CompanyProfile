<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Widget_pegawai_model extends CI_Model {

    public $default_table = 'widget_pegawai';

    public function __construct() {
        parent::__construct();
    }

    function get_pejabat() {
        $this->db->where('flag_pejabat', 'Y');
        $this->db->order_by('sort_order', 'ASC');        
        return $this->db->get($this->default_table)->result();
    }

}
