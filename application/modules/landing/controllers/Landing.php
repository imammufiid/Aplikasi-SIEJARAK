<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Landing extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		// $this->sys->check_is_login();
		$this->load->model('m_datamaster', 'dm');
	}

	public function index()
	{
		$data['kota'] = $this->dm->kota_get();
		$this->sys->render_metronic_landing('landing/index', $data);
	}

	public function get_jarak()
	{
		
		$latitude1 = -8.118667;
		$longitude1 = 112.202635;
		// $latitude1 = $this->input->post('latitude');
		// $longitude1 = $this->input->post('longitude');

		$latitude2 = -7.943795;
		$longitude2 = 112.659256;

		$dataJson = file_get_contents("https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=" . $latitude1 . "," . $longitude1 . "&destinations=" . $latitude2 . "," . $longitude2 . "&key=AIzaSyDKCqDcfUH-_Mk1hglPTOjkleBImMFmxPk");

		$data = json_decode($dataJson, true);
		// $nilaiJarak = $data['rows'][0]['elements'][0]['distance']['text'];

		echo $dataJson;
	}
}

/* End of file Dashboard.php */
/* Location: ./application/controllers/administrator/Dashboard.php */
