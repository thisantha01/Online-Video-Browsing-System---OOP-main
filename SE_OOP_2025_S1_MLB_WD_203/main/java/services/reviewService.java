package services;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.review;
import utils.DBConnect;


public class reviewService {

    public review getVideoFromNewVideos(review rev) {
        try (Connection con = DBConnect.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                 "SELECT * FROM new_videos WHERE vid_num = ?")) {
            
            stmt.setInt(1, rev.getVideoNumber());
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    rev.setTitle(rs.getString("title"));
                    rev.setThumbnail(rs.getBlob("thumbnail"));
                    rev.setVideo(rs.getBlob("video"));
                    return rev;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void saveToUploadedVideos(review rev) {
        try (Connection con = DBConnect.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                 "INSERT INTO uploaded_videos (vid_num, title, thumbnail, video, status, issue) " +
                 "VALUES (?, ?, ?, ?, ?, ?)")) {
            
            stmt.setInt(1, rev.getVideoNumber());
            stmt.setString(2, rev.getTitle());
            
            // Handle BLOB data
            if (rev.getThumbnail() != null) {
                stmt.setBlob(3, rev.getThumbnail().getBinaryStream());
            } else {
                stmt.setNull(3, Types.BLOB);
            }
            
            if (rev.getVideo() != null) {
                stmt.setBlob(4, rev.getVideo().getBinaryStream());
            } else {
                stmt.setNull(4, Types.BLOB);
            }
            
            stmt.setString(5, rev.getVidStatus());
            stmt.setString(6, rev.getVideoIssue());
            
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to save video", e);
        }
    }
    
    public review getOne(review rev) {
        try (Connection con = DBConnect.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                 "SELECT * FROM uploaded_videos WHERE vid_num = ?")) {
            
            stmt.setInt(1, rev.getVideoNumber());
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    rev.setTitle(rs.getString("title"));
                    rev.setThumbnail(rs.getBlob("thumbnail"));
                    rev.setVideo(rs.getBlob("video"));
                    rev.setVidStatus(rs.getString("status"));
                    rev.setVideoIssue(rs.getString("issue"));
                    return rev;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean deleteVideo(int videoNumber) {
        try (Connection con = DBConnect.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                 "DELETE FROM uploaded_videos WHERE vid_num = ?")) {
            
            stmt.setInt(1, videoNumber);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updateReviewedVideo(review rev) {
        try (Connection con = DBConnect.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                 "UPDATE uploaded_videos SET status = ?, issue = ? WHERE vid_num = ?")) {
            
            stmt.setString(1, rev.getVidStatus());
            stmt.setString(2, rev.getVideoIssue());
            stmt.setInt(3, rev.getVideoNumber());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /*public review getOne(review rev) {
        try (Connection con = DBconnect.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                 "SELECT * FROM uploaded_videos WHERE vid_num = ?")) {
            
            stmt.setInt(1, rev.getVideoNumber());
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    rev.setTitle(rs.getString("title"));
                    rev.setThumbnail(rs.getBlob("thumbnail"));
                    rev.setVideo(rs.getBlob("video"));
                    rev.setVidStatus(rs.getString("status"));
                    rev.setVideoIssue(rs.getString("issue"));
                    return rev;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }*/
    
    public List<review> getAllNewVideos() {
        List<review> videos = new ArrayList<>();
        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT vid_num, title, thumbnail FROM new_videos")) {
            
            while (rs.next()) {
                review rev = new review();
                rev.setVideoNumber(rs.getInt("vid_num"));
                rev.setTitle(rs.getString("title"));
                rev.setThumbnail(rs.getBlob("thumbnail"));
                videos.add(rev);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return videos;
    }

    public List<review> getAllReviewedVideos() {
        List<review> videos = new ArrayList<>();
        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT vid_num, title, thumbnail, status, issue FROM uploaded_videos")) {
            
            while (rs.next()) {
                review rev = new review();
                rev.setVideoNumber(rs.getInt("vid_num"));
                rev.setTitle(rs.getString("title"));
                rev.setThumbnail(rs.getBlob("thumbnail"));
                rev.setVidStatus(rs.getString("status"));
                rev.setVideoIssue(rs.getString("issue"));
                videos.add(rev);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return videos;
    }
    
    
    
}