package dao;


import model.Adminuser;
import utils.DBConnect;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
	
	
	
	//fetch user data

    public List<Adminuser> getAllUsers() throws ClassNotFoundException {
    	
        List<Adminuser> users = new ArrayList<>();
        
        String query = "SELECT id, email, username, password, confirm, phone, status FROM user";

        try (Connection conn = DBConnect.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

        	
            while (rs.next()) {
                Adminuser user = new Adminuser();
                
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setConfirm(rs.getString("confirm"));
                user.setPhone(rs.getString("phone"));
                user.setStatus(rs.getString("status"));
                users.add(user);
            }
            
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        return users;
        
    }
}
