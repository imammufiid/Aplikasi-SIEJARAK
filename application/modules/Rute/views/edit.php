<div class="row">
    <input type="hidden" name="no" value="<?= $rute->no ?>">
    <div class="col-md-12">
        <div class="form-group">
            <label for="nama">Kota Asal</label>
            <select name="asal" id="asal" class="form-control" style="width: 100%">
                <option value selected disabled>-- Pilih --</option>
                <?php foreach ($kota as $key => $val) : ?>
                    <option value="<?= $val->id_jalan ?>" <?php if($rute->asal == $val->id_jalan) echo "selected" ?>><?= $val->nama_jalan ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <div class="col-md-12">
        <div class="form-group">
            <label>Kota Tujuan</label>
            <select name="tujuan" id="tujuan" class="form-control" style="width: 100%">
                <option value selected disabled>-- Pilih --</option>
                <?php foreach ($kota as $key => $val) : ?>
                    <option value="<?= $val->id_jalan ?>" <?php if($rute->tujuan == $val->id_jalan) echo "selected" ?>><?= $val->nama_jalan ?></option>
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