<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Agenda_model extends CI_Model {
    
    public $default_table = 'posts';
    public $id = 'post_id';
    
    public function __construct() {
        parent::__construct();
    } 
    function get_posts_by_type($type) {
        $this->db->select('*');
        $this->db->join('events', 'events.post_id = posts.post_id','right');
                
        return $this->db->get($this->default_table)->result();
    }
    //all kategori
    function get_kategori($id)
    {
        $this->db->where('post_id', $id);
        return $this->db->get('post_term')->result();
    }
    //get kategori
    function get_all_terms($type)
    {
        $this->db->where('type', $type);
        return $this->db->get('terms')->result();
    }
    function get_post_term($id)
    {
        $this->db->where('post_id', $id);
        return $this->db->get('post_term')->result();
    }
    //all kategori
    function get_post_meta($id,$key)
    {
        $this->db->where('meta_key', $key);
        $this->db->where('post_id', $id);
        return $this->db->get('post_meta')->row();
    }
    //get id post
    function get_by_id_post($id)
    {
        $this->db->where($this->id, $id);
        return $this->db->get($this->default_table)->row();
    }
    //get agenda id post
    function get_agenda_by_id_post($id)
    {
        $this->db->where($this->id, $id);
        return $this->db->get('events')->row();
    }
    // insert data post
    function insert($data)
    {
        $this->db->insert($this->default_table, $data);
    }
     // insert kategori
    function insert_kategori($data)
    {
        $this->db->insert('post_term', $data);
    }
     // insert Meta
    function insert_meta($data)
    {
        $this->db->insert('post_meta', $data);
    }
    // insert Agenda
    function insert_agenda($data)
    {
        $this->db->insert('events', $data);
    }
    

    // update data post
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
    // delete Kategori
    function delete_kategori($id)
    {
        $this->db->where($this->id, $id);
        $this->db->delete('post_term');
    }
    // delete Meta
    function delete_meta($id)
    {
        $this->db->where($this->id, $id);
        $this->db->delete('post_meta');
    }
    // delete Agenda
    function delete_agenda($id)
    {
        $this->db->where($this->id, $id);
        $this->db->delete('events');
    }
    
    
    

}
