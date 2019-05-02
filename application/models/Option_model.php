<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Option_model extends CI_Model {

    public $default_table = 'options';

    public function __construct() {
        parent::__construct();
    }

    function get_options() {
        $result = $this->db->get($this->default_table)->result();
        foreach ($result as $v) {
            $option[$v->name] = $v->value;
        }
        
        return $option;
    }

}
