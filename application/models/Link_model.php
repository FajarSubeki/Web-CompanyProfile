<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Link_model extends CI_Model {
    
    public $table_links = 'links';
    public $id = 'link_id';
    
    public function __construct() {
        parent::__construct();
    }
    
    function get_menu_by_type($type,$id_grub) {
        $this->db->where('type', $type);
        $this->db->where('id_grub', $id_grub);       
        $this->db->order_by('parent', 'DESC');
        $this->db->order_by('sort_order', 'ASC');
        return $this->db->get($this->table_links)->result();
    }
    
    function get_menu_by_id($link_id) {
        $this->db->where('link_id', $link_id);
        return $this->db->get($this->table_links)->row();
    }
    
    function get_menu_by_url($url) {
        $this->db->where('url', $url);
        return $this->db->get($this->table_links)->row();
//        $menu = $this->db->get($this->table_links)->row();
//        echo $this->db->last_query();
//        print_r($menu);exit;
    }
    
    function get_menu_by_parent($link_parent_id) {
        $this->db->where('link_parent_id', $link_parent_id);
        $this->db->order_by('sort_order', 'ASC');
        return $this->db->get($this->table_links)->result();
    }
    //kategori type
    function get_all_terms($type) {
        $this->db->where('type', $type);
        return $this->db->get('terms')->result();
    }
    
    function get_menu_type($typeId)
    {
        $this->db->where('type', $typeId);
        return $this->db->get($this->table_links)->result();
    }
    function get_by_id_link($id)
    {
        $this->db->where('link_id', $id);
        return $this->db->get($this->table_links)->row();
    }
        
    //get tabel menu browse
    function get_parent_all($type)
    {
        $this->db->where('parent', 'Y');
        $this->db->where('type', $type);
        $this->db->order_by('sort_order', 'ASC');
        return $this->db->get($this->table_links)->result();
    }
    function get_down_parent_all($type)
    {
        $this->db->where('parent', 'N');
        $this->db->where('type', $type);
        $this->db->order_by('sort_order', 'ASC');
        return $this->db->get($this->table_links)->result();
    }
    
    
    // insert data
    function insert($data)
    {
        $this->db->insert($this->table_links, $data);
    }

    // update data
    function update($id, $data)
    {
        $this->db->where($this->id, $id);
        $this->db->update($this->table_links, $data);
    }

    // delete data
    function delete($id)
    {
        $this->db->where($this->id, $id);
        $this->db->delete($this->table_links);
    }

}
