<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
    <title>Register</title>
    <link rel="stylesheet" href="CSS/Reg.css">
    <script src="JS/confirmpwd.js" defer></script>
    
    <style>
body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial, sans-serif;
        }

        /* Background image with opacity */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('Images/logbg.jpg') no-repeat center center fixed;
            background-size: cover;
            opacity: 0.5;
            z-index: -1;
        }
</style>

</head>
<body>

    <div class="container">
        <div class="register-form">
            <h1>Register</h1>
            
            <form action="addUser" method="post">

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter your username" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>
       
                    <small>Use Strong Password ! </small>
              
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
                
                  <div class="form-group">
                    <label for="confirm">Confirm-Password</label>
                    <input type="password" id="confirm" name="confirm" placeholder="Confirm your password" required>
                </div>
                
                <input type="hidden" id="confirm" name="phone" placeholder="phone" required value="Not inserted">
                <input type="hidden" id="confirm" name="status" placeholder="phone" required value="Not Verified">
                
                <input type="submit" value="Register" >
            </form>
            <div class="footer-text">
                <p>Already have an account? <a href="Login.jsp">Login here</a></p>
            </div>
        </div>
    </div>
</body>
</html>
