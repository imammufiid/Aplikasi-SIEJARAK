<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Rute extends CI_Controller
{

	private $guru_id;

	public function __construct()
	{
		parent::__construct();
		$this->sys->check_is_login();
		$this->load->library('datatables', null, 'dt');
		$this->load->model('m_datamaster', 'dm');
		$this->load->model('m_rute', 'm');
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
		print_r($this->dt->generate_json('v_rute'));
	}

	public function save()
	{
		$response = $this->m->rute_save();
		if ($response) {
			echo json_encode(array('status' => true, 'msg' => 'Berhasil disimpan!'));
		} else {
			echo json_encode(array('status' => false, 'msg' => 'Gagal menyimpan!'));
		}
	}

	public function delete()
	{
		$this->crud->set_table('graph');
		$this->crud->where('no');
		echo $this->crud->crud('delete');
	}

	public function modal($view)
	{
		$data['rute'] = $this->db->where('no', @$_GET['id'])->get('graph')->row();
		$data['dlt'] = $this->db->where('no', @$_GET['id'])->get('v_rute')->row();
		$data['kota'] = $this->dm->kota_get();
		$this->sys->render_metronic_modal($view, $data);
	}

	// ============== get lat & long =========================
	function get_coordinates($city, $street, $province)
	{
		$address = urlencode($city . ',' . $street . ',' . $province);
		$url = "http://maps.google.com/maps/api/geocode/json?address=$address&sensor=false&region=Poland";
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_PROXYPORT, 3128);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
		$response = curl_exec($ch);
		curl_close($ch);
		$response_a = json_decode($response);
		$status = $response_a->status;

		if ($status == 'ZERO_RESULTS') {
			return FALSE;
		} else {
			$return = array('lat' => $response_a->results[0]->geometry->location->lat, 'long' => $long = $response_a->results[0]->geometry->location->lng);
			return $return;
		}
	}

	// ==================== get distance & duration =====================
	function GetDrivingDistance($lat1, $lat2, $long1, $long2)
	{
		$url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=" . $lat1 . "," . $long1 . "&destinations=" . $lat2 . "," . $long2 . "&mode=driving&language=pl-PL";
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_PROXYPORT, 3128);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
		$response = curl_exec($ch);
		curl_close($ch);
		$response_a = json_decode($response, true);
		$dist = $response_a['rows'][0]['elements'][0]['distance']['text'];
		$time = $response_a['rows'][0]['elements'][0]['duration']['text'];

		return array('distance' => $dist, 'time' => $time);
	}

	// ============== examp ========================
	// $coordinates1 = $this->get_coordinates('Tychy', 'Jana Pawła II', 'Śląskie');
	// $coordinates2 = $this->get_coordinates('Lędziny', 'Lędzińska', 'Śląskie');
	// if ( !$coordinates1 || !$coordinates2 )
	// {
	// 		echo 'Bad address.';
	// }
	// else
	// {
	// 		$dist = $this->GetDrivingDistance($coordinates1['lat'], $coordinates2['lat'], $coordinates1['long'], $coordinates2['long']);
	// 		echo 'Distance: <b>'.$dist['distance'].'</b><br>Travel time duration: <b>'.$dist['time'].'</b>';
	// }
}

/* End of file Guru.php */
/* Location: ./application/modules/guru/controllers/Guru.php */
