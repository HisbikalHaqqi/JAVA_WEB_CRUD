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
            <h3>Data User</h3>
            <p>
            <table class="table table-hover">
                <tr>
                    <td>Employee Code</td>
                    <td><%=rs.getString("nik")%></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=rs.getString("nama")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rs.getString("alamat")%></td>
                </tr>
                <tr>
                    <td>Telph</td>
                    <td><%=rs.getString("telp")%></td>
                </tr>
            </table>
            <a href="warga.jsp" class="btn btn-success"><i class="fa fa-backward"></i> Back </a>
        </div>
    </div>
</div>
<%
    }
%>
<jsp:include page="templates/footer.jsp" flush="true"/>