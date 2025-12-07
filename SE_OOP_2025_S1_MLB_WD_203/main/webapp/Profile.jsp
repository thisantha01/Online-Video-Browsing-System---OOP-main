<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Creator Hub - Profile View</title>
<link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
<link rel="stylesheet" href="CSS/Profile.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="app-container">
        <!-- Vertical Navigation -->
        <nav class="sidebar">
            <div class="branding">
                <img src="Images/logo/LogoORG1.png" alt="HTML5 Icon" style="width:128px;height:128px;">
                <h1>CREATOR HUB</h1>
                <p class="dashboard-label">Dashboard</p>
            </div>
            
            <ul class="nav-items">
                <li class="nav-item active">
                    <a href="#"><span class="icon">👤</span> Profile</a>
                </li>
                <li class="nav-item">
                    <a href="DisplayVideo"><span class="icon">🎬</span> Videos</a>
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

        <!-- Data Display Content -->
        <main class="data-content">
            <div class="profile-header">
                <h2>Profile Information</h2>
            </div>
            
            <div style="text-align: center;">
  <img src="Images/logo/contentPProfilepic.jpeg" alt="HTML5 Icon" style="width:200px;height:200px;">
</div>

            
            <!-- Profile Photo Upload -->
            <form action="/upload" method="post" enctype="multipart/form-data" class="photo-upload-form">
                <div class="file-upload-container">
                    <label for="profile-photo" class="file-upload-label">
                        <i class="fas fa-camera"></i>
                        <span>Upload Profile Photo</span>
                        <input type="file" id="profile-photo" name="photo" accept="image/*" class="file-upload-input">
                    </label>
                    <div class="file-upload-preview">
                        <img id="preview-image" src="#" alt="Preview" style="display: none;">
                        <p id="file-name" class="file-name">No file chosen</p>
                    </div>
                </div>
            </form>

            <div class="data-card">
                <c:set var="cre" value="${creator}"></c:set>
                
                <div class="data-section">
                    <h3>Basic Information</h3>
                    <div class="data-row">
                        <span class="data-label" >Creator Name:</span>
                        <span class="data-value">${cre.creator_name}</span>
                    </div>
                    <div class="data-row">
                        <span class="data-label">Profile Name:</span>
                        <span class="data-value">${cre.profile_name}</span>
                    </div>
                    <div class="data-row">
                        <span class="data-label">Profile ID:</span>
                        <span class="data-value">${cre.profieID}</span>
                        <c:set var="profieID" value="${cre.profieID}" scope="session"/>

                    </div>
                    <div class="data-row">
                        <span class="data-label">Email:</span>
                        <span class="data-value">${cre.email}</span>
                    </div>
                </div>

                <div class="data-section">
                    <h3>About</h3>
                    <div class="data-row full-width">
                        <span class="data-label">Bio:</span>
                        <p class="data-value">${cre.bio}</p>
                    </div>
                </div>
            </div>
            
            
            <div class="action-buttons-container">
   
	            <form action="Update.jsp" method = "post">
	            <div class="action-buttons">
	            
	            	<input type = "hidden" name = "creator_name" value = "${cre.creator_name}" >
	            	<input type = "hidden" name = "profile_name" value = "${cre.profile_name}" >
	            	<input type = "hidden" name = "profieID" value = "${cre.profieID}" >
	            	<input type = "hidden" name = "email" value = "${cre.email}" >
	            	<input type = "hidden" name = "bio" value = "${cre.bio}" >
	            	
	            	<input type = "submit" value = "Update" class = "btn btn-change">
	            
	          
	            </div>
	            </form>
	     		
	     		<form action="DeleteProfile" method = "post">
	            <div class="action-buttons">
	            
	            	
	            	<input type = "hidden" name = "profieID" value = "${cre.profieID}" >
	            	<input type = "submit" value = "Delete Account" class = "btn btn-delete">
	            
	          
	            </div>
	            </form>
	            
     		</div>
        </main>
    </div>

</body>
</html>