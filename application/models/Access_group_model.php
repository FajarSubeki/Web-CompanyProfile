<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Access_group_model extends CI_Model {
    
     
    public function __construct() {
        parent::__construct();
    }
        
    function cek_akses_user_create() {
        $access = $this->session->logged_in->description; 
        if($access=="CDU" OR $access=="C" OR $access=="CU" OR $access=="CD" ){
           
        }else{
           $this->session->set_flashdata('message', '================================= User Akses Tidak Di Izinkan Create Data =================================');
           redirect(site_url('account/dashboard/')); 
        }
        
    }
    
    function cek_akses_user_update() {
        $access = $this->session->logged_in->description; 
        if($access=="CDU" OR $access=="DU" OR $access=="U" OR $access=="CU" ){
           
        }else{
           $this->session->set_flashdata('message', '================================= User Akses Tidak Di Izinkan Update Data =================================');
           redirect(site_url('account/dashboard/')); 
        }
        
    }
    
    function cek_akses_user_delete() {
        $access = $this->session->logged_in->description; 
        if($access=="CDU" OR $access=="D" OR $access=="DU" OR $access=="CD" ){
           
        }else{
           $this->session->set_flashdata('message', '================================= User Akses Tidak Di Izinkan Delete Data ================================='); 
           redirect(site_url('account/dashboard/')); 
        }
        
    }
    function cek_akses_user() {
        $access = $this->session->logged_in; 
        if($access!=NULL){
           
        }else{
           $this->session->set_flashdata('message', '================================= Akses Tidak Di Izinkan ================================='); 
           redirect(site_url('login')); 
        }
        
    }
    function cek_admin() {
        $access = $this->session->logged_in->group_id; 
        if($access==1){
           
        }else{
           $this->session->set_flashdata('message', '================================= Aplikasi Tidak Mengizinkan ================================='); 
           redirect(site_url('account/dashboard/')); 
        }
        
    }
}
