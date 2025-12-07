<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    
    <title>Analytics</title>
    <link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
    
    <link rel="stylesheet" href="CSS/analytics.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap">
    <link rel="stylesheet" href="CSS/admin.css">
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
                    <li><a href="admin.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                   <li><a href="userList"><i class="fas fa-users"></i> User Management</a></li>
                    <li><a href="videos"><i class="fas fa-video"></i> Video Management</a></li>
                    <li><a href="#"><i class="fas fa-list"></i> Category Management</a></li>
                    <li><a href="reports.jsp"><i class="fas fa-chart-bar"></i> Reports</a></li>
                    <li><a href="feedback"><i class="fas fa-comment"></i> Feedback</a></li>
                    <li class="active"><a href="#"><i class="fas fa-chart-line"></i> Analytics</a></li>
                     <li><a href="Adminlogin.jsp"><i class="fas fa-sign-out-alt"></i> Log out</a></li>
                </ul>
            </nav>
            
        </div>

       

        <div class="main-content" id="mainContent">
           

            <header class="header">
            
                <div class="menu-toggle" id="menuToggle">
                    <i class="fas fa-bars"></i>
                </div>
                
                <h1>Analytics</h1>
                
                <div class="user-info">
                
                    <div class="user-img">
                        <img src="IMG/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_5247852.jpg" alt="Admin">
                    </div>
                    
                    <span>Admin</span>
                    
                </div>
                
                <div class="time">12:09:48 AM</div>
                
            </header>
            
            
    <div class="dashboard-container">
    
        <div class="analytics-card">
        
            <div class="card-header">
            
                <div class="header-content">
                
                    <div class="title-section">
                    
                        <h1>Analytics Overview</h1>
                        
                        <p class="subtitle">View and analyze your performance metrics</p>
                        
                    </div>
                    
                    <div class="time-period-tabs">
                        <div class="tabs-list">
                            <button class="tab-trigger active" data-period="daily">Daily</button>
                            <button class="tab-trigger" data-period="weekly">Weekly</button>
                            <button class="tab-trigger" data-period="monthly">Monthly</button>
                        </div>
                    </div>
                    
                </div>
            </div>
            
            <div class="card-content">
            
                <div class="controls-row">
                
                    <div class="control-group">
                    
                        <label for="chartType">Chart Type</label>
                        
                        
                        <div class="select-wrapper">
                            <select id="chartType" class="form-select">
                                <option value="bar">Bar Chart</option>
                                <option value="line">Line Chart</option>
                                <option value="pie">Pie Chart</option>
                                <option value="doughnut">Doughnut</option>
                            </select>
                            
                            <div class="select-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m6 9 6 6 6-6"/></svg>
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="control-group">
                    
                        <label for="datePicker">Date Range</label>
                        
                        <div class="date-picker-wrapper">
                        
                            <input type="date" id="datePicker" class="form-input">
                            
                            <div class="date-icon">
                            
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="18" x="3" y="4" rx="2" ry="2"/><line x1="16" x2="16" y1="2" y2="6"/><line x1="8" x2="8" y1="2" y2="6"/><line x1="3" x2="21" y1="10" y2="10"/></svg>
                            
                            </div>
                        </div>
                    </div>
                </div>

                <div class="chart-container" id="chartContainer">
                
                    <div class="chart-placeholder">
                    
                        <div class="chart-icon" id="chartIcon">
                        
                           

                            <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="18" x="3" y="3" rx="2"/><path d="M7 16V9"/><path d="M11 16v-5"/><path d="M15 16v-3"/><path d="M19 16v-2"/></svg>
                       
                        </div>
                        
                        <p class="chart-message">Bar chart will be displayed here</p>
                    
                        <p class="chart-date-info">Select a date to view data</p>
                        
                    </div>
                    
                    <canvas id="analyticsChart" style="display: none;"></canvas>
                    
                </div>

                <div class="metrics-grid">
                
                    <div class="metric-card">
                        <p class="metric-label">Total Views</p>
                        <p class="metric-value">12,543</p>
                        <p class="metric-change positive">↑ 12% from last period</p>
                    </div>
                    <div class="metric-card">
                        <p class="metric-label">Conversion Rate</p>
                        <p class="metric-value">3.2%</p>
                        <p class="metric-change negative">↓ 0.5% from last period</p>
                    </div>
                    <div class="metric-card">
                        <p class="metric-label">Average Time</p>
                        <p class="metric-value">4m 32s</p>
                        <p class="metric-change positive">↑ 25s from last period</p>
                    </div>
                    
                </div>
                
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="JS/analytics.js"></script>

   

     <div class="overlay" id="overlay"></div>

     <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
     <script src="JS/admin.js"></script>

</body>
</html>