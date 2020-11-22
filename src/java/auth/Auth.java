/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import koneksi.Koneksi;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NetTech
 */
@WebServlet(name = "Auth", urlPatterns = {"/Auth"})
public class Auth extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession(true);
        
        try{
             String userid = request.getParameter("username");
             String pwd    = request.getParameter("password"); 
             
            Connection con = Koneksi.connect_db();
            Statement stat = con.createStatement();
            ResultSet rs;

             rs = stat.executeQuery("SELECT * FROM user WHERE username = '"+userid+"' and password = '"+pwd+"'");

             if(rs.next())
             {
                 session.setAttribute("user",userid);
                 out.println("Welcome"+userid);
                 out.println("<a href='logout.jsp'>Logout</a>");
                 if(rs.getString("username").equals("admin"))
                 {
                     response.sendRedirect("dashboard.jsp");
                 }
                 else
                 {
                     response.sendRedirect("index.jsp");
                 }
                 
             }
             else
             {
                out.println("<div class='col-md-4 offset-md-4'>");
                out.println("<div class='alert alert-danger'>Username Or Password Not Correct</div>");
                out.println("</div");
                
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.include(request, response);
             }
         }
         catch(SQLException ex)
         {
             ex.printStackTrace();
         }
    }
}
