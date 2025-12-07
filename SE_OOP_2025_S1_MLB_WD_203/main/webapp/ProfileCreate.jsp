<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creator Hub-Create Profile</title>
    <link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
    <link rel="stylesheet" href="CSS/ProfileCreate.css">
</head>
<body>
    <div class="form-container">
        <h1>Create New Profile</h1>
        <form id="profileForm" action="ProfileCreate" method="post">
            <div class="form-group">
                <label for="creator_name">Creator Name*</label>
                <input type="text" id="creator_name" name="creator_name" required>
            </div>

            <div class="form-group">
                <label for="profile_name">Profile Name*</label>
                <input type="text" id="profile_name" name="profile_name" required>
            </div>

            <div class="form-group">
                <label for="email">Email*</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="bio">Bio</label>
                <textarea id="bio" name="bio" rows="4"></textarea>
            </div>

            <div class="form-group">
                <label>Gender</label>
                <div class="radio-group">
                    <label><input type="radio" name="gender" value="male"> Male</label>
                    <label><input type="radio" name="gender" value="female"> Female</label>
                    <label><input type="radio" name="gender" value="other"> Other</label>
                    <label><input type="radio" name="gender" value="" checked> Prefer not to say</label>
                </div>
            </div>

            <div class="button-group">
                <button type="submit" class="btn submit-btn">Save Profile</button>
                <button type="reset" class="btn reset-btn">Clear Form</button>
            </div>
        </form>
    </div>

    <!--  <script src="profile_script.js"></script> -->
</body>
</html>