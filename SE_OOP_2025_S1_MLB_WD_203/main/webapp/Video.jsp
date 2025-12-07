<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Creator Hub - Videos</title>
<link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
<link rel="stylesheet" href="CSS/Video.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
	<div class="app-container">
		<!-- Vertical Navigation -->
		<nav class="sidebar">
			<div class="branding">
				<img src="Images/logo/LogoORG1.png" alt="HTML5 Icon"
					style="width: 128px; height: 128px;">
				<h1>CREATOR HUB</h1>
				<p class="dashboard-label">Dashboard</p>
			</div>

			<ul class="nav-items">
				<li class="nav-item "><a href="Profile.jsp"><span
						class="icon">👤</span> Profile</a></li>
				<li class="nav-item active"><a href="#"><span class="icon">🎬</span>
						Videos</a></li>
				<li class="nav-item"><a href="#"><span class="icon">💬</span>
						Comments</a></li>
				<li class="nav-item"><a href="#"><span class="icon">📊</span>
						Analytics</a></li>
				<li class="nav-item"><a href="#"><span class="icon">💰</span>
						Revenue</a></li>
			</ul>
		</nav>



		<div class="main-content">
			<h1>Your Profile ID: ${sessionScope.profieID}</h1>

			<form action="UploadVideo.jsp" method="post">
				<input type="hidden" name="profieID"
					value="${sessionScope.profieID}">
				<div class="action-buttons">
					<input type="submit" value="+ Upload Video" class="btn btn-upload">
				</div>
			</form>

			<form action="VideoServelet">
				<div class="action-buttons">
					<input type="submit" value="Logout" class="btn btn-logout">
				</div>
			</form>

			<p class="video-count">Total Videos: ${videoList.size()}</p>

			<div class="video-grid">
				<c:forEach var="vid" items="${videoList}">
					<div class="video-card">
						<img src="Thumbnail?videoID=${vid.videoID}" class="video-thumb"
							alt="">
						<h3>${vid.title}</h3>
						<p>ID: ${vid.videoID}</p>
						<div class="action-buttons">
							<form action="#" method="post">
								<input type="hidden" name="videoID" value="${vid.videoID}">
								<input type="submit" value="Change Video" class="btn btn-change">
							</form>
							<form action="DeleteVideo" method="post">
								<input type="hidden" name="videoID" value="${vid.videoID}">
								<input type="submit" value="Delete Video" class="btn btn-delete">
							</form>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>






	</div>

</body>
</html>