package dao;

import model.AdminVideo;
import utils.DBConnect;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VideoDAO {

    // fetch all videos from the database
    public List<AdminVideo> getAllVideos() throws ClassNotFoundException {
    	
        List<AdminVideo> videos = new ArrayList<>();
        
        String query = "SELECT id, title, uploader, status FROM videos";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                videos.add(mapResultSetToVideo(rs));
            }
            
        } catch (SQLException e) {
        	
            System.err.println("Error fetching videos: " + e.getMessage());
        }
        
        return videos;
    }

    // map resultset to video object
    private AdminVideo mapResultSetToVideo(ResultSet rs) throws SQLException {
    	
        AdminVideo video = new AdminVideo();
        
        video.setId(rs.getInt("id"));
        video.setTitle(rs.getString("title"));
        video.setUploader(rs.getString("uploader"));
        video.setStatus(rs.getString("status"));
        
        return video;
    }
}
