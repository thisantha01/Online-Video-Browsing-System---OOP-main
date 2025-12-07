<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">


<link rel="stylesheet" href="CSS/Edit.css">
<script src="JS/script.js" defer></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>

<c:set var="ur" value="${userget}" />
	<header>
		<div class="header-left">
			<img src="Images/logo/LogoORG1.png" alt="Logo" class="logo">
			<h1 class="name">Creator Hub</h1>
		</div>

		<div class="header-right"
			style="display: flex; justify-content: flex-end; gap: 10px;">
			<div class="button-group">
				<form action="deleteUserone" method="post" id="deleteForm">
					<input type="hidden" name="email" value="${ur.email}"> <input
						type="hidden" name="id" value="${ur.id}">
					<button type="submit" class="create-button" onclick="Delete()"
						style="background-color: red; color: white;">Delete
						Account</button>
					<script>
      function Delete() {
    	  document.getElementById("deleteForm").addEventListener("submit", function(event) {
    		  let confirmed = confirm("Are you sure you want to delete this user?");
    		  if (!confirmed) {
    		    event.preventDefault(); // Stop form submission
    		  }});
      }
      
      
    //verify js(text color changer)
      document.addEventListener("DOMContentLoaded", function () {
          var statusEl = document.getElementById("statusText");
          var status = statusEl.textContent.trim();
          if (status === "Not Verified") {
              statusEl.style.color = "red";
          } else if (status === "Verified") {
              statusEl.style.color = "green";
          }
      });
      </script>
				</form>
			</div>

			<div>
				<button class="create-button" onclick="Logout()">Log out</button>
				<script>
      function Logout() {
    	    alert("You have been logged out.");
    	    window.location.href = "Logout.jsp";
    	}
      </script>
			</div>
		</div>
	</header>


	<main>
    <div class="container">
        <div class="form-columns">
        
            <div class="profile-picture-section">
                    
            
                <label for="profilePicture">
                    <img src="Images/Update profile.png" alt="User Avatar" class="avatar" id="avatarPreview">
                </label>
                <input type="file" id="profilePicture" name="profilePicture" accept="image/*" style="display: none;" onchange="previewImage(this)">
                
                <h2>${ur.username}</h2>
                <p>${ur.email}</p>
                <p>ID: ${ur.id}</p>
            </div>

            <div class="form-column">
                <form action="updateUser" method="post">
                  
                    <input type="hidden" name="email" value="${ur.email}" readonly>

                    <label>Status:</label>
                    <span id="statusText"> ${ur.status} </span><br><br>
                    
                    <label for="email">Email Address: ${param.email}</label> <br><br>

                    <label>Username: ${ur.username}</label>
                    <input type="text" name="username" value="${ur.username}" placeholder="Enter new Username">

                    <label>Password: ${ur.password}</label>
                    <input type="text" name="password" value="${ur.password}" placeholder="Enter new Password">

                    <label>Phone: ${ur.phone}</label>
                    <input type="tel" id="phone" name="phone"  placeholder="Enter phone number">

                    <input type="hidden" name="id" value="${ur.id}">
                    
                   
                    <input type="hidden" name="status" value="Verified" value="${ur.status }" >

                    <div class="button-panel">
                        <button type="submit" class="create-button">Save Changes</button>
                        <button type="button" class="create-button" onclick="window.location.href='Home.jsp'">Cancel</button>
                        
                        <button type="button" class="create-button" style="background-color: blue;" id="submitBtn">Verify</button>
                        <script>
                        
                      //phone number verify
                        const submitBtn = document.getElementById('submitBtn');

                        submitBtn.addEventListener('click', function (event) {
                            const phone = document.getElementById('phone').value.trim();

                            if (phone === "") {
                                alert("Please Enter Phone number to verify account.");
                                event.preventDefault();
                            }else{
                            	alert("User verify successfully");
                            }
                            
                            alert("Refresh your web browser !");
                        });

                        
                        
                        </script>
                    
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>

	<footer class="site-footer">
		<div class="footer-container">
			<div class="footer-column">
				<h3>About Us</h3>
				<p>We offer the best video browsing experience with high-quality
					content from creators around the world.</p>
			</div>

			<div class="footer-column">
				<h3>Quick Links</h3>
				<ul class="footer-links">
					<li><a href="#">Home</a></li>
					<li><a href="#">Categories</a></li>
					<li><a href="#">Popular Videos</a></li>
					<li><a href="#">Contact Us</a></li>
					<li><a href="#">Terms of Service</a></li>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Cookie Policy</a></li>
					<li><a href="#">DMCA</a></li>
				</ul>
			</div>

			<div class="footer-column">
				<h3>Follow Us</h3>
				<ul class="footer-socials">
					<li><a href="#">Facebook</a></li>
					<li><a href="#">Twitter</a></li>
					<li><a href="#">Instagram</a></li>
					<li><a href="#">YouTube</a></li>
				</ul>
			</div>
		</div>

		<div class="footer-bottom">
			<p>&copy; 2025 Creator Hub. All rights reserved.</p>
		</div>
	</footer>

<script>

//user profile picture input js
function previewImage(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('avatarPreview').src = e.target.result;
        }
        reader.readAsDataURL(input.files[0]);
    }
}

//onclicks
function Logout() {
    alert("You have been logged out.");
    window.location.href = "Logout.jsp";
}
function Delete() {
	document.getElementById("deleteForm").addEventListener("submit", function(event) {
		  let confirmed = confirm("Are you sure you want to delete this user?");
		  if (!confirmed) {
		    event.preventDefault(); // Stop form submission
		  }
}

function Delete() {
	
    let result = confirm("Are you sure you want to delete this user?");
    if (result) {
        // User clicked 'Yes' (OK)
        alert("User will be deleted.");
    } else {
        // User clicked 'No' (Cancel)
        alert("Action canceled.");
    }
}
	}





</script>

</body>
</html>
