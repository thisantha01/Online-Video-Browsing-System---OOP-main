<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>
<link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
<link rel="stylesheet" href="CSS/Home.css">
<script src="JS/script.js" defer></script>

<style>

.about-container {
  max-width: 900px;
  margin: 0 auto;
  padding: 2rem;
  font-family: 'Segoe UI', sans-serif;
  background: #ffffff;
  border-radius: 10px;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
  line-height: 1.6;
  color: #333;
}

.about-container h1, .about-container h2, .about-container h3 {
  color: #2c3e50;
}

.about-container ul {
  list-style: none;
  padding: 0;
}

.about-container ul li::before {
  content: "  ";
  margin-right: 0.5rem;
}

.about-container section {
  margin-bottom: 2rem;
}


</style>

</head>

<body>
	<header>
		<div class="header-left"><a href="Adminlogin.jsp">
			<img src="Images/logo/LogoORG1.png" alt="Logo" class="logo"></a>
			<h1 class="name">Creator Hub</h1>
		</div>


		
	</header>
	
	

	<div class="content-wrapper">
		<nav class="sidebar">
			<ul class="sidebar-menu">
				<li ><a href="GuestHome.jsp"><img
						src="Images/logo/home-icon.png" alt="Home"> Home</a></li>
				<li><a href="#"><img src="Images/logo/music-icon.png"
						alt="Music"> Music</a></li>
				<li><a href="#"><img src="Images/logo/film-icon.png"
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
				<li class="active"><a href="About.jsp"><img src="Images/logo/info.png" alt="About">
						About</a></li>
				<li><a href="Contact.jsp"><img src="Images/logo/contact.png"
						alt="Contact"> Contact</a></li>
			</ul>
		</nav>

		<main class="main-content">
		
		
		
		
		
		
		
			<div class="video-container">
			

<main class="about-container">

<div style="text-align: center">
			<img src="Images/logo/LogoORG1.png" alt="Logo" style="width:140px;">
			
		</div><br>
		
  <section class="intro" style="text-align: center">
    <h1>About Creator Hub</h1>
    <p>
      <strong>Creator Hub</strong> is your go-to online video browsing platform where you can watch, download, and upload videos with ease. Our mission is to connect creators and viewers through seamless and accessible video content.
    </p>
  </section>

  <section class="features">
    <h2>Key Features</h2>
    <ul>
      <li>Watch your favorite videos and livestreams — no registration required.</li>
      <li>Download content for offline viewing (Registered Users).</li>
      <li>Upload videos and share your creativity with the world.</li>
      <li>Search for trending content with ease.</li>
      <li>Like, rate, comment, and report videos (Registered Users).</li>
      <li>View your browsing history and manage your profile.</li>
      <li>Upgrade to <strong>Premium</strong> for an ad-free experience.</li>
    </ul>
  </section>

  <section class="user-types">
    <h2>User Roles and Permissions</h2>

    <h3>Registered Users</h3>
    <p>Access full functionality: download, comment, like, rate and report videos. Reset passwords and edit profiles anytime.</p>

    <h3>Content Creators</h3>
    <p>Upload and manage your own videos. Share original content and connect with your audience.</p>

    <h3>Technical Support</h3>
    <p>Handle reports, manage user issues, process copyright claims and suspend accounts when necessary.</p>

    <h3>Moderators</h3>
    <p>Ensure platform safety by reviewing uploaded content and moderating user activity.</p>

    <h3>Administrators</h3>
    <p>Oversee the platform’s integrity — manage moderators, update system settings and monitor platform security.</p>
  </section>

  <section class="closing">
    <p>
      At <strong>Creator Hub</strong>, we believe in empowering both viewers and creators. Whether you're here to watch, create, or moderate, we provide the tools to make your experience safe and enjoyable.
    </p>
  </section>
</main>


				
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