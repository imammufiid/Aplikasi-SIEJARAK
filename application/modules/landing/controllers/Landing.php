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
		$asal = $this->input->post('asal');
		$tujuan = $this->input->post('tujuan');
		$qry_inp =  'SELECT id_kota_asal AS "0", id_kota_tujuan AS "1", jarak AS "2" FROM graph';
		$query = $this->db->query($qry_inp)->result_array();

		$path = $this->_dijkstra($query, $asal, $tujuan);
		$hasil = "";
		$i = 1;
		foreach ($path as $key => $val) {
			$qry_jln =  'SELECT id_jalan, nama_jalan FROM jalan where id=' . $val;
			$jalan = $this->db->query($qry_jln)->result_array();;
			$hasil .= '
				<tr>
					<td>' . $i . '</td>
					<td>' . $jalan[0]['nama_jalan'] . '</td>
				</tr>

		';
			$i++;
		}
		return $hasil;
	}

	function _dijkstra($graph_array, $source, $target)
	{
		$vertices = array();
		$neighbours = array();
		foreach ($graph_array as $edge) {
			array_push($vertices, $edge[0], $edge[1]);
			$neighbours[$edge[0]][] = array("end" => $edge[1], "cost" => $edge[2]);
			$neighbours[$edge[1]][] = array("end" => $edge[0], "cost" => $edge[2]);
		}
		$vertices = array_unique($vertices);

		foreach ($vertices as $vertex) {
			$dist[$vertex] = INF;
			$previous[$vertex] = NULL;
		}

		$dist[$source] = 0;
		$Q = $vertices;
		while (count($Q) > 0) {

			// TODO - Find faster way to get minimum
			$min = INF;
			foreach ($Q as $vertex) {
				if ($dist[$vertex] < $min) {
					$min = $dist[$vertex];
					$u = $vertex;
				}
			}

			$Q = array_diff($Q, array($u));
			if ($dist[$u] == INF or $u == $target) {
				break;
			}

			if (isset($neighbours[$u])) {
				foreach ($neighbours[$u] as $arr) {
					$alt = $dist[$u] + $arr["cost"];
					if ($alt < $dist[$arr["end"]]) {
						$dist[$arr["end"]] = $alt;
						$previous[$arr["end"]] = $u;
					}
				}
			}
		}
		$path = array();
		$u = $target;
		while (isset($previous[$u])) {
			array_unshift($path, $u);
			$u = $previous[$u];
		}
		array_unshift($path, $u);
		return $path;
	}
}

/* End of file Dashboard.php */
/* Location: ./application/controllers/administrator/Dashboard.php */
