package dao;

import java.sql.*;
import utils.DBConnect;
import model.Admin;

public class AdminDAO {

    public Admin getAdminByCredentials(String email, String password) throws ClassNotFoundException {
    	
        String query = "SELECT * FROM admin WHERE email = ? AND password = ?";
        
        try (Connection connection = DBConnect.getConnection();
        	 PreparedStatement ps = connection.prepareStatement(query)) {
        	
        	
            ps.setString(1, email);
            ps.setString(2, password);
            
            
            try (ResultSet rs = ps.executeQuery()) {
            	
            	
                if (rs.next()) {
                	
                    Admin admin = new Admin();
                    
                    admin.setId(rs.getInt("id"));
                    admin.setEmail(rs.getString("email"));
                    admin.setPassword(rs.getString("password"));
                    
                    return admin;
                }
            }
            
            
        } catch (SQLException e) {
        	
            System.err.println("Database error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
}
