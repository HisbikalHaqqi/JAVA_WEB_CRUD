<jsp:include page="templates/header.jsp" flush="true"/>
<jsp:include page="templates/navbar.jsp" flush="true"/>
<div class="jumbotron">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <h3>Form Data User</h3>
            <hr>
            <form method="POST" action="WargaTambah">
                <div class="form-group">
                    <label for="nik" >NIK</label>
                    <input type="text" name="nik" placeholder="NIK" id="nil" class="form-control">
                </div> 
                <div class="form-group">
                    <label for="nama" >Nama</label>
                    <input type="text" name="name" placeholder="Nama" id="nama" class="form-control">
                </div>
                <div class="form-group">
                    <label for="alamat" >Alamat</label>
                    <textarea name="alamat" class="form-control"></textarea>
                </div> 
                <div class="form-group">
                    <label for="telp" >Telp</label>
                    <input type="text" name="telp" placeholder="Telp" id="telp" class="form-control">
                </div>
                <button type="submit" name="submit" class="btn btn-primary"> <i class="fa fa-plus"></i> Tambah Data</button>
            </form>
             <p>
            <a href="warga.jsp" class="btn btn-success"><i class="fa fa-backward"></i> Back </a>
        </div>
    </div>
</div>
<jsp:include page="templates/footer.jsp" flush="true"/>