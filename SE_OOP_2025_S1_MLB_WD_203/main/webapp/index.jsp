<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Content Moderator - Home</title>
    <link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 350px;
            text-align: center;
        }
        h1 {
            color: #2c3e50;
            margin-bottom: 30px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            background: #2c3e50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #34495e;
        }
        .login-form {
            margin-top: 20px;
            display: none;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .error {
            color: red;
            margin-bottom: 15px;
        }
        .success {
            color: green;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Content Moderator Portal</h1>
        
        <% if(request.getParameter("error") != null) { %>
            <div class="error">Invalid moderator ID or password. Please try again.</div>
        <% } %>
        
        <% if(request.getParameter("registration") != null) { %>
            <div class="success">Registration successful! Please login.</div>
        <% } %>
        
        <div id="options">
            <a href="#" class="btn" onclick="showLogin()">Login</a>
            <a href="modregister.jsp" class="btn">Register</a>
        </div>
        
        <div id="loginForm" class="login-form">
            <form action="loginServ" method="post">
                <div class="form-group">
                    <label for="modid">Moderator ID</label>
                    <input type="number" id="modid" name="modid" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <button type="submit" class="btn">Login</button>
            </form>
        </div>
    </div>
    
    <script>
        function showLogin() {
            document.getElementById('options').style.display = 'none';
            document.getElementById('loginForm').style.display = 'block';
        }
    </script>
</body>
</html>