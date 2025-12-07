package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.modprofile;

import utils.DBConnect;


public class profileService {
    
    public boolean registerModerator(modprofile prof) {
        try {
            Connection con = DBConnect.getConnection();
            
           
            String checkQuery = "SELECT * FROM moderator_details WHERE id = ?";
            PreparedStatement checkStmt = con.prepareStatement(checkQuery);
            checkStmt.setInt(1, prof.getModid());
            ResultSet rs = checkStmt.executeQuery();
            
            if(rs.next()) {
                return false; 
            }
            
          
            String insertQuery = "INSERT INTO moderator_details (id, full_name, user_name, email, password) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement insertStmt = con.prepareStatement(insertQuery);
            insertStmt.setInt(1, prof.getModid());
            insertStmt.setString(2, prof.getFullname());
            insertStmt.setString(3, prof.getUsername());
            insertStmt.setString(4, prof.getEmail());
            insertStmt.setString(5, prof.getPassword());
            
            int rowsAffected = insertStmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public modprofile loginModerator(int modid, String password) {
        try {
            Connection con = DBConnect.getConnection();
            String query = "SELECT * FROM moderator_details WHERE id = ? AND password = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, modid);
            stmt.setString(2, password);
            
            ResultSet rs = stmt.executeQuery();
            
            if(rs.next()) {
                modprofile prof = new modprofile();
                prof.setModid(rs.getInt("id"));
                prof.setFullname(rs.getString("full_name"));
                prof.setUsername(rs.getString("user_name"));
                prof.setEmail(rs.getString("email"));
                prof.setPassword(rs.getString("password"));
                return prof;
            }
            return null;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}