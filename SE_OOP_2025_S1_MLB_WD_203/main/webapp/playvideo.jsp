<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="model.Video" %>


<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Creator Hub</title>
<link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
<link rel="stylesheet" href="CSS/PlayVideo.css">
</head>
<body>
<header>
		<div class="header-left">
			<img src="Images/logo/LogoORG1.png" alt="Logo" class="logo">
			<h1 class="name">Creator Hub</h1>
		</div>


		<div class="header-center">
			<form class="search-form" action="search.jsp" method="get">
				<input type="text" placeholder="Search videos..." name="query"
					class="search-input">
				<button type="submit" class="search-button">Search</button>
			</form>
		</div>


		<div class="header-right">
			<div class="button-group">
				<button class="create-button" id = "createNew" ><span class="plus-icon">+</span> Create</button>
				
				<button class="create-button" onclick="Logout()">Log out</button>

			</div>
			
			<img src="Images/logo/user.png" alt="User" onclick="LoginPage()">
			<script>
			function Editpr() {
				  window.location.href = "Editprofile.jsp";
			}
			
			function Logout() {
				  alert("You have been logged out.");
				  window.location.href = "Logout.jsp";
				  // Add actual logout logic here
				}
			</script>
		</div>

	</header>

			<%
			    Video video = (Video) request.getAttribute("video");
			    if (video != null) {
			%>
				<div class="video-container">
				    <h2 class="video-title"><%= video.getTitle() %></h2>
				    <video class="main-video" controls>
				        <source src="VideoFileStream?videoID=<%=video.getVideoID() %>" type="video/mp4">
				        
				    </video>
				</div>
				
			<%
			    } else {
			%>
			    
			    <p>Video not found.</p>
			<%
			    }
			%>
			
					

				<div class="comments-section">
				    <h3>Comments</h3>
				    
				    
				  	<div class="comment-box">
						  <textarea placeholder="Add a public comment..."></textarea>
						  <br>
						  <button>Comment</button>
					</div>	
				    
				    <div class="comment">
				        <img src="Images/logo/user.png" class="comment-user-img" alt="User">
				        <div class="comment-content">
				            <span class="comment-username">Ayesh</span>
				            <p>This video is really helpful. Thanks for sharing!</p>
				        </div>
				    </div>
				    <div class="comment">
				        <img src="Images/logo/user.png" class="comment-user-img" alt="User">
				        <div class="comment-content">
				            <span class="comment-username">Nimesh</span>
				            <p>Great editing and quality! Looking forward to more content like this.</p>
				        </div>
				    </div>
				    <div class="comment">
				        <img src="Images/logo/user.png" class="comment-user-img" alt="User">
				        <div class="comment-content">
				            <span class="comment-username">Nilumi dakshika</span>
				            <p>Can we take a moment to appreciate the effort put into this? 👏</p>
				        </div>
				    </div>
				    <div class="comment">
				        <img src="Images/logo/user.png" class="comment-user-img" alt="User">
				        <div class="comment-content">
				            <span class="comment-username">Nilumi dakshika</span>
				            <p>Why isn’t this viral yet?! 😤👏</p>
				        </div>
				    </div>
				    <div class="comment">
				        <img src="Images/logo/user.png" class="comment-user-img" alt="User">
				        <div class="comment-content">
				            <span class="comment-username">Methma Sankalpani</span>
				            <p> Learned more in 10 minutes than in a whole semester 😂</p>
				        </div>
				    </div>				    				
				    <div class="comment">
				        <img src="Images/logo/user.png" class="comment-user-img" alt="User">
				        <div class="comment-content">
				            <span class="comment-username">Sadani dakshika</span>
				            <p>Who else is watching this in 2025? ✋</p>
				        </div>
				    </div>		
				    
				</div>


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

</body>
</html>
