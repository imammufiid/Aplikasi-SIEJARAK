<div class="row">
		<div class="col-md-4 col-lg-4 col-xl-4">
			<div class="kt-portlet">
				<div class="kt-portlet__body  kt-portlet__body--fit">
					<!--begin::Total Profit-->
					<div class="kt-widget24">
						<div class="kt-widget24__details">
							<div class="kt-widget24__info">
								<h4 class="kt-widget24__title">
									<span class="flaticon2-pin"></span> <span class="ml-2">Kota</span>
								</h4>
								<span class="kt-widget24__desc">
									Total
								</span>
							</div>
							<span class="kt-widget24__stats kt-font-brand">
								<?= $this->db->get('jalan')->num_rows(); ?>
							</span>
						</div>
						<div class="progress progress--sm">
							<div class="progress-bar kt-bg-brand" role="progressbar" style="width: 100%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div>
					<!--end::Total Profit-->
				</div>
			</div>
		</div>
		<div class="col-md-4 col-lg-4 col-xl-4">
			<div class="kt-portlet">
				<div class="kt-portlet__body  kt-portlet__body--fit">
					<!--begin::Total Profit-->
					<div class="kt-widget24">
						<div class="kt-widget24__details">
							<div class="kt-widget24__info">
								<h4 class="kt-widget24__title">
									<span class="flaticon2-map"></span> <span class="ml-2">Rute</span>
								</h4>
								<span class="kt-widget24__desc">
									Total
								</span>
							</div>
							<span class="kt-widget24__stats kt-font-warning">
							<?= $this->db->get('graph')->num_rows(); ?>
							</span>
						</div>
						<div class="progress progress--sm">
							<div class="progress-bar kt-bg-warning" role="progressbar" style="width: 80%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div>
					<!--end::Total Profit-->
				</div>
			</div>
		</div>
		<div class="col-md-4 col-lg-4 col-xl-4">
			<div class="kt-portlet">
				<div class="kt-portlet__body  kt-portlet__body--fit">
					<!--begin::Total Profit-->
					<div class="kt-widget24">
						<div class="kt-widget24__details">
							<div class="kt-widget24__info">
								<h4 class="kt-widget24__title">
									<span class="flaticon2-map"></span> <span class="ml-2">User</span>
								</h4>
								<span class="kt-widget24__desc">
									Total
								</span>
							</div>
							<span class="kt-widget24__stats kt-font-success">
								0
							</span>
						</div>
						<div class="progress progress--sm">
							<div class="progress-bar kt-bg-success" role="progressbar" style="width: 100%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div>
					<!--end::Total Profit-->
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>