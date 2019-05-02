<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Site_config_model extends CI_Model {

    public $default_table = 'options';
    public $id = 'option_id';

    public function __construct() {
        parent::__construct();
    }

    function get_by_name($name) {
        $this->db->where('name', $name);
        return $this->db->get($this->default_table)->row();
    }

    // insert data
    function insert($data) {
        $this->db->insert($this->default_table, $data);
    }

    // update data
    function update($data) {
        $this->db->where('name', $data['name']);
        $this->db->update($this->default_table, $data);
    }

    // delete data
    function truncate_data() {
        $this->db->query('TRUNCATE TABLE `options` ');
    }

}
