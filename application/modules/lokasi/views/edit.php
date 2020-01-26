<div class="row">
    <input type="hidden" name="id" value="<?= $lokasi->id ?>">
    <div class="col-md-12">
        <div class="form-group">
            <label for="nama">Kode Kota</label>
            <input type="text" id="nama" name="id_jalan" value="<?= $lokasi->id_jalan ?>" autocomplete="off" class="form-control">
        </div>
    </div>
    <div class="col-md-8">
        <div class="form-group">
            <label>Alamat</label>
            <input type="text" id="nama" name="nama_jalan" value="<?= $lokasi->nama_jalan ?>" autocomplete="off" class="form-control">
        </div>
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label>Aktif</label>
            <select name="status" id="status" class="form-control">
            <?php if ($lokasi->status == 1) : ?>
                    <option value="1" selected>Aktif</option>
                    <option value="0">Non-Aktif</option>
                <?php else : ?>
                    <option value="1">Aktif</option>
                    <option value="0" selected>Non-Aktif</option>
                <?php endif; ?>
            </select>
        </div>
    </div>
</div>