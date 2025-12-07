package services;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Video;
import utils.DBConnect;

public class UploadMedia {

	public static boolean insertVideo(Video vi) {
		
		String query = "INSERT INTO Video (video_id, profile_id, title,thumnail,video) "
				+ "VALUES (?, ?, ?, ?, ?)";
		
		try {
			
			Connection con = DBConnect.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			
			stmt.setInt(1, vi.getVideoID());
			stmt.setInt(2, vi.getProfieID());
			stmt.setString(3, vi.getTitle());
			stmt.setBytes(4, vi.getThumbnail());
			stmt.setBytes(5, vi.getVideo());
			
			int rowsInserted = stmt.executeUpdate();
			con.close();
			return rowsInserted > 0;

			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	} 
	
	
	public static List<Video> getVideoByProfileID(int profileId){
		
		List<Video> videos = new ArrayList<>();
		
		
		try {
			
			Connection con = DBConnect.getConnection();
			String query = "SELECT video_id ,thumnail, title FROM Video WHERE profile_id = ?";
			PreparedStatement stmt = con.prepareStatement(query);
			
			stmt.setInt(1, profileId);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				Video vi = new Video();
				vi.setVideoID(rs.getInt("video_id"));
				vi.setThumbnail(rs.getBytes("thumnail"));
				vi.setTitle(rs.getString("title"));
				videos.add(vi);
			}
			System.out.println("Number of videos found: " + videos.size());
			con.close();
			
			
			
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		
		return videos ;
		
	}
	
	
	public static byte[] getThumbnailByVideoID(int videoID) {
	    byte[] thumbnail = null;
	    try {
	        Connection con = DBConnect.getConnection();
	        String query = "SELECT thumnail FROM Video WHERE video_id = ?";
	        PreparedStatement stmt = con.prepareStatement(query);
	        stmt.setInt(1, videoID);
	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {
	            thumbnail = rs.getBytes("thumnail");
	        }

	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return thumbnail;
	}

	public static boolean deleteVideobyID(int videoID) {
	    Connection con = null;
	    PreparedStatement stmt = null;
		try {
			
			con = DBConnect.getConnection();
	        String query = "DELETE  FROM Video WHERE video_id = ?";
	        stmt = con.prepareStatement(query);
	        stmt.setInt(1, videoID);
			
	        int rowsAfected = stmt.executeUpdate();
	        
	        return rowsAfected > 0 ;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false ;
		}finally {
	        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
	        try { if (con != null) con.close(); } catch (Exception e) {}
	    }
	}
	
}
