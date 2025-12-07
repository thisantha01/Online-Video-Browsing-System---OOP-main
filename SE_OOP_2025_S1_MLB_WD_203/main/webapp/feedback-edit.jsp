<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <title>Review Feedback</title>
    <link rel="stylesheet" href="CSS/feedback.css">
    <link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
    
</head>

<body>

    <div class="form-container">
        <h2> Feedback</h2>
        
        <form action="feedback" method="post">
           
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${feedback.id}">

            
            <div class="input-group">
                <label for="username">Name:</label>
                <input type="text" id="username" name="username" value="${feedback.username}" required>
            </div>

       
            <div class="input-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${feedback.email}" required>
            </div>

        
            <div class="input-group">
                <label for="message">Feedback:</label>
                <textarea id="message" name="message" required>${feedback.message}</textarea>
            </div>

            <div class="input-group">
				    <label for="status" style="margin-bottom: 5px; display: block;">Status:</label>
				    
				    <select id="status" name="status" 
				    
				        style="padding: 5px; width: 100%; max-width: 250px; border: 1px solid #ccc; border-radius: 4px;">
				        <option value="Pending" ${feedback.status == 'Pending' ? 'selected' : ''}>Pending</option>
				        <option value="Reviewed" ${feedback.status == 'Reviewed' ? 'selected' : ''}>Reviewed</option>
				        <option value="Resolved" ${feedback.status == 'Resolved' ? 'selected' : ''}>Resolved</option>
				        
				    </select>
			</div>

			
			<div class="input-group">
			
			    <button type="submit" style="background-color: #222; color: white; padding: 10px 20px; border: none; 
			        border-radius: 5px; cursor: pointer; margin-top: 10px; margin-left: 5px;">
			        
			        Update Feedback
			        
			    </button>
			    
			</div>

</body>
</html>
