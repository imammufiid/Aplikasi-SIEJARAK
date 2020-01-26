<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_datamaster extends CI_Model {

	function kota_get() {
		$db = $this->db->get('jalan')->result();
		return $db;
	}

}

/* End of file M_datamaster.php */
/* Location: ./application/models/M_datamaster.php */