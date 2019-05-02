<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

public function __construct() {
	parent::__construct();
        //isAuthorized();
        // load default model
        $this->load->library('form_validation');
        $this->load->model('auth_model');
	}

	public function index()
	{
		if ($this->session->has_userdata('logged_in')) {
            redirect(base_url().'register', 'refresh');
            exit;
		}
		$this->data['assets_path'] = base_url() . 'lib/';
        $this->data['csrf_name'] = $this->security->get_csrf_token_name();
        $this->data['csrf_hash'] = $this->security->get_csrf_hash();
        $this->load->view('Login/index', $this->data);
	}

	public function loginaction() {
        $this->form_validation->set_rules('username', 'Username', 'required');
        $this->form_validation->set_rules('password', 'Password', 'required');

        if ($this->form_validation->run() == FALSE) {
            $this->session->set_flashdata('message', validation_errors());
            redirect(base_url().'login' ,'login');
            exit;
        }

        $user_login = $this->input->post('username');
        $user_password = $this->input->post('password');

        try {
            $userdata = $this->auth_model->cek_username($user_login);

            //if (password_verify($user_password, $userdata->user_password)) {
			if (md5($user_password)==$userdata->passmd5) {
                // verified!
                $this->session->set_userdata('logged_in', $userdata);

                $this->session->user_agent = $_SERVER['HTTP_USER_AGENT'];
                $this->session->ip_address = $_SERVER['REMOTE_ADDR'];
                redirect(base_url() .'register', 'refresh');
                exit;
            } else {
                $this->session->set_flashdata('message', 'Username atau Password Salah');
                redirect(base_url() .'login');
                exit;
            }
        } catch (Exception $exc) {
            $this->session->set_flashdata('message', $exc->getTraceAsString());
            redirect(base_url().'login');
            exit;
        }
    }

    public function logout() {
        $this->session->sess_destroy();
        redirect(base_url() .'login');
        exit;
    }

}
