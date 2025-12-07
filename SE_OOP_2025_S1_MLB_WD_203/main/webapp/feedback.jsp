<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback List</title>
    <link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
    <link rel="stylesheet" href="CSS/feedback.css">
    <link rel="stylesheet" href="CSS/admin.css">
    <link rel="stylesheet" href="CSS/userstyle.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.css">

</head>

<body>

    <div class="container">
   

        <div class="sidebar" id="sidebar">
            <div class="profile">
                <div class="profile-img-container">
                    <div class="profile-img">
                        <img src="IMG/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_5247852.jpg" alt="Admin" id="headerProfileImage">
                    </div>
                    <div class="profile-img-overlay">
                        <label for="profilePhotoInput" class="change-photo-btn">
                            <i class="fas fa-camera"></i>
                        </label>
                        <input type="file" id="profilePhotoInput" accept="image/*" style="display: none;">
                    </div>
                </div>
                <h3>Admin</h3>
            </div>
            
          

            <div id="photoUploadModal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3>Update Profile Photo</h3>
                        <span class="close-modal">&times;</span>
                    </div>
                    
                    <div class="modal-body">
                        <div class="image-preview-container">
                            <img src="IMG/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_5247852.jpg" alt="Admin" id="headerProfileImage">
                        </div>
                        
                        <div class="upload-controls">
                            <button id="cancelUpload" class="btn btn-secondary">Cancel</button>
                            <button id="savePhoto" class="btn btn-primary">Save Photo</button>
                        </div>
                        
                    </div>
                </div>
            </div>
            
            <nav class="nav-menu">
            
                <ul>
                    <li><a href="admin.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                    <li><a href="#"><i class="fas fa-users"></i> User Management</a></li>
                    <li><a href="videos"><i class="fas fa-video"></i> Video Management</a></li>
                    <li><a href="#"><i class="fas fa-list"></i> Category Management</a></li>
                    <li><a href="reports.jsp"><i class="fas fa-chart-bar"></i> Reports</a></li>
                    <li class="active"><a href="feedback"><i class="fas fa-comment"></i> Feedback</a></li>
                    <li><a href="analytics.jsp"><i class="fas fa-chart-line"></i> Analytics</a></li>
                  <li><a href="Adminlogin.jsp"><i class="fas fa-sign-out-alt"></i> Log out</a></li>

                </ul>
            </nav>
            
        </div>

        

        <div class="main-content" id="mainContent">
           

            <header class="header">
            
                <div class="menu-toggle" id="menuToggle">
                    <i class="fas fa-bars"></i>
                </div>
                
                <h1>FeedBack</h1>
                <div class="user-info">
                   
				
				<div class="user-img">
				   <img src="IMG/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_5247852.jpg" alt="Admin" id="headerProfileImage">
				</div>
				
				<span>Admin</span>
				
                </div>
                
                
                <div class="time">12:09:48 AM</div>
                
            </header>
            
		
		<h2>All Feedbacks</h2>
		
    <table border="1">
    
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Message</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        <tbody>
        
            <c:forEach var="feedback" items="${feedbackList}">
                <tr>
                    <td>${feedback.id}</td>
                    <td>${feedback.username}</td>
                    <td>${feedback.email}</td>
                    <td>${feedback.message}</td>
                    <td>${feedback.status}</td>
                   <td>
		                   
		    <form action="feedback" method="get" style="display:inline;">
		        <input type="hidden" name="action" value="edit">
		        <input type="hidden" name="id" value="${feedback.id}">
		        <button class="btn-edit">Review</button>
		        
		    </form>
		
		    <form action="feedback" method="get" style="display:inline;" onsubmit="return confirm('Are you sure?')">
		        <input type="hidden" name="action" value="delete">
		        <input type="hidden" name="id" value="${feedback.id}">
		        <button class="btn-delete">Delete</button>
		    </form>
		</td>
		
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>



 
    <div class="overlay" id="overlay"></div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="JS/userscript.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.js"></script>
    
    
</body>
</html>