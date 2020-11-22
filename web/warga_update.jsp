<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="koneksi.Koneksi"%>
<%@page import="java.sql.Connection"%>

<jsp:include page="templates/header.jsp" flush="true"/>
<jsp:include page="templates/navbar.jsp" flush="true"/>
<%
  String id = request.getParameter("id");
  
   Connection conn = Koneksi.connect_db();
   Statement stat = conn.createStatement();
   ResultSet rs;
   
    String query = "SELECT * FROM warga WHERE id = "+id;
    rs = stat.executeQuery(query);
    while(rs.next())
    {
%>
<div class="jumbotron">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <h3>Form Data User</h3>
            <hr>
            <form method="POST" action="WargaTambah">
                <input type="hidden" name="id" value="<%= rs.getString(1)%>">
                <div class="form-group">
                    <label for="nik" >NIK</label>
                    <input type="text" name="nik" placeholder="NIK" id="nik" class="form-control" value="<%= rs.getString("nik") %>">
                </div> 
                <div class="form-group">
                    <label for="nama" >Nama</label>
                    <input type="text" name="name" placeholder="Nama" id="nama" class="form-control" value="<%= rs.getString("nama") %>">
                </div>
                <div class="form-group">
                    <label for="alamat" >Alamat</label>
                    <textarea name="alamat" class="form-control"><%= rs.getString("alamat") %></textarea>
                </div> 
                <div class="form-group">
                    <label for="telp" >Telp</label>
                    <input type="text" name="telp" placeholder="Telp" id="telp" class="form-control" value="<%= rs.getString("telp") %>">
                </div>
                <button type="submit" name="update" class="btn btn-primary"> <i class="fa fa-plus"></i> Tambah Data</button>
            </form>
                <p>
            <a href="warga.jsp" class="btn btn-success"><i class="fa fa-backward"></i> Back </a>
        </div>
    </div>
</div>
<%
    }
%>
<jsp:include page="templates/footer.jsp" flush="true"/>