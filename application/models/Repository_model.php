<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Repository_model extends CI_Model {
    
    public $table_repository = 'widget_repository';
    public $id = 'repository_id';
    
    public function __construct() {
        parent::__construct();
    }
    
    function get_menu_by_type($type) {
        $this->db->where('type', $type);
        $this->db->order_by('parent', 'DESC');
        $this->db->order_by('repository_id', 'ASC');
        return $this->db->get($this->table_repository)->result();
    }
    
    function get_menu_by_id($repository_id) {
        $this->db->where('repository_id', $repository_id);
        return $this->db->get($this->table_repository)->row();
    }
    
    function get_menu_by_url($url) {
        $this->db->where('url', $url);
        return $this->db->get($this->table_repository)->row();
    }
    
    function get_menu_by_parent($repository_parent_id) {
        $this->db->where('repository_parent_id', $repository_parent_id);
        $this->db->order_by('sort_order', 'ASC');
        return $this->db->get($this->table_repository)->result();
    }
    //kategori type
    function get_all_terms($type) {
        $this->db->where('type', $type);
        return $this->db->get('terms')->result();
    }
    
    function get_menu_type($typeId)
    {
        $this->db->where('type', $typeId);
        return $this->db->get($this->table_repository)->result();
    }
    function get_by_id_repository($id)
    {
        $this->db->where('repository_id', $id);
        return $this->db->get($this->table_repository)->row();
    }
        
    //get tabel menu browse
    function get_parent_all($type)
    {
        $this->db->where('type', $type);
        $this->db->order_by('repository_id', 'ASC');
        return $this->db->get($this->table_repository)->result();
    }
    function get_down_parent_all($type)
    {
        $this->db->where('parent', 'N');
        $this->db->where('type', $type);
        $this->db->order_by('sort_order', 'ASC');
        return $this->db->get($this->table_repository)->result();
    }
    //get by slug
    function get_repository_by_slug($slug)
    {
        $this->db->where('slug', $slug);
        return $this->db->get($this->table_repository)->row();
    }
    
    
    // insert data
    function insert($data)
    {
        $this->db->insert($this->table_repository, $data);
    }

    // update data
    function update($id, $data)
    {
        $this->db->where($this->id, $id);
        $this->db->update($this->table_repository, $data);
    }

    // delete data
    function delete($id)
    {
        $this->db->where($this->id, $id);
        $this->db->delete($this->table_repository);
    }

}
