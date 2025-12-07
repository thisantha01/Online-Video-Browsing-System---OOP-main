<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Creator Hub - Upload Video</title>
<link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
<link rel="stylesheet" href="CSS/UploadVideo.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="app-container">
        <!-- Vertical Navigation -->
        <nav class="sidebar">
            <div class="branding">
                <div class="logo">CH</div>
                <h1>CREATOR HUB</h1>
                <p class="dashboard-label">Dashboard</p>
            </div>
            
            <ul class="nav-items">
                <li class="nav-item ">
                    <a href="Profile.jsp"><span class="icon">👤</span> Profile</a>
                </li>
                <li class="nav-item active">
                    <a href="#"><span class="icon">🎬</span> Videos</a>
                </li>
                <li class="nav-item">
                    <a href="#"><span class="icon">💬</span> Comments</a>
                </li>
                <li class="nav-item">
                    <a href="#"><span class="icon">📊</span> Analytics</a>
                </li>
                <li class="nav-item">
                    <a href="#"><span class="icon">💰</span> Revenue</a>
                </li>
            </ul>
        </nav>
        
		<div class="form-container">
		    <h2>Upload Video</h2>
		    <form action="Upload" method="post" enctype="multipart/form-data" class="upload-form">
		        <input type="hidden" name="profieID" value="${param.profieID}">
		
		        <label for="title">Title</label>
		        <input type="text" name="title" id="title" required>
		
		        <label for="photo">Thumbnail</label>
		        <input type="file" name="photo" id="photo" accept="image/*" required>
		
		        <label for="video">Video File</label>
		        <input type="file" name="video" id="video" accept="video/*" required>
		
		        <button type="submit">Upload</button>
		    </form>
		</div>

     
   
     
      
    </div>

</body>
</html>