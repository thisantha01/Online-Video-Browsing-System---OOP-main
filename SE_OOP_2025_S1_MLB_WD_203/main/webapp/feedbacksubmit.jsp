<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <title>Submit Feedback</title>
    <link rel="stylesheet" href="CSS/feedbackForm.css">
    <link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
    
</head>

<body>

    <div class="form-container">
        <h2>Submit Your Feedback</h2>
        
        
     <form action="feedback" method="post">
     
    <div class="input-group">
        <label for="username">Your Name:</label>
        <input type="text" id="username" name="username" placeholder="Enter your name" required>
    </div>
    
    <div class="input-group">
        <label for="email">Your Email:</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required>
    </div>

    <div class="input-group">
        <label for="message">Your Feedback:</label>
        <textarea id="message" name="message" placeholder="Enter your feedback" required></textarea>
    </div>
    
    <button type="submit"  style="background-color: #222; color: white; padding: 10px 20px; border: none; 
			        border-radius: 5px; cursor: pointer; margin-top: 10px; margin-left: 5px;">
			        
			        Submit Feedback
			        
	</button>
    
	</form>


    </div>
    
    
</body>
</html>
