<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Admin Dashboard</title>
    <link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
    <link rel="stylesheet" href="CSS/admin.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
</head>

<body>

    <div class="container">
       
        <div class="sidebar" id="sidebar">
            <div class="profile">
                <div class="profile-img-container">
                
                    <div class="profile-img">
                        <img src="IMG/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_5247852.jpg" alt="Admin Profile" id="profileImage">
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
                            <img id="imagePreview" src="/placeholder.svg" alt="Preview">
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
                    <li class="active"><a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                    <li><a href="userList"><i class="fas fa-users"></i> User Management</a></li>
                    <li><a href="videos"><i class="fas fa-video"></i> Video Management</a></li>
                    <li><a href="#"><i class="fas fa-list"></i> Category Management</a></li>
                    <li><a href="reports.jsp"><i class="fas fa-chart-bar"></i> Reports</a></li>
                    <li><a href="feedback"><i class="fas fa-comment"></i> Feedback</a></li>
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
                
                <h1>Admin Dashboard</h1>
                
                <div class="user-info">
                
                 <div class="user-img">
				   <img src="IMG/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_5247852.jpg" alt="Admin" id="headerProfileImage">
				</div>
				
                    <span>Admin   <h6> Welcome !</h6></span> <br>
                    
                    
                </div>
                
                <div class="time">12:09:48 AM</div> <br>
               
                
            </header>

         
                <div class="card">
                    <div class="card-header">
                        <h2>System Stats</h2>
                    </div>
                    
                    <div class="card-body">
                        <div class="stat-item">
                            <span class="stat-label">Total Users:</span>
                            <span class="stat-value" id="totalUsers">1200</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-label">Total Videos:</span>
                            <span class="stat-value" id="totalVideos">5400</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-label">Pending Reviews:</span>
                            <span class="stat-value" id="pendingReviews">23</span>
                        </div>
                    </div>
                </div>

             
                <div class="card">
                    <div class="card-header">
                    
                        <h2>Analytics Overview</h2>
                        
                    </div>
                    
                    <div class="card-body">
                        <div class="controls-row">
                            <div class="control-group">
                            
                                <label for="chartType">Chart Type:</label>
                                
                                <select id="chartType" class="form-select">
                                    <option value="bar">Bar</option>
                                    <option value="line">Line</option>
                                    <option value="pie">Pie</option>
                                    <option value="doughnut">Doughnut</option>
                                </select>
                            </div>
                            
                            <div class="control-group">
                            
                                <label for="datePicker">Date:</label>
                                <input type="date" id="datePicker" class="form-input">
                            </div>
                            
                            <div class="control-group">
                                <button id="exportChart" class="btn btn-success">Export Chart</button>
                            </div>
                        </div>
                        
                        <div class="chart-container">
                            <h3>System Analytics</h3>
                            <canvas id="analyticsChart"></canvas>
                        </div>
                        
                    </div>
                </div>

             
             
                <div class="card">
                
                    <div class="card-header">
                    
                        <h2>Video Management</h2>
                        
                    </div>
                    
                    <div class="card-body">
                        <div class="table-responsive">
                        
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Uploader</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody id="videoTableBody">
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    

  
    <div class="overlay" id="overlay"></div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="JS/admin.js"></script>
    
    
</body>
</html>