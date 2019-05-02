<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Kansar_model extends CI_Model {
    
    public $table_kansar = 'widget_kansar';
    public $id = 'kansar_id';
    
    public function __construct() {
        parent::__construct();
    }
    
    function get_menu_by_type($type) {
        $this->db->where('type', $type);
        $this->db->order_by('parent', 'DESC');
        $this->db->order_by('sort_order', 'ASC');
        return $this->db->get($this->table_kansar)->result();
    }
    
    function get_menu_by_id($kansar_id) {
        $this->db->where('kansar_id', $kansar_id);
        return $this->db->get($this->table_kansar)->row();
    }
    
    function get_menu_by_url($url) {
        $this->db->where('url', $url);
        return $this->db->get($this->table_kansar)->row();
//        $menu = $this->db->get($this->table_kansar)->row();
//        echo $this->db->last_query();
//        print_r($menu);exit;
    }
    
    function get_menu_by_parent($kansar_parent_id) {
        $this->db->where('kansar_parent_id', $kansar_parent_id);
        $this->db->order_by('sort_order', 'ASC');
        return $this->db->get($this->table_kansar)->result();
    }
    //kategori type
    function get_all_terms($type) {
        $this->db->where('type', $type);
        return $this->db->get('terms')->result();
    }
    
    function get_menu_type($typeId)
    {
        $this->db->where('type', $typeId);
        return $this->db->get($this->table_kansar)->result();
    }
    function get_by_id_kansar($id)
    {
        $this->db->where('kansar_id', $id);
        return $this->db->get($this->table_kansar)->row();
    }
        
    //get tabel menu browse
    function get_parent_all()
    {
        
        $this->db->order_by('kansar_id', 'ASC');
        return $this->db->get($this->table_kansar)->result();
    }
    function get_down_parent_all($type)
    {
        $this->db->where('parent', 'N');
        $this->db->where('type', $type);
        $this->db->order_by('sort_order', 'ASC');
        return $this->db->get($this->table_kansar)->result();
    }
    
    
    // insert data
    function insert($data)
    {
        $this->db->insert($this->table_kansar, $data);
    }

    // update data
    function update($id, $data)
    {
        $this->db->where($this->id, $id);
        $this->db->update($this->table_kansar, $data);
    }

    // delete data
    function delete($id)
    {
        $this->db->where($this->id, $id);
        $this->db->delete($this->table_kansar);
    }

}
