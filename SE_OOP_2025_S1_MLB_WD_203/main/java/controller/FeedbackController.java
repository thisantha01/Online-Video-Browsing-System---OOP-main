package controller;

import dao.FeedbackDAO;
import model.Feedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@SuppressWarnings("serial")

@WebServlet("/feedback")

public class FeedbackController extends HttpServlet {
    private FeedbackDAO feedbackDAO;

    @Override
    public void init() {
    	
        feedbackDAO = new FeedbackDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) 
        {
            action = "list"; //default
        }

        switch (action)
        {
            case "edit":
            	
                int id = Integer.parseInt(request.getParameter("id"));
                
			Feedback feedback = null;
			
			try {
				
				feedback = feedbackDAO.getFeedbackById(id);
				
			} catch (ClassNotFoundException e) 
			{


				e.printStackTrace();
			}
			
                request.setAttribute("feedback", feedback);
                request.getRequestDispatcher("feedback-edit.jsp").forward(request, response);
                break;
                

            case "delete":
            	
                int deleteId = Integer.parseInt(request.getParameter("id"));
                
			try {
				
				feedbackDAO.deleteFeedback(deleteId);
				
			} catch (ClassNotFoundException e) 
			{


				e.printStackTrace();
			}
                response.sendRedirect("feedback?action=list");
                break;
                
                

            case "list":
            	
            default:
            	
			List<Feedback> feedbackList = null;
			
			try {
				feedbackList = feedbackDAO.getAllFeedbacks();
				
			} catch (ClassNotFoundException e) 
			{


				e.printStackTrace();
			}
			
                request.setAttribute("feedbackList", feedbackList);
                request.getRequestDispatcher("feedback.jsp").forward(request, response);
                break;
        }
        
    }
    
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       
        String action = request.getParameter("action");

        //update
        
        if ("update".equals(action)) {
            
            int id = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String message = request.getParameter("message");
            String status = request.getParameter("status");

            Feedback feedback = new Feedback();
            feedback.setId(id);
            feedback.setUsername(username);
            feedback.setEmail(email);
            feedback.setMessage(message);
            feedback.setStatus(status);

            try {
				feedbackDAO.updateFeedback(feedback);
				
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			}
            response.sendRedirect("feedback?action=list");

        } else {
        	
            // Insert
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String message = request.getParameter("message");

            Feedback feedback = new Feedback();
            feedback.setUsername(username);
            feedback.setEmail(email);
            feedback.setMessage(message);
            feedback.setStatus("Pending"); 

            boolean isInserted = false;
            
			try {
				isInserted = feedbackDAO.insertFeedback(feedback);
				
			} catch (ClassNotFoundException e) 
			{
				e.printStackTrace();
				
			}

            if (isInserted) {
                response.sendRedirect("VideoServelet?action=list");
            } else {
                response.getWriter().println("Error submitting feedback.");
            }
            
            
        }
    }
    
    
    
}
