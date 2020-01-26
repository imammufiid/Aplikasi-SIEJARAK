<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_rute extends CI_Model {

	function rute_save() {
		$this->db->set($_POST);
		if (!empty(@$_POST['no'])) {
			$this->db->where('no', @$_POST['no']);
			$this->db->update('graph');
		} else {
			$this->db->insert('graph');
		}

		return $this->db->affected_rows();
	}

}

/* End of file M_guru.php */
/* Location: ./application/modules/guru/models/M_guru.php */