<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class User_model extends CI_Model {
    
    public $default_table = 'users';
    public $id = 'user_id';
    
    public function __construct() {
        parent::__construct();
    }
    
   function get_all()
    {
        $this->db->order_by('user_id', 'DESC');
        return $this->db->get($this->default_table)->result();
    }

	function get_all_tt()
    {
		$this->db->where('group_id', 3);
        $this->db->order_by('display_name', 'ASC');
        return $this->db->get($this->default_table)->result();
    }
    
     function get_group_all()
    {
        $this->db->order_by('group_id', 'DESC');
        return $this->db->get('groups')->result();
    }
       
    function get_by_id_user($id)
    {
        $this->db->where($this->id, $id);
        return $this->db->get($this->default_table)->row();
    }
    
    function get_by_username($id)
    {
        $this->db->where('user_login', $id);
        return $this->db->get($this->default_table)->row();
    }
    
    function get_by_email($id)
    {
        $this->db->where('email', $id);
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
