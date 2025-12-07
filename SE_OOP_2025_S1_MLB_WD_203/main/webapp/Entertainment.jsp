<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	<header>
		<div class="header-left">
			<img src="Images/logo/LogoORG1.png" alt="Logo" class="logo">
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
				<button class="create-button" onclick="CreatePage()"><span class="plus-icon">+</span> Create</button>
				
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

	<div class="content-wrapper">
		<nav class="sidebar">
			<ul class="sidebar-menu">
				<li><a href="Home.jsp"><img
						src="Images/logo/home-icon.png" alt="Home"> Home</a></li>
				<li><a href="#"><img src="Images/logo/music-icon.png"
						alt="Music"> Music</a></li>
				<li  class="active"><a href="Entertainment.jsp"><img src="Images/logo/film-icon.png"
						alt="Entertainment"> Movies</a></li>
				<li><a href="#"><img src="Images/logo/Education-icon.png"
						alt="Education"> Education</a></li>
				<li><a href="#"><img src="Images/logo/tech.png"
						alt="Technology"> Technology</a></li>
				<li><a href="#"><img src="Images/logo/food.png" alt="Food">
						Food</a></li>
				<li><a href="#"><img src="Images/logo/trending.png"
						alt="Trending"> Trending</a></li>
				<li><a href="#"><img src="Images/logo/vip.png" alt="VIP">
						VIP</a></li>
				<li><a href="#"><img src="Images/logo/settings-icon.png"
						alt="Settings"> Settings</a></li>
				<li ><a href="About.jsp"><img src="Images/logo/info.png" alt="About">
						About</a></li>
				<li><a href="#"><img src="Images/logo/contact.png"
						alt="Contact"> Contact</a></li>
			</ul>
		</nav>

		<main class="main-content" >
			<div class="video-container" >
				<section class="video-grid">
					<div class="video-item" >
						<img src="thumbnail/Film/how-to-train-your-dragon-movie-poster-md.webp" alt="Video Thumbnail" style="height:400px">
						<h3>How to Train Your Dragon 2025</h3>
					</div>
					<div class="video-item">
						<img src="thumbnail/Film/the-amateur-movie-poster-md.webp" alt="Video Thumbnail" style="height:400px">
						<h3>The Amateur 2025</h3>
					</div>
					<div class="video-item">
						<img src="thumbnail/Film/superman-movie-poster-md.webp" alt="Video Thumbnail" style="height:400px">
						<h3>Superman 2025</h3>
					</div>
					<div class="video-item">
						<img src="thumbnail/Film/dog-man-movie-poster-md.webp" alt="Video Thumbnail" style="height:400px">
						<h3>Dog Man 2025</h3>
					</div>
					<div class="video-item">
						<img src="thumbnail/Film/wolf-man-movie-poster-md.webp" alt="Video Thumbnail" style="height:400px">
						<h3>Wolf Man 2025</h3>
					</div>
					<div class="video-item">
						<img src="thumbnail/Film/karate-kid-legends-movie-poster-md.webp" alt="Video Thumbnail" style="height:400px">
						<h3>Karate Kid: Legends 202</h3>
					</div>
					<div class="video-item">
						<img src="thumbnail/Film/f1-movie-poster-md.webp" alt="Video Thumbnail" style="height:400px">
						<h3>F1 2025</h3>
					</div>
					<div class="video-item">
						<img src="thumbnail/Film/love-hurts-movie-poster-md.webp" alt="Video Thumbnail" style="height:400px">
						<h3>Love Hurts 2025</h3>
					</div>
					<div class="video-item">
						<img src="thumbnail/Film/ballerina-movie-poster-md.webp" alt="Video Thumbnail" style="height:400px">
						<h3>Ballerina 2025</h3>
					</div>
					<div class="video-item">
						<img src="thumbnail/Film/final-destination-bloodlines-movie-poster-md.webp" alt="Video Thumbnail" style="height:400px">
						<h3>Final Destination: Bloodlines 2025</h3>
					</div>
					<div class="video-item">
						<img src="thumbnail/Film/28-years-later-movie-poster-md.webp" alt="Video Thumbnail" style="height:400px">
						<h3>28 Years Later 2025</h3>
					</div>
					<div class="video-item">
						<img src="thumbnail/Film/Nelum Kuluna.jpg" alt="Video Thumbnail" style="height:400px">
						<h3>Nelum Kuluna 2025</h3>
					</div>

				</section>

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
	</script>

</body>
</html>