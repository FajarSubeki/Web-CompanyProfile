<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Post_model extends CI_Model {

    var $table = 'posts';
    var $column = array('title', 'slug', 'created_at', 'post_status', 'user_id');
    var $order = array('post_id' => 'desc');
    public $default_table = 'posts';
    public $id = 'post_id';

    public function __construct() {
        parent::__construct();
    }

    function get_posts_by_type($type) {
        $this->db->where('post_type', $type);
        $this->db->order_by('created_at', 'DESC');
        return $this->db->get($this->default_table)->result();
    }

    //ajax Mulai Data Tablees
    private function _get_datatables_query($postType) {

        $this->db->where('post_type', $postType);
        $this->db->from($this->table);

        $i = 0;

        foreach ($this->column as $item) {
            if ($_GET['search']['value'])
                ($i === 0) ? $this->db->like($item, $_GET['search']['value']) : $this->db->or_like($item, $_GET['search']['value']);
            $column[$i] = $item;
            $i++;
        }

        if (isset($_POST['order'])) {
            $this->db->order_by($column[$_GET['order']['0']['column']], $_GET['order']['0']['dir']);
        } else if (isset($this->order)) {
            $order = $this->order;
            $this->db->order_by(key($order), $order[key($order)]);
        }
    }

    function get_datatables($postType) {
        $this->_get_datatables_query($postType);
        if ($_GET['length'] != -1)
            $this->db->limit($_GET['length'], $_GET['start']);
        $this->db->where('post_type', $postType);
        $query = $this->db->get();
        return $query->result();
    }
    
    //ajax Mulai Data Tablees
    private function _get_datatables_query_filter($postType,$filter) {

        $this->db->where('headline', $filter);
        $this->db->where('post_type', $postType);
        $this->db->from($this->table);

        $i = 0;

        foreach ($this->column as $item) {
            if ($_GET['search']['value'])
                ($i === 0) ? $this->db->like($item, $_GET['search']['value']) : $this->db->or_like($item, $_GET['search']['value']);
            $column[$i] = $item;
            $i++;
        }

        if (isset($_POST['order'])) {
            $this->db->order_by($column[$_GET['order']['0']['column']], $_GET['order']['0']['dir']);
        } else if (isset($this->order)) {
            $order = $this->order;
            $this->db->order_by(key($order), $order[key($order)]);
        }
    }
    
    function get_datatables_filter($postType,$filter) {
        $this->_get_datatables_query_filter($postType,$filter);
        if ($_GET['length'] != -1)
            $this->db->limit($_GET['length'], $_GET['start']);
        $this->db->where('headline', $filter);
        $this->db->where('post_type', $postType);
        $query = $this->db->get();
        return $query->result();
    }

    function count_filtered($postType) {
        $this->_get_datatables_query($postType);
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function count_all($postType) {
        $this->db->where('post_type', $postType);
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }   
    
    function count_filtered_filter($postType,$filter) {
        $this->_get_datatables_query_filter($postType,$filter);
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function count_all_filter($postType,$filter) {
        $this->db->where('headline', $filter);
        $this->db->where('post_type', $postType);
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

    //ajax selesai
    //all kategori
    function get_kategori($id) {
        $this->db->where('post_id', $id);
        return $this->db->get('post_term')->result();
    }

    //get kategori
    function get_all_terms($type) {
        $this->db->where('type', $type);
        return $this->db->get('terms')->result();
    }

    function get_post_term($id) {
        $this->db->where('post_id', $id);
        return $this->db->get('post_term')->result();
    }

    //all kategori
    function get_post_meta($id, $key) {
        $this->db->where('meta_key', $key);
        $this->db->where('post_id', $id);
        return $this->db->get('post_meta')->row();
    }

    //get id post
    function get_by_id_post($id) {
        $this->db->where($this->id, $id);
        return $this->db->get($this->default_table)->row();
    }

    // insert data post
    function insert($data) {
        $this->db->insert($this->default_table, $data);
    }

    // insert kategori
    function insert_kategori($data) {
        $this->db->insert('post_term', $data);
    }

    // insert Meta
    function insert_meta($data) {
        $this->db->insert('post_meta', $data);
    }

    // update data post
    function update($id, $data) {
        $this->db->where($this->id, $id);
        $this->db->update($this->default_table, $data);
    }

    // delete data
    function delete($id) {
        $this->db->where($this->id, $id);
        $this->db->delete($this->default_table);
    }

    // delete Kategori
    function delete_kategori($id) {
        $this->db->where($this->id, $id);
        $this->db->delete('post_term');
    }

    // delete Meta
    function delete_meta($id) {
        $this->db->where($this->id, $id);
        $this->db->delete('post_meta');
    }

    //------ for frontend function
    function get_headline_post($limit) {
        $this->db->where('headline', 'Y');
        $this->db->where('date(published_at) <=', date('Y-m-d'));
        $this->db->limit($limit);
        $this->db->order_by('published_at', 'desc');
        return $this->db->get($this->default_table)->result();
//        $this->db->get($this->default_table)->result();
//        echo $this->db->last_query();exit;
        
    }

    function get_post_by_category($type, $term_id, $limit, $include_headline = FALSE) {
        if (!$include_headline) {
            $this->db->where('headline', 'N');
        }
        if ($term_id != 'all') {
            $this->db->where('pt.term_id', $term_id);
        }
        $this->db->join('post_term pt', 'pt.post_id = p.post_id', 'LEFT');
        $this->db->where('p.post_type', $type);
        $this->db->limit($limit);

        $this->db->order_by('p.published_at', 'DESC');
        return $this->db->get('posts p')->result();
    }

    function get_berita_kansar($limit) {
        $this->db->join('widget_kansar k', 'k.kansar_id = b.kansar_id');
        $this->db->limit($limit);
        $this->db->order_by('berita_date', 'DESC');
        return $this->db->get('widget_berita_kansar b')->result();
    }

    function get_post_by_slug($slug) {
        $this->db->where('slug', $slug);
        $this->db->where('date(published_at) <=', date('Y-m-d'));
        return $this->db->get($this->default_table)->row();
    }
    
    function get_berita_kategori() {
        $this->db->where('type', 'berita');
        $this->db->limit(4);
        return $this->db->get('terms')->result();
    }
    
    function get_posts_by_type_limit($type, $limit) {
        $this->db->where('post_type', $type);
        $this->db->limit($limit);
        $this->db->order_by('created_at', 'DESC');
        return $this->db->get($this->default_table)->result();
    }
    
    function get_arsip_by_type($type, $limit, $firstRow) {
        $this->db->where('p.post_type', $type);
        $this->db->limit($limit, $firstRow);

        $this->db->order_by('p.published_at', 'DESC');
        return $this->db->get('posts p')->result();
    }

}
