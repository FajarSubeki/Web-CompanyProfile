<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard_model extends CI_Model {

    public $default_table = 'posts';
    public $id = 'post_id';

    public function __construct() {
        parent::__construct();
    }

    function count_by_type($type) {
        $this->db->where('post_type', $type);
        $this->db->from($this->default_table);
        return $this->db->count_all_results();
    }
    
    
    //------ for frontend function
    function get_headline_post($limit) {
        $this->db->where('headline', 'Y');
        $this->db->where('published_at <', date('Y-m-d'));
        $this->db->limit($limit);
        $this->db->order_by('published_at', 'desc');
        return $this->db->get($this->default_table)->result();
    }
    
    function get_post_by_category($type, $term_id, $limit, $include_headline=FALSE) {
        if (!$include_headline) {
            $this->db->where('headline', 'N');
        }
        if ($term_id != 'all') {
            $this->db->where('term_id', $term_id);
        }
        $this->db->where('post_type', $type);        
        $this->db->limit($limit);
        
        $this->db->order_by('published_at', 'DESC');
        return $this->db->get($this->default_table)->result();
    }
    
    function get_berita_kansar($limit) {
        $this->db->join('widget_kansar k', 'k.kansar_id = b.kansar_id');        
        $this->db->limit($limit);
        $this->db->order_by('berita_date', 'DESC');
        return $this->db->get('widget_berita_kansar b')->result();
    }
    
    function get_post_by_slug($slug) {
        $this->db->where('slug', $slug);
//        $this->db->where('published_at <', date('Y-m-d'));
        return $this->db->get($this->default_table)->row();
    }
	

}
