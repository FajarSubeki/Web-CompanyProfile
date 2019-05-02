<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Permohonan_model extends CI_Model {

    public $default_table = 't_pemohon';
    public $id = 'id_pemohon';

    public function __construct() {
        parent::__construct();
    }

    function get_all() {
        $this->db->order_by('id_pemohon', 'DESC');
        return $this->db->get($this->default_table)->result();
    }
    function get_all_key($key) {
        $this->db->where("no_register LIKE '%$key%' OR nama LIKE '%$key%'");
        $this->db->order_by('id_pemohon', 'DESC');
        return $this->db->get($this->default_table)->result();
    }
    function get_all_10() {
        $this->db->order_by('id_pemohon', 'DESC');
        return $this->db->get($this->default_table, 10, 0)->result();
    }

	function getNextChar($character) {
		if ($character == '9') {
			return 'A';
		}
		else if ($character == 'Z') {
			return '0';
		}
		else {
			return chr( ord($character) + 1);
		}
	}

	function getNextCode($code) {
		// reverse, make into array
		$codeRevArr = str_split(strrev($code));

		foreach($codeRevArr as &$character) {
			$character = $this->getNextChar($character);
			// keep going down the line if we're moving from 'Z' to '0'
			if ($character != '0') {
				break;
			}
		}

		// array to string, then reverse again
		$newCode = strrev(implode('', $codeRevArr));
		return $newCode;
	}

	function get_last_id_pemohon() {
		$this->db->select('id_pemohon');
        $this->db->order_by('id_pemohon', 'DESC');
        $result = $this->db->get($this->default_table, 1, 0)->row();
		if ($result){
			return $result->id_pemohon;
		} else {
			return 1;
		}
    }

	function get_next_id_pemohon() {
		$lastcode = $this->get_last_id_pemohon();
        $nextcode = $this->getNextCode($lastcode);
		return $nextcode;
    }

    function get_by_id_user($id) {
		
        $this->db->where('id_user', $id);
		$this->db->order_by('id_pemohon', 'DESC');
        return $this->db->get($this->default_table, 10, 0)->result();
    }
    

    function get_by_id_admin() {
		
		$this->db->order_by('id_pemohon', 'DESC');
        return $this->db->get($this->default_table, 10, 0)->result();
    }

    function get_by_id_pemohon($id) {
        $this->db->where($this->id, $id);
        return $this->db->get($this->default_table)->row();
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

    function no_registrasi($table) {
        $q = $this->db->query("SELECT MAX(RIGHT(no_register,4)) AS idmax FROM " . $table);
        $kd = ""; //kode awal
        if ($q->num_rows() > 0) { //jika data ada
            foreach ($q->result() as $k) {
                $tmp = ((int) $k->idmax) + 1; //string kode diset ke integer dan ditambahkan 1 dari kode terakhir
                $kd =  sprintf("%s", $tmp); //kode ambil 4 karakter terakhir
            }
        } else { //jika data kosong diset ke kode awal
            $kd = "0001";
        }
        $kar = "SDE-".date("dmy"); //karakter depan kodenya
        //gabungkan string dengan kode yang telah dibuat tadi
        return $kar . $kd;
    }


}
