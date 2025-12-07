<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Creator Hub-Profile Form</title>
    <link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
    <link rel="stylesheet" href="CSS/ProfileAccess.css">
</head>
<body>
    <div class="form-container">
        <h1>Profile Management</h1>
        <form id="profileForm" action="ProfileAccess" method="post">
            <div class="form-group">
                <label for="profile_id">Profile ID:</label>
                <input type="text" id="profile_id" name="profile_id" required>
            </div>
            
            <div class="form-group">
                <label for="profile_name">Profile Name:</label>
                <input type="text" id="profile_name" name="profile_name" required>
            </div>
            
            <div class="button-group">
                <button type="submit" class="btn submit-btn">Submit</button>
                <button type="button" id="createNew" class="btn new-btn">Create New Profile</button>
            </div>
        </form>
    </div>
    
    <script src="JS/ProfileAccess.js"></script>
</body>
</html>/