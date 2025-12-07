<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*, model.Video"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreatorHub</title>
<link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
<link rel="stylesheet" href="CSS/Home.css">
<script src="JS/script.js" defer></script>

</head>
<body>
	<c:set var="ur" value="${userget}" />
	<header>
		<div class="header-left">
			<a href = "VideoServelet" ><img src="Images/logo/LogoORG1.png" alt="Logo" class="logo"> </a>
			<h1 class="name">Creator Hub</h1>
		</div>


		<div class="header-center">
			<form class="search-form" action="searchVideo" method="post">
				<input type="text" placeholder="Search videos..." name="search"
					class="search-input">
				<button type="submit" class="search-button">Search</button>
			</form>
		</div>


		<div class="header-right">
			<div class="button-group">
				<c:set var="ur" value="${userget}" />
				<button class="create-button" id="createNew">
					<span class="plus-icon">+</span> Create
				</button>

				<button class="create-button" onclick="Logout()">Log out</button>

				<h5>${param.username}</h5>

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

	<div class="content-wrapper">
		<nav class="sidebar">
			<ul class="sidebar-menu">
				<li class="active"><a href="Home.jsp"><img
						src="Images/logo/home-icon.png" alt="Home"> Home</a></li>
				<li><a href="#"><img src="Images/logo/music-icon.png"
						alt="Music"> Music</a></li>
				<li><a href="Entertainment.jsp"><img
						src="Images/logo/film-icon.png" alt="Entertainment">
						Movies</a></li>
				<li><a href="#"><img src="Images/logo/Education-icon.png"
						alt="Education"> Education</a></li>
				<li><a href="#"><img src="Images/logo/tech.png"
						alt="Technology"> Technology</a></li>
				<li><a href="#"><img src="Images/logo/food.png" alt="Food">
						Food</a></li>
				<li><a href="#"><img src="Images/logo/trending.png"
						alt="Trending"> Trending</a></li>
				<li><a href="feedbacksubmit.jsp"><img src="Images/logo/vip.png" alt="VIP">
						Feedback</a></li>
				<li><a href="#"><img src="Images/logo/settings-icon.png"
						alt="Settings"> Settings</a></li>
				<li><a href="About.jsp"><img src="Images/logo/info.png"
						alt="About"> About</a></li>
				<li><a href="#"><img src="Images/logo/contact.png"
						alt="Contact"> Contact</a></li>
			</ul>
		</nav>

		<main class="main-content">
			<div class="video-container">
				<section class="video-grid">

					<div class="video-item">
						<a href="https://www.youtube.com"> <img
							src="thumbnail/How do GPUs work.jpg" alt="Video Thumbnail"></a>
						<h3>How do GPUs work - TWS</h3>
					</div>

					<div class="video-item">
						<a href="https://www.youtube.com/watch?v=tKjQkQ4GJg8"> <img
							src="thumbnail/thisantha1.jpg" alt="Video Thumbnail"></a>
						<h3>What is variable in C language</h3>
					</div>
					<div class="video-item">
						<a href="https://www.youtube.com"> <img
							src="thumbnail/Drill team - Dewiyan bare.jpg"
							alt="Video Thumbnail"></a>
						<h3>Deviyange bare - Drill team</h3>
					</div>
					<div class="video-item">
						<a href="https://www.youtube.com/watch?v=U7SThySGUO4"> <img
							src="thumbnail/Jodu dala yam.png" alt="Video Thumbnail"></a>
						<h3>Jodu dala Yan remix - Task Beatz</h3>
					</div>
					<div class="video-item">
						<a href="https://www.youtube.com"> <img
							src="thumbnail/Aasa Kooda(Dance cover).jpg" alt="Video Thumbnail"></a>
						<h3>Aasa Kooda (Dance cover) - AKD</h3>
					</div>
					<div class="video-item">
						<a href="https://www.youtube.com"> <img
							src="thumbnail/How to make pani walalu.jpg" alt="Video Thumbnail"></a>
						<h3>How to make pani walalu - Ape amma</h3>
					</div>
					<div class="video-item">
						<a href="https://www.youtube.com"> <img
							src="thumbnail/Are you redy 5g.jpg" alt="Video Thumbnail"></a>
						<h3>Are you redy 5G - Chanux Orb</h3>
					</div>
					<div class="video-item">
						<a href="https://www.youtube.com"> <img
							src="thumbnail/Upcomming Technology 2025.jpg"
							alt="Video Thumbnail"></a>
						<h3>Upcomming Technology 2025 - TWS</h3>
					</div>
				</section>
				
				
			<div class="udeep-content">
        		<div class="video-grid">
            <% 
                List<Video> videos = (List<Video>) request.getAttribute("videoList");
                if (videos != null && !videos.isEmpty()) {
                    for (Video v : videos) {
            %>
                        
                        <div class="video-item">
                        <div class="udeep-video-card">
                            <a href="PlayVideoServlet?videoID=<%=v.getVideoID()%>" target="_blank">
                               
                                
                                <img src="AllThumnailInHome?videoID=<%=v.getVideoID()%>" class="video-thumbnail" alt="Video Thumbnail">
                             	
                             </a>    
                                                        
                                <div class="video-info">
                                    <h3><div class="video-title"><%= v.getTitle() %></div></h3>
                                    <div class="video-duration">5:30</div>
                                </div>

                        </div>
                        </div>
            <%
                    }
                } else {
            %>
                <div class="no-videos">
                    <img src="Images/logo/no-videos.png" alt="No videos" class="no-video-image">
                    <p>No Upload videos available to display.</p>
                </div>
            <%
                }
            %>
        	</div>
    		</div>				

				

				<div id="adsPreviewBox">
					<h3>Sponsored</h3>
					<div class="ad-content">
						<p>Ad Preview: Get Premium Account.</p>
						<img src="Images/AD2.png" alt="Ad image" width=500px border="2px"
							onclick="AdsPage()">
					</div>
				</div>




			</div>
		</main>
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

	<script>
		// Add active class to clicked nav item
		document.querySelectorAll('.sidebar-menu li').forEach(item => {
			item.addEventListener('click', function() {
				document.querySelectorAll('.sidebar-menu li').forEach(i => {
					i.classList.remove('active');
				});
				this.classList.add('active');
			});
		});
		
		document.addEventListener('DOMContentLoaded', function() {
		    // Handle Create New Profile button click
		    document.getElementById('createNew').addEventListener('click', function() {
		        // Navigate to the new create content profile JSP page
		        window.location.href = 'ProfileAccess.jsp';
		    });
		});
	</script>


</body>
</html>