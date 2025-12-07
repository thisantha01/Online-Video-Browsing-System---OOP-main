<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creator Hub-Update Profile</title>
    <link rel="stylesheet" href="CSS/ProfileCreate.css">
</head>
<body>

    <div class="form-container">
        <h1>Update The Profile</h1>
        <form id="profileForm" action="UpdateProfile" method="post">
            <div class="form-group">
                <label for="creator_name">Creator Name*</label>
                <input type="text" id="creator_name" name="creator_name" value="${param.creator_name}">
            </div>

            <div class="form-group">
                <label for="profile_name">Profile Name*</label>
                <input type="text" id="profile_name" name="profile_name" value="${param.profile_name}">
            </div>

            <div class="form-group">
			    <label for="profieID">Profile ID*</label>
			    <input type="text" id="profieID" value="${param.profieID}" readonly>
			    <input type="hidden" name="profieID" value="${param.profieID}">
			</div>


            <div class="form-group">
                <label for="email">Email*</label>
                <input type="email" id="email" value="${param.email}" readonly>
                <input type="hidden" name="email" value="${param.email}" >
            </div>
            
            <div class="form-group">
                <label for="bio">Bio</label>
                <textarea id="bio" name="bio" rows="4">${param.bio}</textarea>
            </div>

            <div class="form-group">
                <label>Gender</label>
                <div class="radio-group">
                    <label><input type="radio" name="gender" value="male" ${param.gender == 'male' ? 'checked' : ''}> Male</label>
                    <label><input type="radio" name="gender" value="female" ${param.gender == 'female' ? 'checked' : ''}> Female</label>
                    <label><input type="radio" name="gender" value="other" ${param.gender == 'other' ? 'checked' : ''}> Other</label>
                    <label><input type="radio" name="gender" value="" ${empty param.gender ? 'checked' : ''}> Prefer not to say</label>
                </div>
            </div>

            <div class="button-group">
                <button type="submit" class="btn submit-btn">Save Profile</button>
                <button type="reset" class="btn reset-btn">Clear Form</button>
            </div>
        </form>
    </div>
</body>
</html>