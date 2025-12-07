package dao;

import model.Feedback;
import utils.DBConnect;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {

    // Get all feedbacks
    public List<Feedback> getAllFeedbacks() throws ClassNotFoundException {
    	
        List<Feedback> feedbacks = new ArrayList<>();
        
        String query = "SELECT * FROM feedback";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
            	
                feedbacks.add(mapResultSetToFeedback(rs));
            }
            
        } catch (SQLException e) {
        	
            System.err.println("Error fetching feedbacks: " + e.getMessage());
        }
        
        return feedbacks;
    }

    // Insert feedback
    public boolean insertFeedback(Feedback feedback) throws ClassNotFoundException {
    	
        String query = "INSERT INTO feedback (username, email, message, status) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, feedback.getUsername());
            stmt.setString(2, feedback.getEmail());
            stmt.setString(3, feedback.getMessage());
            stmt.setString(4, feedback.getStatus());

            return stmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
        	
            System.err.println("Error inserting feedback: " + e.getMessage());
        }
        
        return false;
    }

    // Update feedback
    public boolean updateFeedback(Feedback feedback) throws ClassNotFoundException {
    	
        String query = "UPDATE feedback SET username = ?, email = ?, message = ?, status = ? WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, feedback.getUsername());
            stmt.setString(2, feedback.getEmail());
            stmt.setString(3, feedback.getMessage());
            stmt.setString(4, feedback.getStatus());
            stmt.setInt(5, feedback.getId());

            return stmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
        	
            System.err.println("Error updating feedback: " + e.getMessage());
        }
        
        return false;
    }

    // Delete feedback
    public boolean deleteFeedback(int id) throws ClassNotFoundException {
    	
        String query = "DELETE FROM feedback WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, id);
            
            return stmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
            System.err.println("Error deleting feedback: " + e.getMessage());
        }
        
        return false;
    }

    // Map ResultSet to Feedback object
    private Feedback mapResultSetToFeedback(ResultSet rs) throws SQLException {
    	
        Feedback feedback = new Feedback();
        
        feedback.setId(rs.getInt("id"));
        feedback.setUsername(rs.getString("username"));
        feedback.setEmail(rs.getString("email"));
        feedback.setMessage(rs.getString("message"));
        feedback.setStatus(rs.getString("status"));
        
        return feedback;
    }
    
 // Get feedback by ID
    public Feedback getFeedbackById(int id) throws ClassNotFoundException {
    	
        String query = "SELECT * FROM feedback WHERE id = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
        	
            stmt.setInt(1, id);
            
            try (ResultSet rs = stmt.executeQuery()) {
            	
                if (rs.next()) {
                	
                    return mapResultSetToFeedback(rs);
                }
            }
            
        } catch (SQLException e) {
        	
            System.err.println("Error fetching feedback by ID: " + e.getMessage());
        }
        
        return null;
    }

}
