<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.review" %>
<%@ page import="services.reviewService" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Reports</title>
  <style>
    body {
      margin: 0;
      display: flex;
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
    }
    .sidebar {
      width: 220px;
      background-color: #2c3e50;
      color: white;
      padding: 20px;
      height: 100vh;
      position: fixed;
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
      transition: background-color 0.3s;
    }
    .sidebar a:hover {
      background-color: #34495e;
    }

    .main-content {
      flex: 1;
      padding: 30px;
      margin-left: 240px;
    }

    h2 {
      color: #333;
      margin-bottom: 20px;
    }

    h3 {
      color: #2c3e50;
      margin-top: 30px;
      margin-bottom: 15px;
      padding-bottom: 5px;
      border-bottom: 2px solid #2c3e50;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 30px;
      background-color: white;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    th, td {
      padding: 12px 15px;
      border-bottom: 1px solid #ddd;
      text-align: left;
    }

    th {
      background-color: #2c3e50;
      color: white;
      position: sticky;
      top: 0;
    }

    tr:hover {
      background-color: #f5f5f5;
    }

    tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    .thumbnail-cell {
      max-width: 150px;
      text-align: center;
    }

    .thumbnail-img {
      max-width: 100px;
      max-height: 60px;
      border-radius: 4px;
    }

    .status-pending {
      color: #e67e22;
      font-weight: bold;
    }

    .status-reviewed {
      color: #27ae60;
      font-weight: bold;
    }

    .status-rejected {
      color: #e74c3c;
      font-weight: bold;
    }

    .no-data {
      text-align: center;
      padding: 20px;
      color: #7f8c8d;
      font-style: italic;
    }

    @media (max-width: 768px) {
      .sidebar {
        width: 100%;
        height: auto;
        position: relative;
      }
      .main-content {
        margin-left: 0;
      }
      table {
        display: block;
        overflow-x: auto;
      }
    }
  </style>
</head>
<body>

  <div class="sidebar">
    <h2>Content Moderator</h2>
    <a href="modprofile.jsp">Profile</a>
    <a href="review.jsp">Review Videos</a>
    <a href="showReviewdVideos.jsp">Reviewed Videos</a>
    <a href="reports.jsp">Reports</a>
  </div>

  <div class="main-content">
    <h2>Video Reports</h2>

    <%
      reviewService service = new reviewService();
      List<review> newVideos = service.getAllNewVideos();
      List<review> reviewedVideos = service.getAllReviewedVideos();
    %>

    <h3>All Uploaded Videos (new_videos)</h3>
    <table>
      <thead>
        <tr>
          <th>Video Number</th>
          <th>Title</th>
          <th>Thumbnail</th>
        </tr>
      </thead>
      <tbody>
        <% if (newVideos != null && !newVideos.isEmpty()) { 
          for (review video : newVideos) { %>
          <tr>
            <td><%= video.getVideoNumber() %></td>
            <td><%= video.getTitle() %></td>
            <td class="thumbnail-cell">
              <img src="videoStream?type=thumbnail&vid=<%= video.getVideoNumber() %>" 
                   class="thumbnail-img" 
                   alt="Thumbnail for <%= video.getTitle() %>"
                   onerror="this.src='images/default-thumbnail.jpg'">
            </td>
          </tr>
        <% } 
        } else { %>
          <tr>
            <td colspan="3" class="no-data">No videos found in new_videos table</td>
          </tr>
        <% } %>
      </tbody>
    </table>

    <h3>Reviewed Videos (uploaded_videos)</h3>
    <table>
      <thead>
        <tr>
          <th>Video Number</th>
          <th>Title</th>
          <th>Status</th>
          <th>Issue</th>
        </tr>
      </thead>
      <tbody>
        <% if (reviewedVideos != null && !reviewedVideos.isEmpty()) { 
          for (review video : reviewedVideos) { 
            String statusClass = "";
            if ("Pending".equals(video.getVidStatus())) {
              statusClass = "status-pending";
            } else if ("Reviewed".equals(video.getVidStatus())) {
              statusClass = "status-reviewed";
            } else if ("Rejected".equals(video.getVidStatus())) {
              statusClass = "status-rejected";
            }
        %>
          <tr>
            <td><%= video.getVideoNumber() %></td>
            <td><%= video.getTitle() %></td>
            <td class="<%= statusClass %>"><%= video.getVidStatus() %></td>
            <td><%= video.getVideoIssue() != null ? video.getVideoIssue() : "-" %></td>
          </tr>
        <% } 
        } else { %>
          <tr>
            <td colspan="4" class="no-data">No videos found in uploaded_videos table</td>
          </tr>
        <% } %>
      </tbody>
    </table>
  </div>

</body>
</html>