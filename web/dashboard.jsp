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
    <div class="img-title">
        <center><img src="images/village.png"></center>
            <h1>Selamat Datang Di</h1>
        <h3>Sistem Informasi Laporan Kas Keuangan RT 03</h3>
        <hr>
        <h4><% new java.util.Date();%></h4>
        
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

