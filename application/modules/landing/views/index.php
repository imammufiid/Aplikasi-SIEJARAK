<div class="row">
	<div class="col-md-2 col-lg-2 col-xl-2">
		<div class="kt-portlet">
			<div class="kt-portlet__body  kt-portlet__body--fit">
			</div>
		</div>
	</div>
	<div class="col-md-8 col-lg-8 col-xl-8">
		<div class="kt-portlet">
			<div class="kt-portlet__body  kt-portlet__body--fit">
				<!--begin::Total Profit-->
				<div class="kt-widget24">
					<div class="kt-widget24__details">
						<div class="kt-widget24__info">
							<h4 class="kt-widget24__title">
								<span class="flaticon2-map"></span> <span class="ml-2 mb-3">Cari Rute</span>
							</h4>
						</div>
					</div>
					<form action="<?= base_url('landing/get_jarak') ?>" method="POST">
						<div class="form-group">
							<label for="">Kota Asal</label>
							<select name="asal" id="" class="form-control" style="width: 100%">
								<option value selected disabled>-- Pilih Kota Asal --</option>
								<?php foreach ($kota as $key => $val) : ?>
									<option value="<?= $val->id_jalan ?>"><?= $val->nama_jalan ?></option>
								<?php endforeach; ?>
							</select>
						</div>
						<div class="form-group">
							<label for="">Kota Tujuan</label>
							<select name="tujuan" id="" class="form-control" style="width: 100%">
								<option value selected disabled>-- Pilih Kota Tujuan--</option>
								<?php foreach ($kota as $key => $val) : ?>
									<option value="<?= $val->id_jalan ?>"><?= $val->nama_jalan ?></option>
								<?php endforeach; ?>
							</select>
						</div>
						<div class="form-group">
							<a href="#" class="btn btn-primary btn-bold float-right">
								<i class="fa fa-search"></i>Cari
							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
