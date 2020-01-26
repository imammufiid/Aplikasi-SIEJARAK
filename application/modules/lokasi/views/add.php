<div class="row">
    <!-- <input type="hidden" name="created_at" value="<?= date('d-m-Y'); ?>"> -->
    <div class="col-md-12">
        <div class="form-group">
            <label for="nama">Kode</label>
            <input type="text" id="nama" name="id_jalan" autocomplete="off" class="form-control">
        </div>
    </div>
    <div class="col-md-8">
        <div class="form-group">
            <label>Nama Kota</label>
            <input type="text" id="nama" name="nama_jalan" autocomplete="off" class="form-control">
        </div>
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label>Aktif</label>
            <select name="status" id="status" class="form-control">
                <option value="1">Aktif</option>
                <option value="0">Non-Aktif</option>
            </select>
        </div>
    </div>
</div>