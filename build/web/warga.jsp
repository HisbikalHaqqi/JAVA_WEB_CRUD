<%@page import="java.sql.ResultSet"%>
<%@page import="koneksi.Koneksi"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    try{
        if(session.isNew() == false)
        {
            if(session.getAttribute("user").equals("admin"))
            {
%>

<jsp:include page="templates/header.jsp" flush="true"/>
<jsp:include page="templates/navbar.jsp" flush="true"/>
<div class="jumbotron">
    <div class="row">
        <div class="col-md-10 offset-md-1">
            <a href="warga_tambah.jsp" class="btn btn-primary"><i class="fa fa-plus"></i> Tambah Data</a>
            <p>
            <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">No</th>
                <th scope="col">No KK</th>
                <th scope="col">Nama</th>
                <th scope="col">Alamat</th>
                <th scope="col">No Handphone</th>
                <th scope="col" colspan="3">Action</th>
              </tr>
            </thead>
            <tbody>
            <%
              String query = "SELECT * FROM warga";
              Connection conn = Koneksi.connect_db();
              Statement stat = conn.createStatement();
              ResultSet rs;
              
              rs = stat.executeQuery(query);
              int no = 1;
              while(rs.next())
              {
            %>
                <tr>
                <th scope="row"><%= no %></th>
                <td><%= rs.getString(2)%></td>
                <td><%= rs.getString(3)%></td>
                <td><%= rs.getString(4)%></td>
                <td><%= rs.getString(5)%></td>
                <td>
                    <a class="btn btn-info" href="warga_update.jsp?id=<%= rs.getString(1)%>"><i class="fa fa-eye"></i> Update</a>
                </td>
                <td>
                    <form action="WargaTambah" method="POST">
                        <input type="hidden" name="id" value="<%= rs.getString(1)%>">
                        <button type="submit" name="delete" class="btn btn-danger"><i class="fa fa-trash"></i> Delete </button>
                    </form>
                </td>
                <td>
                    <a class="btn btn-warning" href="warga_view.jsp?id=<%= rs.getString(1)%>""><i class="fa fa-eye"></i> View</a>
                </td>
              </tr>
            <%
                no++;
              }
              
            %>
            </tbody>
          </table>
        </div>
    </div>
</div>

<jsp:include page="templates/footer.jsp" flush="true"/>
<%
                }
        }
        

    }
    catch(Exception e)
    {
        response.sendRedirect("index.jsp");
    }
%>

