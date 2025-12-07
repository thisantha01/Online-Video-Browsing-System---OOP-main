package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Video;
import utils.DBConnect;

public class VideoServise {

	//select all videos method
	public List<Video> getAllVideos(){
		
		// create array list object from video model class
		List<Video> videos = new ArrayList<>();
		
		String query = "SELECT * FROM Video";
		
		try {
			//create connection
			Connection con = DBConnect.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			
			//get all data in Video table
			while(rs.next()) {
				int profieID = rs.getInt("profile_id");
				int videoID = rs.getInt("video_id");
                String title = rs.getString("title");
                byte[] thumbnail = rs.getBytes("thumnail");
                byte[] video = rs.getBytes("video");
                
                //call overload constructor in model class pass above values
    			Video v = new Video(profieID,videoID,title,thumbnail,video);
    			
    			//pass values array list
    			videos.add(v);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return videos;
	}
	
	
	
	//get video by video id in video table
	public Video getVideoByID(int videoID) {
		
		Video video = null;
		String query = "SELECT * FROM Video WHERE video_id  = ?";
		
		try {
			
			Connection con = DBConnect.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			
			stmt.setInt(1, videoID);
			ResultSet rs = stmt.executeQuery();
			
			// check if video table data is avilable;
			if(rs.next()) {
				
				int profileID = rs.getInt("profile_id");
                String title = rs.getString("title");
                byte[] thumbnail = rs.getBytes("thumnail");
                byte[] videoData = rs.getBytes("video");
                
                // call constructor and pass value
                video = new Video(profileID,videoID,title,thumbnail,videoData);

				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return video;
	}
	
	
	
	
	
}
