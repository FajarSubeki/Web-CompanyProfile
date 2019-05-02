<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Polling_model extends CI_Model {
    
    public $default_table = 'widget_polling';
    public $id = 'polling_id';
    
    public function __construct() {
        parent::__construct();
    }
    
   function get_all()
    {
        $this->db->order_by('polling_id', 'DESC');
        return $this->db->get($this->default_table)->result();
    }
    function get_all_answr()
    {
        $this->db->order_by('polling_id', 'DESC');
        return $this->db->get('widget_polling_answer')->result();
    }
    
     function get_jawaban_by_id($id)
    {
        $this->db->where('polling_id', $id);
        return $this->db->get('widget_polling_answer')->result();
    }
       
    function get_by_id_polling($id)
    {
        $this->db->where($this->id, $id);
        return $this->db->get($this->default_table)->row();
    }
    
    // insert data
    function insert($data)
    {
        $this->db->insert($this->default_table, $data);
    }
    
    function insert_jwb($data)
    {
        $this->db->insert('widget_polling_answer', $data);
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
    
    function delete_jwb($id)
    {
        $this->db->where('polling_id', $id);
        $this->db->delete('widget_polling_answer');
    }

}
