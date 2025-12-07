<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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








		<div class="header-right">
			<div class="button-group">

				<button class="signup-button" onclick="history.back()">Cancel</button>
			</div>

		</div>

	</header>






<table class="table" style="width: 90%; margin: 40px auto; border-collapse: collapse; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
    <thead style="background-color: #f4f4f4;">
        <tr style="text-align: left;">
            <th style="padding: 12px;">Thumbnail</th>
            <th style="padding: 12px;">Film Name</th>
            <th style="padding: 12px;">Description</th>
        </tr>
    </thead>
    <tbody>
    
        <c:forEach var="f1" items="${listfilm}">
            <tr style="border-bottom: 1px solid #ddd;">
                <td style="padding: 12px;">
                    <img src="data:image/png;base64,${f1.base64Thumbnail}" width="200" height="280" style="object-fit: cover; border-radius: 6px;" />
                </td>
                <td style="padding: 12px; font-weight: bold; font-size: 18px;">${f1.filmname}</td>
                <td style="padding: 12px;">${f1.description}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>


	
	
	
	
	<main class="main-content"></main>


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

	</script>

</body>
</html>