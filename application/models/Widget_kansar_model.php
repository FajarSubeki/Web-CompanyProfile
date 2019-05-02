<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Widget_kansar_model extends CI_Model {

    public $default_table = 'widget_kansar';

    public function __construct() {
        parent::__construct();
    }

    function get_kansar() {
        $this->db->order_by('name', 'ASC');        
        return $this->db->get($this->default_table)->result();
    }

}
