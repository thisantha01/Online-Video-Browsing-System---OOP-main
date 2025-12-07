<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <title>Review Uploaded Video</title>
  <style>
    body {
      margin: 0;
      display: flex;
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
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
    }

    h2 {
      color: #333;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      font-weight: bold;
    }

    input[type="text"], select {
      width: 100%;
      padding: 8px;
      margin-top: 6px;
      margin-bottom: 12px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    img {
      width: 180px;
      border-radius: 4px;
    }

    video {
      width: 320px;
      height: 180px;
      margin-top: 12px;
      border-radius: 4px;
    }

    button {
      padding: 10px 16px;
      margin-right: 10px;
      border: none;
      border-radius: 4px;
      background-color: #007bff;
      color: white;
      cursor: pointer;
    }

    button:hover {
      background-color: #0056b3;
    }

    .btn-delete {
      background-color: #dc3545;
    }

    .btn-delete:hover {
      background-color: #c82333;
    }

    .video-details {
      margin-top: 30px;
      background-color: white;
      padding: 20px;
      border-radius: 6px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    
    .error-message {
      color: red;
      margin-bottom: 15px;
      padding: 10px;
      background-color: #ffeeee;
      border-radius: 4px;
    }
    
    .success-message {
      color: green;
      margin-bottom: 15px;
      padding: 10px;
      background-color: #eeffee;
      border-radius: 4px;
    }
  </style>
</head>
<body>

  <div class="sidebar">
    <h2>Content Moderator</h2>
    <a href="modprofile.jsp">Profile</a>
    <a href="review.jsp">Review Videos</a>
    <a href="showReviewdVideos.jsp">Reviewed videos</a>
    <a href="reports.jsp">Reports</a>
  </div>

  <div class="main-content">
    <h2>Review uploaded Videos</h2>
    
    <c:if test="${not empty error}">
      <div class="error-message">${error}</div>
    </c:if>
    
    <c:if test="${not empty message}">
      <div class="success-message">${message}</div>
    </c:if>
    
    <form action="modRetriew" method="post" id="retrieveForm">
      <div class="form-group">
        <label for="videoNumber">Enter Video Number:</label>
        <input type="text" id="videoNumber" name="videoNumber" 
               placeholder="Enter video number (e.g., 123)" required>
        <button type="submit">Retrieve</button>
      </div>
    </form>

    <c:if test="${not empty review1}">
    <form action="UpdateVideoServlet" method="post" id="updateForm">
      <input type="hidden" name="videoNumber" value="${review1.videoNumber}">
      
      <div id="videoDetails" class="video-details">
        <div class="form-group">
          <label>Video number:</label>
          <input type="text" id="videonumber" value="${review1.videoNumber}" readonly>
          
          <label>Title:</label>
          <input type="text" id="videoTitle" value="${review1.title}" readonly>
          
          <label>Thumbnail:</label><br>
          <img id="videoThumbnail" alt="Video Thumbnail" 
               src="videoStream?type=thumbnail&vid=${review1.videoNumber}&t=<%=System.currentTimeMillis()%>"
               onerror="this.onerror=null;this.src='images/default-thumbnail.jpg'">
          
          <label>Play Video:</label><br>
          <video controls id="videoPlayer" width="320" height="180"
                 onerror="this.innerHTML='<p>Video could not be loaded</p>'">
            <source src="videoStream?type=video&vid=${review1.videoNumber}&t=<%=System.currentTimeMillis()%>">
            Your browser does not support the video tag.
          </video>
          
          <label>Status:</label>
          <select id="videoStatus" name="status">
            <option value="Pending" ${review1.vidStatus eq 'Pending' ? 'selected' : ''}>Pending</option>
            <option value="Reviewed" ${review1.vidStatus eq 'Reviewed' ? 'selected' : ''}>Reviewed</option>
          </select>
          
          <label>Issue:</label>
          <input type="text" id="videoIssue" name="issue" 
                 value="${review1.videoIssue}" placeholder="Enter issue if any">
          
          <button type="submit">Update</button>
          <button type="button" class="btn-delete" onclick="confirmDelete(${review1.videoNumber})">Delete</button>
        </div>
      </div>
    </form>
    </c:if>
  </div>

  <script>
    // Original functions preserved
    function retrieveVideo() {
      const videoNum = document.getElementById("videoNumber").value;
      if (videoNum.trim() === "") {
        alert("Please enter a video number.");
        return false;
      }
      return true;
    }

    function updateVideo() {
      const status = document.getElementById("videoStatus").value;
      const issue = document.getElementById("videoIssue").value;
      console.log("Video updated - Status:", status, "Issue:", issue);
      return true;
    }

    function confirmDelete(videoNumber) {
      if (confirm("Are you sure you want to delete video #" + videoNumber + "?")) {
        deleteVideo(videoNumber);
      }
    }

    function deleteVideo(videoNumber) {
      fetch('DeleteVideoServlet?videoNumber=' + videoNumber, {
        method: 'POST'
      })
      .then(response => {
        if (response.ok) {
          alert("Video #" + videoNumber + " deleted successfully");
          location.reload();
        } else {
          alert("Error deleting video #" + videoNumber);
        }
      })
      .catch(error => {
        console.error('Delete error:', error);
        alert("Error deleting video");
      });
    }

    
    document.getElementById("retrieveForm")?.addEventListener("submit", retrieveVideo);
    document.getElementById("updateForm")?.addEventListener("submit", updateVideo);
  </script>
</body>
</html>