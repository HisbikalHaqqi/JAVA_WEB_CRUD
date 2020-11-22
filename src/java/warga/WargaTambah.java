/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package warga;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import koneksi.Koneksi;

/**
 *
 * @author NetTech
 */
@WebServlet(name = "WargaTambah",urlPatterns = {"/WargaTambah"})
public class WargaTambah extends HttpServlet {
    
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try{
            String nik = request.getParameter("nik");
            String nama = request.getParameter("name");
            String alamat = request.getParameter("alamat");
            String telp  = request.getParameter("telp");
            
            Connection conn = Koneksi.connect_db();
            PreparedStatement pst;
            
            if(request.getParameter("submit")!= null)
            {
                String query = "INSERT INTO warga VALUES(?,?,?,?,?)";
                pst = conn.prepareStatement(query);
                pst.setInt(1,0);
                pst.setString(2,nik);
                pst.setString(3,nama);
                pst.setString(4,alamat);
                pst.setString(5,telp);
                pst.execute();
            }
            else if(request.getParameter("update")!= null)
            {
                String id = request.getParameter("id");
                
                String query = "UPDATE warga SET nik = ? , nama = ? ,alamat = ? , telp = ? WHERE id = ?";
                pst = conn.prepareStatement(query);
                pst.setString(1,nik);
                pst.setString(2,nama);
                pst.setString(3,alamat);
                pst.setString(4,telp);
                pst.setString(5,id);
                pst.execute();
            }
            else  if(request.getParameter("delete")!= null){
                Integer id = Integer.parseInt(request.getParameter("id"));
                String query = "DELETE FROM warga WHERE id = ?";
                pst = conn.prepareStatement(query);
                pst.setInt(1,id);
                pst.execute();
            }
            
            
            response.sendRedirect("warga.jsp");
            
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        finally{
            out.close();
        }
    }
}
