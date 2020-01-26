<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Lokasi extends CI_Controller
{

	private $guru_id;

	public function __construct()
	{
		parent::__construct();
		$this->sys->check_is_login();
		$this->load->library('datatables', null, 'dt');
		$this->load->model('m_datamaster', 'dm');
		$this->load->model('m_lokasi', 'm');
		$this->load->model('m_crud', 'crud');
	}

	public function index()
	{
		$this->sys->add_javascript_top_custom('assets/plugins/datatables/datatables.min.js');
		$this->sys->add_css_custom('assets/plugins/datatables/datatables.min.css');
		$this->sys->render_metronic('index');
	}

	public function fetch()
	{
		print_r($this->dt->generate_json('jalan'));
	}

	public function save()
	{
		$response = $this->m->coach_save();
		if ($response) {
			echo json_encode(array('status' => true, 'msg' => 'Berhasil disimpan!'));
		} else {
			echo json_encode(array('status' => false, 'msg' => 'Gagal menyimpan!'));
		}
	}

	public function delete(){
		$this->crud->set_table('jalan');
		$this->crud->where('id');
		echo $this->crud->crud('delete');
	}

	public function modal($view)
	{
		$data['lokasi'] = $this->db->where('id', @$_GET['id'])->get('jalan')->row();

		$this->sys->render_metronic_modal($view, $data);
	}

	
}

/* End of file Guru.php */
/* Location: ./application/modules/guru/controllers/Guru.php */
