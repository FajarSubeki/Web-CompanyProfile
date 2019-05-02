<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Api_model extends CI_Model {
    
       
    public function __construct() {
        parent::__construct();
    }
    
    function get_by_nopermohonan($nomor) {
        $this->db->where('api_nopermohonan', $nomor);
        return $this->db->get('t_pemohon')->row();
    }
    
     function get_by_no_agenda($nomor) {
        $this->db->where('api_no_agenda', $nomor);
        return $this->db->get('t_pemohon')->row();
    }
    
    //cek lhpp
    function get_lhpp_data($nomor) {
        $this->db->select('*');
        $this->db->from('t_pemohon');
        $this->db->where('api_nopermohonan', $nomor);
		$this->db->or_where('id_pemohon', $nomor);

        return $this->db->get()->row();
    }
    function get_alasan($nomor) {
        $this->db->select('*');
        $this->db->from('t_hasil_permohonan_api');
        $this->db->where('nomorPermohonan', $nomor);

        return $this->db->get()->row();
    }
    
    function get_by_salinan_slo($nomor) {
        $this->db->select('*');
        $this->db->from('t_lampiran');
        $this->db->join('t_pemohon', 't_pemohon.id_pemohon = t_lampiran.id_pemohon');
        $this->db->join('t_hasil_permohonan_api', 't_hasil_permohonan_api.nomorPermohonan = t_pemohon.api_nopermohonan');
        $this->db->where('t_hasil_permohonan_api.noRegistrasiSLO', $nomor);

        return $this->db->get()->row();
    }
    
    function pdf($nomor) {
        $this->db->select('*');
        $this->db->from('t_pemohon');
        $this->db->join('t_hasil_permohonan_api', 't_hasil_permohonan_api.nomorPermohonan = t_pemohon.api_nopermohonan');
        $this->db->where('t_hasil_permohonan_api.noRegistrasiSLO', $nomor);

        return $this->db->get()->row();
    }
    
    function cek_status($nomor) {
        $this->db->where('nopermohonan', $nomor);
        return $this->db->get('t_pemohon')->row();
    }
    
    // insert data
    function insert_status_permohonan($data)
    {
        $this->db->insert('t_hasil_permohonan_api', $data);
    }

    function insert_biodata($data)
    {
        $this->db->insert('t_cetak_ulang_slo_api', $data);
    }
    function update_t_pemohon($id,$data)
    {
        $this->db->where('api_nopermohonan', $id);
        $this->db->update('t_pemohon', $data);
         $this->db->where('api_no_agenda', $id);
        $this->db->update('t_pemohon', $data);
    }
    

}
