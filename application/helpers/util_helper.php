<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

if (!function_exists('isAuthorized')) {

    function isAuthorized() {
        $CI = & get_instance();  //get instance, access the CI superobject
        if ($CI->session->user_agent === $_SERVER['HTTP_USER_AGENT'] && $CI->session->ip_address === $_SERVER['REMOTE_ADDR'] && $CI->session->has_userdata('logged_in')) {
            return true;
        } else {
            redirect(base_url() . 'auth/doLogout');
            return false;
        }
    }

}

if (!function_exists('shortenString')) {

    function shortenString($string, $wordsreturned)
    /*  Returns the first $wordsreturned out of $string.  If string
      contains fewer words than $wordsreturned, the entire string
      is returned.
     */ {
        $string = preg_replace('/(\s)+/', ' ', $string);
        $retval = $string;      //  Just in case of a problem

        $array = explode(" ", $string);
        if (count($array) <= $wordsreturned)
        /*  Already short enough, return the whole thing
         */ {
            $retval = $string;
        } else
        /*  Need to chop of some words
         */ {
            array_splice($array, $wordsreturned);
            $retval = implode(" ", $array) . " ...";
        }
        return $retval;
    }

}

if (!function_exists('toIndoDate')) {

    function toIndoDate($datawaktu) {
        $tanggal = explode(' ', $datawaktu);
        $waktu = explode('-', $tanggal[0]);
        if ($waktu[1] == '01') { //jika 01 maka januari
            $bulan = 'JAN';
        } elseif ($waktu[1] == '02') {
            $bulan = 'FEB';
        } elseif ($waktu[1] == '03') {
            $bulan = 'MAR';
        } elseif ($waktu[1] == '04') {
            $bulan = 'APR';
        } elseif ($waktu[1] == '05') {
            $bulan = 'MEI';
        } elseif ($waktu[1] == '06') {
            $bulan = 'JUN';
        } elseif ($waktu[1] == '07') {
            $bulan = 'JUL';
        } elseif ($waktu[1] == '08') {
            $bulan = 'AGU';
        } elseif ($waktu[1] == '09') {
            $bulan = 'SEP';
        } elseif ($waktu[1] == '10') {
            $bulan = 'OKT';
        } elseif ($waktu[1] == '11') {
            $bulan = 'NOV';
        } elseif ($waktu[1] == '12') {
            $bulan = 'DES';
        } else {
            $bulan = '00';
        }
        return "$waktu[2] $bulan $waktu[0]";
    }
}


if ( ! function_exists('password_verify'))
{
	/**
	 * password_verify()
	 *
	 * @link	http://php.net/password_verify
	 * @param	string	$password
	 * @param	string	$hash
	 * @return	bool
	 */
	function password_verify($password, $hash)
	{
		if (strlen($hash) !== 60 OR strlen($password = crypt($password, $hash)) !== 60)
		{
			return FALSE;
		}

		$compare = 0;
		for ($i = 0; $i < 60; $i++)
		{
			$compare |= (ord($password[$i]) ^ ord($hash[$i]));
		}

		return ($compare === 0);
	}
}
