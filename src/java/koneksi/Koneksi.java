/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package koneksi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author NetTech
 */
public class Koneksi {
    Statement st;
   
    public Koneksi() throws SQLException
    {
        connect_db();
    }
    
    public static Connection connect_db() throws SQLException
    {
        Connection connection = null;
        String Driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String pass = "";
        String url = "jdbc:mysql://localhost:3306/java_web";
        
         try
        {
            Class.forName(Driver);
            connection = DriverManager.getConnection(url,user,pass);
            return connection;
            
        }
        catch(ClassNotFoundException e)
        {
            JOptionPane.showMessageDialog(null,"Connection Failed");
            return null;
        }
    }
}
