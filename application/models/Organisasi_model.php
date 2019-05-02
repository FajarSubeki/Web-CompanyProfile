<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Organisasi_model extends CI_Model {

    public $default_table = 'widget_organisasi';
    public $id = 'organisasi_id';

    public function __construct() {
        parent::__construct();
    }

    function get_all() {
        $this->db->order_by('organisasi_id', 'DESC');
        $this->db->join('widget_pegawai', 'widget_pegawai.pegawai_id = widget_organisasi.pegawai_id', 'left');
        return $this->db->get($this->default_table)->result();
    }

    function get_all_parent() {
        $this->db->order_by('organisasi_id', 'DESC');
        $this->db->where('parent_id', NULL);
        $this->db->or_where('parent_id', 0);
        return $this->db->get($this->default_table)->result();
    }

    function get_pegawai_all() {
        $this->db->order_by('pegawai_id', 'DESC');
        return $this->db->get('widget_pegawai')->result();
    }

    function get_by_id_organisasi($id) {
        $this->db->where($this->id, $id);
        return $this->db->get($this->default_table)->row();
    }

    function get_organisasi_by_slug($slug) {
        $org = "";
        $slug = xss_clean($slug);
        $this->db->where('slug', $slug);
        $o = $this->db->get('widget_organisasi')->row();

        $this->db->where('organisasi_chart_id', $o->organisasi_id);
        $this->db->join('widget_pegawai p', 'p.pegawai_id = o.pegawai_id');
        $widget = $this->db->get('widget_organisasi o')->result();
//        echo $this->db->last_query();exit;

        foreach ($widget as $v) {
            if (empty($v->parent_id) || $v->parent_id == 0) {
                $org['parent']['id'] = $v->organisasi_id;
                $org['parent']['name'] = $v->name;
                $org['parent']['pegawai'] = $v->nama;
                $org['parent']['description'] = $v->description;
            } else {
//                echo $v->name . ' >> ' . $v->parent_id;
                $org['child'][$v->organisasi_id]['id'] = $v->organisasi_id;
                $org['child'][$v->organisasi_id]['name'] = $v->name;
                $org['child'][$v->organisasi_id]['pegawai'] = $v->nama;
                $org['child'][$v->organisasi_id]['parent'] = $v->parent_id;
            }
        }

        return $org;
    }

    // insert data
    function insert($data) {
        $this->db->insert($this->default_table, $data);
    }

    // update data
    function update($id, $data) {
        $this->db->where($this->id, $id);
        $this->db->update($this->default_table, $data);
    }

    // delete data
    function delete($id) {
        $this->db->where($this->id, $id);
        $this->db->delete($this->default_table);
    }

}
