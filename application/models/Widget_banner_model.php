<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Widget_banner_model extends CI_Model {

    public $default_table = 'widget_banner';

    public function __construct() {
        parent::__construct();
    }

    function get_banner() {
        $this->db->where('active', 'Y');        
        $this->db->order_by('type', 'ASC');        
        $this->db->order_by('position', 'ASC');        
        $result = $this->db->get($this->default_table)->result();
        
        $i = 0;
        $type = "";
        foreach ($result as $v) {
            $type != $v->type ? $i = 0 : $i++;
            
            $banner[$v->type][$i]['name'] = $v->name;
            $banner[$v->type][$i]['image'] = $v->image;
            $banner[$v->type][$i]['url'] = $v->url;
            
            $type = $v->type;
        }
        
        return $banner;
    }

}
