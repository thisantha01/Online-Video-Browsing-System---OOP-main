
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
<link rel="stylesheet" href="CSS/Home.css">
<link rel="stylesheet" href="CSS/Log.css">
<script src="JS/script.js" defer></script>

<%
String m = (String) request.getAttribute("msg");
if (m != null) {
%>
<script>
    alert("<%= m.replace("\"", "\\\"").replace("\n", "").replace("\r", "") %>");
</script>
<%
}
%>

<style>
body::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: url('Images/logbg.jpg') no-repeat center center fixed;
	/* Set your image here */
	background-size: cover;
	opacity: 0.5; /* Adjust opacity here (0 to 1) */
	z-index: -1; /* Keeps the background behind the content */
}
</style>

</head>
<body>

	<div class="login-container">
		<h2>Welcome to Creator Hub</h2>
		<form action="login" method="POST">
			<input type="text" placeholder="Email" name="email"
				required> <input type="password" placeholder="Password"
				name="password" required>
			<button type="submit">Login</button>
		</form>
		<a href="Register.jsp" class="forgot-password">Not have account?</a>

		<div class="social-login">
			<img src="Images/socialimage/gmail.png" alt="Google Login"> <img
				src="Images/socialimage/fb.png" alt="Facebook Login">
		</div>
	</div>

</body>
</html>
