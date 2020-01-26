<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_lokasi extends CI_Model {

	function coach_save() {
		$this->db->set($_POST);
		if (!empty(@$_POST['id'])) {
			$this->db->where('id', @$_POST['id']);
			$this->db->update('jalan');
		} else {
			$this->db->insert('jalan');
		}

		return $this->db->affected_rows();
	}

}

/* End of file M_guru.php */
/* Location: ./application/modules/guru/models/M_guru.php */