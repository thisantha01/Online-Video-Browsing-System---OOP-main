<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.modprofile" %>
<%
    modprofile moderator = (modprofile) session.getAttribute("moderator");
    if(moderator == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Profile Page</title>
  <style>
    body {
      margin: 0;
      display: flex;
      font-family: Arial, sans-serif;
    }
    .sidebar {
      width: 220px;
      background-color: #2c3e50;
      color: white;
      padding: 20px;
      height: 100vh;
    }
    .sidebar h2 {
      font-size: 18px;
      margin-bottom: 30px;
    }
    .sidebar a {
      display: block;
      color: white;
      text-decoration: none;
      margin-bottom: 15px;
      font-size: 16px;
      padding: 8px 12px;
      border-radius: 4px;
    }
    .sidebar a:hover {
      background-color: #34495e;
    }
    .main-content {
      flex: 1;
      padding: 30px;
      background-color: #f2f2f2;
    }
    .profile-header {
      margin-bottom: 30px;
    }
    .profile-details {
      background: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .detail-group {
      margin-bottom: 15px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    .detail-label {
      font-weight: bold;
      color: #555;
      margin-bottom: 5px;
    }
    .detail-value {
      font-size: 16px;
    }
    .update-btn {
      padding: 10px 20px;
      background-color: #2c3e50;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      margin-top: 20px;
    }
    .update-btn:hover {
      background-color: #34495e;
    }
  </style>
</head>
<body>

  <div class="sidebar">
    <h2>Content Moderator</h2>
    <a href="profile.jsp">Profile</a>
    <a href="review.jsp">Review Videos</a>
    <a href="showReviewdVideos.jsp">Reviewed videos</a>
    <a href="reports.jsp">Reports</a>
  </div>

  <div class="main-content">
    <div class="profile-header">
      <h1>Profile Settings</h1>
    </div>
    
    <div class="profile-details">
      <div class="detail-group">
        <div class="detail-label">Moderator ID</div>
        <div class="detail-value"><%= moderator.getModid() %></div>
      </div>
      
      <div class="detail-group">
        <div class="detail-label">Full Name</div>
        <div class="detail-value"><%= moderator.getFullname() %></div>
      </div>
      
      <div class="detail-group">
        <div class="detail-label">Username</div>
        <div class="detail-value"><%= moderator.getUsername() %></div>
      </div>
      
      <div class="detail-group">
        <div class="detail-label">Email</div>
        <div class="detail-value"><%= moderator.getEmail() %></div>
      </div>
      
      <div class="detail-group">
        <div class="detail-label">Password</div>
        <div class="detail-value">••••••••</div>
      </div>
      
      <button class="update-btn" onclick="location.href='editProfile.jsp'">Update Profile</button>
    </div>
  </div>

</body>
</html>