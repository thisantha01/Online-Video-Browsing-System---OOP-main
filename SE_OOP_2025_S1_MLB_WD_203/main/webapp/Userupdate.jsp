<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

<c:set var="ur" value="${userget}"/>

	<header>
		<div class="header-left">
			<img src="Images/logo/LogoORG1.png" alt="Logo" class="logo">
			<h1 class="name">Creator Hub</h1>
		</div>

		<div class="header-right"
			style="display: flex; justify-content: flex-end; gap: 10px;">
			<div class="button-group">
				<form action="deleteUserone" method="post" id="deleteForm">
					<input type="hidden" name="email" value="${param.email}"> 
					
					<input type="hidden" name="id" value="${param.id}">
					
					<button type="submit" class="create-button" onclick="Delete()" style="background-color: red; color: white;">Delete
						Account</button>
					<script>
      function Delete() {
    	  document.getElementById("deleteForm").addEventListener("submit", function(event) {
    		  let confirmed = confirm("Are you sure you want to delete this user?");
    		  if (!confirmed) {
    		    event.preventDefault(); // Stop form submission
    		  }});
      }
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
                
                <h2>${param.username}</h2>
                <p>${param.email}</p>
                <p>ID: ${param.id}</p>
            </div>
        
        
              
     
        <div class="form-column" >
      
                <label for="status">Status: <span id="statusText">${param.status}</span></label><br><br>

                <label for="email">Email Address: ${param.email}</label><br><br>          
           
                    
             
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var statusEl = document.getElementById("statusText");
            var status = statusEl.textContent.trim();  // Get the text content of the span

            if (status === "Not Verified") {
                statusEl.style.color = "red";  // Red color for "Not Verified"
            } else if (status === "Verified") {
                statusEl.style.color = "green";  // Green for "Verified"
            }
        });
    </script>
    
   
   <form action="homeUser" method ="post">
             
                <div class="form-group-landscape">
               	    
                    <label for="username">Username: ${param.username}</label>
                    <input type="text" id="username" name="username" value="${param.username}" placeholder="Enter new Username" disabled>
                    
                <br>
               
                
                    <label for="currentPassword">Current Password: ${param.password}</label>
                    <input type="text" id="currentPassword" name="password" value="${param.password}" placeholder="Enter new password" disabled>
                    
                <br>
                
                               
                
                    <label for="currentPassword">Phone Number: ${param.phone}</label>
                    <input type="text" id="currentPassword" name="phone" value="${param.phone}" placeholder="Enter phone number" disabled>
                   
                </div>
               

       </form>  
                     <button type="submit" onclick="window.history.back()" class="create-button"   >Edit Profile</button>
                

                </div>
            </div>
        </div>
    
    <div class="button-panel">
    
    <form action="homeUser" method ="post">
    	<input type="hidden" id="username" name="username" value="${param.username}" placeholder="Enter new Username" >
    	<input type="hidden" id="username" name="email" value="${param.email}" placeholder="Enter new Username" >
    	<input type="hidden" id="currentPassword" name="password" value="${param.password}" placeholder="Enter new password">
                    
        <button type="submit" class="create-button" style="background-color: green;" >Save Changes</button><br><br>
     </form>  
     
    </div>
    <div class="button-panel">
    
    </div>>
    
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
    function previewImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                var img = document.getElementById('avatarPreview');
                img.src = e.target.result;
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    function CreatePage() {
        console.log("Delete Account clicked");
    }
    function AdsPage() {
        console.log("Ad clicked");
    }
    function Logout() {
        alert("You have been logged out.");
        window.location.href = "Logout.jsp";
    }
  
</script>
</body>

</html>
