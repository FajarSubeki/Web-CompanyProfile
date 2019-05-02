<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Auth_model extends CI_Model {
    
    public $table_users = 'users u';
    public $table_groups = 'groups g';
    
    public function __construct() {
        parent::__construct();
    }
    
    function cek_username($user_login) {
        $this->db->join($this->table_groups, 'u.group_id = g.group_id');
        $this->db->where('user_login', $user_login);
        $this->db->where('active', 'Y');
        return $this->db->get($this->table_users)->row();
    }

}
