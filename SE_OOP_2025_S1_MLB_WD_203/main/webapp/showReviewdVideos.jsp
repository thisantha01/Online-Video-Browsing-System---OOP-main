<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Reviewed Videos</title>
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
      position: fixed;
    }
    
    .sidebar h2 {
      font-size: 18px;
      margin-bottom: 30px;
      padding-top: 10px;
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
    
    .form-group {
      margin-bottom: 20px;
      background-color: white;
      padding: 20px;
      border-radius: 6px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    label {
      font-weight: bold;
      display: block;
      margin-bottom: 5px;
    }
    
    input[type="text"], select {
      width: 100%;
      padding: 8px;
      margin-bottom: 15px;
      border: 1px solid #ddd;
      border-radius: 4px;
      box-sizing: border-box;
    }
    
   
    .readonly-field {
      background-color: #f9f9f9;
      border: 1px solid #eee;
      color: #555;
      cursor: not-allowed;
    }
    
    .editable-field {
      background-color: white;
      border: 1px solid #ddd;
    }
    
    
    img {
      width: 180px;
      border-radius: 4px;
      border: 1px solid #ddd;
      margin-bottom: 10px;
    }
    
    video {
      width: 100%;
      max-width: 500px;
      height: auto;
      margin-top: 10px;
      border-radius: 4px;
      background-color: #000;
    }
    
    
    button {
      padding: 10px 16px;
      margin-right: 10px;
      border: none;
      border-radius: 4px;
      color: white;
      cursor: pointer;
      font-weight: bold;
      transition: background-color 0.3s;
    }
    
    .btn-retrieve {
      background-color: #007bff;
    }
    
    .btn-retrieve:hover {
      background-color: #0069d9;
    }
    
    .btn-update {
      background-color: #28a745;
    }
    
    .btn-update:hover {
      background-color: #218838;
    }
    
    .btn-delete {
      background-color: #dc3545;
    }
    
    .btn-delete:hover {
      background-color: #c82333;
    }
    
    
    .error-message {
      color: #721c24;
      background-color: #f8d7da;
      border: 1px solid #f5c6cb;
      padding: 10px;
      border-radius: 4px;
      margin-bottom: 20px;
    }
    
    .success-message {
      color: #155724;
      background-color: #d4edda;
      border: 1px solid #c3e6cb;
      padding: 10px;
      border-radius: 4px;
      margin-bottom: 20px;
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
    <h2>Reviewed Videos</h2>
    
  
    <c:if test="${not empty error}">
      <div class="error-message">${error}</div>
    </c:if>
    
    <c:if test="${not empty message}">
      <div class="success-message">${message}</div>
    </c:if>
    
   
    <form action="modSwRevewedVid" method="post" id="retrieveForm">
      <div class="form-group">
        <label for="videoNumber">Enter Video Number:</label>
        <input type="text" id="videoNumber" name="videoNumber" 
               placeholder="Enter video number (e.g., 123)" required>
        <button type="submit" class="btn-retrieve">Retrieve</button>
      </div>
    </form>

   
    <c:if test="${not empty review}">
    <form action="modUpdateReviewedVideoServlet" method="post" id="updateForm">
      <input type="hidden" name="videoNumber" value="${review.videoNumber}">
      
      <div class="form-group">
       
        <label>Video number:</label>
        <input type="text" value="${review.videoNumber}" class="readonly-field" readonly>
        
        <label>Title:</label>
        <input type="text" value="${review.title}" class="readonly-field" readonly>
        
        
        <label>Status:</label>
        <select name="status" class="editable-field">
          <option value="Pending" ${review.vidStatus eq 'Pending' ? 'selected' : ''}>Pending</option>
          <option value="Reviewed" ${review.vidStatus eq 'Reviewed' ? 'selected' : ''}>Reviewed</option>
          <option value="Rejected" ${review.vidStatus eq 'Rejected' ? 'selected' : ''}>Rejected</option>
        </select>
        
        <label>Issue:</label>
        <input type="text" name="issue" value="${review.videoIssue}" 
               class="editable-field" placeholder="Enter issue if any">
        
      
        <label>Thumbnail:</label><br>
        <img src="videoStream?type=thumbnail&vid=${review.videoNumber}&t=<%=System.currentTimeMillis()%>" 
             alt="Video Thumbnail" 
             onerror="this.onerror=null;this.src='images/default-thumbnail.jpg'">
        
        <label>Play Video:</label><br>
        <video controls 
               onerror="this.innerHTML='<p style=\"color:red;padding:10px\">Video could not be loaded</p>'">
          <source src="videoStream?type=video&vid=${review.videoNumber}&t=<%=System.currentTimeMillis()%>">
          Your browser does not support the video tag.
        </video>
        
       
        <div style="margin-top: 20px;">
          <button type="submit" class="btn-update">Update</button>
          <button type="button" class="btn-delete" onclick="confirmDelete(${review.videoNumber})">Delete</button>
        </div>
      </div>
    </form>
    </c:if>
  </div>


  <script>
    
    function confirmDelete(videoNumber) {
      if (confirm("Are you sure you want to permanently delete video #" + videoNumber + "?\nThis cannot be undone.")) {
        deleteVideo(videoNumber);
      }
    }

    
    function deleteVideo(videoNumber) {
      fetch('modDeleteVidServlet', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'videoNumber=' + videoNumber
      })
      .then(response => {
        if (response.ok) {
          alert("Video #" + videoNumber + " was successfully deleted");
          location.reload(); 
        } else {
          return response.text().then(text => { throw new Error(text) });
        }
      })
      .catch(error => {
        console.error('Delete error:', error);
        alert("Failed to delete video: " + error.message);
      });
    }

    
    document.getElementById("updateForm")?.addEventListener("submit", function(e) {
      const issueField = document.querySelector("#updateForm input[name='issue']");
      if (issueField.value.length > 200) {
        alert("Issue description cannot exceed 200 characters");
        e.preventDefault();
        issueField.focus();
      }
    });

   
    window.addEventListener('DOMContentLoaded', (event) => {
      const videoNumberField = document.getElementById("videoNumber");
      if (videoNumberField) {
        videoNumberField.focus();
      }
    });
  </script>
</body>
</html>