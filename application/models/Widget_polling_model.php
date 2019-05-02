<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Widget_polling_model extends CI_Model {

    public $question_table = 'widget_polling';
    public $answer_table = 'widget_polling_answer';

    public function __construct() {
        parent::__construct();
    }

    function get_poll_question() {
        $this->db->where('active', 'Y');
        return $this->db->get($this->question_table)->row();
    }

    function get_poll_answer($polling_id) {
        $this->db->where('polling_id', $polling_id);
        return $this->db->get($this->answer_table)->result();
    }

    function update_hit_answer($answer) {
//        echo "update widget_polling_answer set hit = hit + 1 where polling_answer_id = ".$this->db->escape($answer);exit;
        return $this->db->query("update widget_polling_answer set hit = hit + 1 where polling_answer_id = ".$this->db->escape($answer));
    }

}
