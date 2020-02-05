<div class="row">
    <input type="hidden" name="id" value="<?= $rute->id ?>">
    <div class="col-md-12">
        <div class="form-group">
            <label for="nama">Kota Asal</label>
            <select name="id_kota_asal" id="asal" class="form-control" style="width: 100%">
                <option value selected disabled>-- Pilih --</option>
                <?php foreach ($kota as $key => $val) : ?>
                    <option value="<?= $val->id ?>" <?php if($rute->id_kota_asal == $val->id) echo "selected" ?>><?= $val->nama_jalan ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <div class="col-md-12">
        <div class="form-group">
            <label>Kota Tujuan</label>
            <select name="id_kota_tujuan" id="tujuan" class="form-control" style="width: 100%">
                <option value selected disabled>-- Pilih --</option>
                <?php foreach ($kota as $key => $val) : ?>
                    <option value="<?= $val->id ?>" <?php if($rute->id_kota_tujuan == $val->id) echo "selected" ?>><?= $val->nama_jalan ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <div class="col-md-12">
        <div class="form-group">
            <label>Jarak</label>
            <input type="number" name="jarak" class="form-control" value="<?= $rute->jarak ?>">
        </div>
    </div>
</div>
<script>
    $('select').select2();
</script>