<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Pemasang_instalasi_model extends CI_Model {
    
    public $default_table = 't_pemasang_instalasi';
    public $id = 'id_pemohon';
    
    public function __construct() {
        parent::__construct();
    }
    
   function get_all()
    {
        $this->db->order_by('id_pemasang_instalasi', 'DESC');
        return $this->db->get($this->default_table)->result();
    }
    
       
    function get_by_id_pemasang_instalasi($id)
    {
        $this->db->where($this->id, $id);
        return $this->db->get($this->default_table)->row();
    }
     
    // insert data
    function insert($data)
    {
        $this->db->insert($this->default_table, $data);
    }

    
    // update data
    function update($id, $data) {
        $this->db->where($this->id, $id);
        $this->db->update($this->default_table, $data);
    }

    // delete data
    function delete($id)
    {
        $this->db->where($this->id, $id);
        $this->db->delete($this->default_table);
    }
    
    function apiSBU() {

	$consumerId = "sde";
	$secretKey = "CJXyfM3L";

	//Computes timestamp
	date_default_timezone_set('UTC');
	$tStamp = strval(time()-strtotime('1970-01-01 00:00:00'));
	//Computes signature by hashing the salt with the secret key as the key
	$signature = hash_hmac('sha256', $consumerId."&".$tStamp, $secretKey, true);

	// base64 encode…
	$encodedSignature = base64_encode($signature);

	$header[] = "X-cons-id:".$consumerId;
	$header[] = "X-timestamp:".$tStamp;
	$header[] = "X-signature:".$encodedSignature;

	$postData = [
		'kota_id' => $this->input->post('kotapemanfaatan', TRUE),
	];

	$ch = curl_init();
        $ch = curl_init();
		curl_setopt ($ch, CURLOPT_URL, 'https://slodjk.esdm.go.id/api/ref/sbu'); 
		//curl_setopt ($ch, CURLOPT_URL, 'http://localhost/slo/new/api/ref/sbu'); 
		curl_setopt ($ch, CURLOPT_HEADER, 0); 
		curl_setopt ($ch, CURLOPT_HTTPHEADER, $header);
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt ($ch, CURLOPT_POST, 1);
		curl_setopt ($ch, CURLOPT_POSTFIELDS, json_encode($postData));
		curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, 0);
		$tmp = curl_exec ($ch); 
		curl_close ($ch);
		$data = json_decode($tmp);
		//echo $data->permohonan[1]->no_permohonan;
		//echo $tmp;
				
		//        $books = json_decode($result);
		//
		//        $someArray = $books;
		//        foreach ($someArray as $key => $value) {
		//            if($number==$value->kode){
		//                    $data = $value->nama;
		//		}
		//        }
				
				return $result;
	}

}
